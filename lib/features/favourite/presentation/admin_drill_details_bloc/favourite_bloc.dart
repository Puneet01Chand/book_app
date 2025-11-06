import 'package:flutter_bloc/flutter_bloc.dart';
part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitialState()) {
    on<FavouriteStarted>((event, emit) async {
      try {
        // Simulate logic
        emit(FavouriteSuccessState());
      } catch (e) {
        emit(FavouriteErrorState(e.toString()));
      }
    });
  }
}