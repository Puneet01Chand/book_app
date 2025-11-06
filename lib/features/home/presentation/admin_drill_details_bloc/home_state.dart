part of 'home_bloc.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}
class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  // final YourData data;
  // HomeSuccessState(this.data);
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message);
}