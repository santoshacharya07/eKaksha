class AppState {
  int counter;
  AppState({required this.counter});
}

class InitState extends AppState {
  InitState() : super(counter: -2);
}
