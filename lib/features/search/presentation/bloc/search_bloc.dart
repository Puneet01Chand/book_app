import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/search/data/models/search_book_request_model.dart';
import 'package:new_project/features/search/domain/usecases/search_book_use_case.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchBooksUseCase searchBooksUseCase;
  Timer? _debounceTimer;

  SearchBloc({required this.searchBooksUseCase})
      : super(const SearchState.initial()) {
    on<SearchStarted>(_onStarted);
    on<SearchClear>(_onClear);
    on<SearchRefresh>(_onRefresh);
  }

  Future<void> _onStarted(
      SearchStarted event,
      Emitter<SearchState> emit,
      ) async {
    final query = event.query.trim();

    // Handle empty query
    if (query.isEmpty) {
      emit(const SearchState.initial());
      return;
    }

    // Cancel any existing timer
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    // Create a completer for debouncing
    final completer = Completer<void>();

    // Set up debounce timer (500ms)
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      emit(const SearchState.loading());

      try {
        final request = SearchBooksRequest(query: query);
        final result = await searchBooksUseCase(request: request);

        if (!emit.isDone) {
          result.fold(
                (failure) {
              emit(SearchState.error(failure.message));
            },
                (searchResult) {
              if (searchResult.books.isEmpty) {
                emit(SearchState.empty(query));
              } else {
                emit(SearchState.success(
                  books: searchResult.books,
                  totalItems: searchResult.totalItems,
                  query: query,
                ));
              }
            },
          );
        }

        completer.complete();
      } catch (e) {
        if (!emit.isDone) {
          emit(SearchState.error('An unexpected error occurred: ${e.toString()}'));
        }
        completer.complete();
      }
    });

    await completer.future;
  }

  Future<void> _onClear(
      SearchClear event,
      Emitter<SearchState> emit,
      ) async {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }
    emit(const SearchState.initial());
  }

  Future<void> _onRefresh(
      SearchRefresh event,
      Emitter<SearchState> emit,
      ) async {
    final currentState = state;
    if (currentState is SearchSuccessState) {
      add(SearchEvent.started(currentState.query));
    }
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
