import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeStarted>((event, emit) async {
      try {
        // Simulate logic
        emit(HomeSuccessState());
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    });
  }
}