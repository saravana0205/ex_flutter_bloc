import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/common_validation.dart';
import '../../utils/string_contants.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final emailController = TextEditingController(text: emailValue);
  final passwordController = TextEditingController(text: passwordValue);
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  LoginBloc() : super(LoginState()) {
    emailFocus.addListener(
      () {},
    );
    on<LoginEvent>((event, emit) {});
    on<ChangePasswordVisibility>(_handlePassowrdVisibility);
    on<ValidateEmail>(_handleValidateUser);
  }

  Future<void> _handlePassowrdVisibility(
      ChangePasswordVisibility event, emit) async {
    emit(state.copyWith(showPassword: event.showPassword));
  }

  Future<void> _handleValidateUser(event, emit) async {
    String? emailError = validateEmail(email: emailController.text);
    String? passwordError = validateEmail(email: passwordController.text);
    if (emailError != null || passwordError != null) {
      emit(
        state.copyWith(
          emailError: emailError,
          passwordError: passwordError,
        ),
      );
    } else {
      emit(LoginLoading());
      await Future.delayed(
        const Duration(seconds: 3),
        () {
          if (emailController.text == emailValue) {
            emit(LoginSuccess());
          } else {
            emit(LoginFail(errorMsg: "User Not Registred"));
          }
        },
      );
    }
  }
}
