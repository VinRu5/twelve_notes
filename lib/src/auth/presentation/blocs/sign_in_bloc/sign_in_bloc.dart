import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  static const emailNameKey = 'email';
  static const passwordNameKey = 'password';

  final AuthenticationRepository authenticationRepository;

  final formKey = GlobalKey<FormBuilderState>();

  FormBuilderFieldState<FormBuilderField, dynamic>? get emailField =>
      formKey.currentState?.fields[emailNameKey];
  FormBuilderFieldState<FormBuilderField, dynamic>? get passwordField =>
      formKey.currentState?.fields[passwordNameKey];

  SignInBloc({
    required this.authenticationRepository,
  }) : super(SignInInitial()) {
    on<PerformSignInEvent>(_onPerformSignIn);
    on<PerformSignInWithGoogleEvent>(_onPerformSignInWithGoogleEvent);
    on<PerformSignInWithAppleEvent>(_onPerformSignInWithAppleEvent);
  }

  FutureOr<void> _onPerformSignIn(
    PerformSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(SigningInState());
    try {
      final String email = emailField?.value;
      final String password = passwordField?.value;

      await authenticationRepository.signIn(
        email: email,
        password: password,
      );

      emit(
        SuccessSignInState(),
      );
    } catch (e) {
      emit(
        ErrorSignInState(exception: e),
      );
    }
  }

  FutureOr<void> _onPerformSignInWithGoogleEvent(
    PerformSignInWithGoogleEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(SigningInState());

    try {
      await authenticationRepository.googleSignIn();

      emit(SuccessSignInState());
    } catch (e) {
      emit(
        ErrorSignInState(exception: e),
      );
    }
  }

  FutureOr<void> _onPerformSignInWithAppleEvent(
    PerformSignInWithAppleEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(SigningInState());

    try {
      await authenticationRepository.signInWithApple();

      emit(SuccessSignInState());
    } catch (e) {
      emit(
        ErrorSignInState(exception: e),
      );
    }
  }

  void signInWithGoogle() => add(PerformSignInWithGoogleEvent());
  void signInWithApple() => add(PerformSignInWithAppleEvent());
  void signInWithEmail() => add(PerformSignInEvent());

  void onSignIn() {
    final isValid = formKey.currentState?.saveAndValidate();

    if (isValid ?? false) {
      signInWithEmail();
    }
  }
}
