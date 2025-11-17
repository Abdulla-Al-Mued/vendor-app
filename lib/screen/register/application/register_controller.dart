import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vendor_app/screen/login_screen/application/login_controller.dart';

class RegisterState {
  final bool obscurePassword1;
  final bool obscurePassword2;
  final bool agreeToTerms;

  RegisterState({
    this.obscurePassword1 = true,
    this.obscurePassword2 = true,
    this.agreeToTerms = false,
  });

  RegisterState copyWith({
    bool? obscurePassword1,
    bool? obscurePassword2,
    bool? agreeToTerms,
  }) {
    return RegisterState(
      obscurePassword1: obscurePassword1 ?? this.obscurePassword1,
      obscurePassword2: obscurePassword2 ?? this.obscurePassword2,
      agreeToTerms: agreeToTerms ?? this.agreeToTerms,
    );
  }
}

class RegisterController extends Notifier<RegisterState> {

  void togglePassword1Visibility() {
    state = state.copyWith(obscurePassword1: !state.obscurePassword1);
  }

  void togglePassword2Visibility() {
    state = state.copyWith(obscurePassword2: !state.obscurePassword2);
  }

  void setAgreeToTerms(bool? value) {
    state = state.copyWith(agreeToTerms: value ?? false);
  }

  @override
  RegisterState build() {
    return RegisterState();
  }
}

final registerControllerProvider =
NotifierProvider<RegisterController, RegisterState>(RegisterController.new);
