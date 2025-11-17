import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final bool obscurePassword;
  final bool rememberMe;

  LoginState({
    this.obscurePassword = true,
    this.rememberMe = false,
  });

  LoginState copyWith({
    bool? obscurePassword,
    bool? rememberMe,
  }) {
    return LoginState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}

class LoginController extends Notifier<LoginState> {
  @override
  LoginState build() {
    return LoginState();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  void toggleRememberMe(bool? value) {
    state = state.copyWith(rememberMe: value ?? false);
  }
}

final loginControllerProvider =
NotifierProvider<LoginController, LoginState>(LoginController.new);
