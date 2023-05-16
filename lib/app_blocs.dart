import 'package:ekaksha/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_events.dart';

class AppBlocs extends Bloc<AppEvents, AppState> {
  AppBlocs() : super(InitState()) {
    print("App Bloc called");
    on<Increment>((event, emit) {
      // print("I am getting called");
      emit(AppState(counter: state.counter + 1));
      print(state.counter);
    });
    on<Decrement>((event, emit) {
      // print("I am getting called");
      emit(AppState(counter: state.counter - 1));
      print(state.counter);
    });
  }
}
