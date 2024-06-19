import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/login_bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          child: BlocBuilder<LoginBloc, LoginState>(
            bloc: bloc,
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: bloc.emailController,
                    decoration: InputDecoration(
                      errorText: state.emailError,
                      hintText: "Enter your email",
                      labelText: "Email",
                      border: const OutlineInputBorder(),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    focusNode: bloc.emailFocus,
                    controller: bloc.passwordController,
                    obscureText: state.showPassword,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      errorText: state.passwordError,
                      hintText: "Enter your password",
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(state.showPassword
                            ? Icons.remove_red_eye
                            : Icons.visibility_off),
                        onPressed: () {
                          bloc.add(
                            ChangePasswordVisibility(
                                showPassword: !state.showPassword),
                          );
                        },
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 180,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        bloc.add(ValidateEmail());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                      child: (state is LoginLoading)
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text("Log In"),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
