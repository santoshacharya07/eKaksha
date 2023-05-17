import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ekaksha/pages/%20sign_in/bloc/sign_in_events.dart';
import 'package:ekaksha/pages/%20sign_in/bloc/signin_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
    //email is uesd in tut
  }
}
