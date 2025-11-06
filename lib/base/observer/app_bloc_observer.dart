import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log('${bloc.runtimeType} Created!', name: 'BaseX');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('${bloc.runtimeType} Changed - $change', name: 'BaseX');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('${bloc.runtimeType} Transition - $transition', name: 'BaseX');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('${bloc.runtimeType} Error - $error', name: 'BaseX');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    log('${bloc.runtimeType} Closed!', name: 'BaseX');
    super.onClose(bloc);
  }
}
