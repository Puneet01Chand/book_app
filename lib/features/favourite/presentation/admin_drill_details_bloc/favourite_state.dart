part of 'favourite_bloc.dart';

sealed class FavouriteState {}

class FavouriteInitialState extends FavouriteState {}
class FavouriteLoadingState extends FavouriteState {}

class FavouriteSuccessState extends FavouriteState {
  // final YourData data;
  // FavouriteSuccessState(this.data);
}

class FavouriteErrorState extends FavouriteState {
  final String message;
  FavouriteErrorState(this.message);
}