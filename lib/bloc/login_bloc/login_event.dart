part of 'login_bloc.dart';

sealed class LoginEvent {}

final class ChangePasswordVisibility extends LoginEvent {
  bool showPassword;
  ChangePasswordVisibility({required this.showPassword});
}

final class ValidateEmail extends LoginEvent {}
