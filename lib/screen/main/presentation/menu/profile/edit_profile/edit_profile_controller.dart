import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileState {
  final bool obscurePassword1;
  final bool obscurePassword2;
  final bool agreeToTerms;

  EditProfileState({
    this.obscurePassword1 = true,
    this.obscurePassword2 = true,
    this.agreeToTerms = false,
  });

  EditProfileState copyWith({
    bool? obscurePassword1,
    bool? obscurePassword2,
    bool? agreeToTerms,
  }) {
    return EditProfileState(
      obscurePassword1: obscurePassword1 ?? this.obscurePassword1,
      obscurePassword2: obscurePassword2 ?? this.obscurePassword2,
      agreeToTerms: agreeToTerms ?? this.agreeToTerms,
    );
  }
}

class EditProfileController extends Notifier<EditProfileState> {

  @override
  EditProfileState build() {
    return EditProfileState();
  }

  void togglePassword1Visibility() {
    state = state.copyWith(obscurePassword1: !state.obscurePassword1);
  }

  void togglePassword2Visibility() {
    state = state.copyWith(obscurePassword2: !state.obscurePassword2);
  }

  void setAgreeToTerms(bool? value) {
    state = state.copyWith(agreeToTerms: value ?? false);
  }
}

final profileControllerProvider =
NotifierProvider<EditProfileController, EditProfileState>(EditProfileController.new);
