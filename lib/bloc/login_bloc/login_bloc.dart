import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ValidLogin validLoginState = ValidLogin();
  LoginBloc() : super(ValidLogin()) {
    on<LoginEvent>((event, emit) {});
    on<ChangePasswordVisibility>(_handlePassowrdVisibility);
  }
  _handlePassowrdVisibility(event, emit) {
    emit(ValidLogin(
      showPassword: !validLoginState.showPassword,
    ));
  }
}
