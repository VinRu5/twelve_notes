import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  static const resetPasswordNameKey = 'resetPassword';
  static const resetPasswordConfirmNameKey = 'resetPasswordConfirm';

  final AuthenticationRepository authenticationRepository;

  FormBuilderFieldState<FormBuilderField, dynamic>? get resetPasswordField =>
      formKey.currentState?.fields[resetPasswordNameKey];
  FormBuilderFieldState<FormBuilderField, dynamic>? get resetPasswordConfirmField =>
      formKey.currentState?.fields[resetPasswordConfirmNameKey];

  final formKey = GlobalKey<FormBuilderState>();

  NewPasswordCubit({
    required this.authenticationRepository,
  }) : super(NewPasswordInitial());

  Future<void> updatePassword() async {
    final isValid = formKey.currentState?.saveAndValidate();

    if ((isValid ?? false) &&
        resetPasswordField != null &&
        resetPasswordField?.value == resetPasswordConfirmField?.value) {
      try {
        await authenticationRepository.updatePassword(resetPasswordField!.value as String);

        emit(NewPasswordUpdated());
      } catch (e) {
        emit(NewPasswordError());
      }
    }
  }
}
