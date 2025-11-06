import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_project/features/search/domain/entities/book_entity.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = SearchInitialState;
  const factory SearchState.loading() = SearchLoadingState;
  const factory SearchState.success({
    required List<BookEntity> books,
    required int totalItems,
    required String query,
  }) = SearchSuccessState;
  const factory SearchState.empty(String query) = SearchEmptyState;
  const factory SearchState.error(String message) = SearchErrorState;
}
