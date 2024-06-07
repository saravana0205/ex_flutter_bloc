part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginLoading extends LoginState {}

final class ValidLogin extends LoginState {
  bool showPassword;
  ValidLogin({this.showPassword = true});
}
