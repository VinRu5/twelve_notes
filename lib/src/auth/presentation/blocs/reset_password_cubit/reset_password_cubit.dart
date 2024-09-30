import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  static const resetEmailNameKey = 'resetEmail';

  final AuthenticationRepository authenticationRepository;

  final formKey = GlobalKey<FormBuilderState>();

  get resetEmailField => formKey.currentState?.fields[resetEmailNameKey];

  ResetPasswordCubit({
    required this.authenticationRepository,
  }) : super(ResetPasswordInitial());

  Future<bool> sendResetPassword() async {
    final isValid = formKey.currentState?.saveAndValidate();

    if ((isValid ?? false) && resetEmailField != null) {
      // await authenticationRepository.resetPassword(resetEmailField.value);

      return true;
    }

    return false;
  }
}
