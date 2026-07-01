import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  static const emailFieldKey = 'email';
  static const emailConfirmFieldKey = 'emailConfirm';
  static const passwordFieldKey = 'password';
  static const passwordConfirmFieldKey = 'passwordConfirm';

  final AuthenticationRepository authenticationRepository;
  // final AuthCubit authCubit;
  // final UserRepository userRepository;

  final formKey = GlobalKey<FormBuilderState>();

  FormBuilderFieldState<FormBuilderField, dynamic>? get emailField =>
      formKey.currentState?.fields[emailFieldKey];
  FormBuilderFieldState<FormBuilderField, dynamic>? get emailConfirmField =>
      formKey.currentState?.fields[emailConfirmFieldKey];
  FormBuilderFieldState<FormBuilderField, dynamic>? get passwordField =>
      formKey.currentState?.fields[passwordFieldKey];
  FormBuilderFieldState<FormBuilderField, dynamic>? get passwordConfirmField =>
      formKey.currentState?.fields[passwordConfirmFieldKey];

  SignUpBloc({
    required this.authenticationRepository,
    // required this.authCubit,
    // required this.userRepository,
  }) : super(SignUpInitial()) {
    on<PerformSignUpEvent>(_onPerformSignUp);
  }

  Future<void> _onPerformSignUp(PerformSignUpEvent event, Emitter<SignUpState> emit) async {
    emit(SigningUpState());

    final String email = emailField?.value;
    final String password = passwordField?.value;

    try {
      final response = await authenticationRepository.signUp(
        email: email,
        password: password,
      );

      if (response) {
        emit(SuccessSignUpVerifiedState());
      } else {
        emit(SuccessSignUpNotVerifiedState());
      }
    } catch (e) {
      emit(
        ErrorSignUpState(error: e),
      );
    }
  }

  void signUp() => add(PerformSignUpEvent());

  void onSignUp() {
    final isValid = formKey.currentState?.saveAndValidate();

    if (isValid ?? false) {
      signUp();
    }
  }
}
