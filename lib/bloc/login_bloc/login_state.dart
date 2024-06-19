part of 'login_bloc.dart';

final class LoginState {
  bool showPassword;
  String? emailError;
  String? passwordError;
  LoginState({
    this.showPassword = true,
    this.emailError,
    this.passwordError,
  });

  LoginState copyWith({
    bool? showPassword,
    String? emailError,
    String? passwordError,
  }) {
    return LoginState(
      showPassword: showPassword ?? this.showPassword,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
    );
  }
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFail extends LoginState {
  String? errorMsg;
  LoginFail({this.errorMsg});
}
