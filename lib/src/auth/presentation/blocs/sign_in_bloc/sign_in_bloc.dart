import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  static const emailNameKey = 'email';
  static const passwordNameKey = 'password';

  final AuthenticationRepository authenticationRepository;

  final formKey = GlobalKey<FormBuilderState>();

  SignInBloc({required this.authenticationRepository}) : super(SignInInitial()) {
    on<PerformSignInEvent>(_onPerformSignIn);
    on<PerformSignInWithGoogleEvent>(_onPerformSignInGoogle);
    on<PerformSignInWithAppleEvent>(_onPerformSignInApple);
  }

  FutureOr<void> _onPerformSignIn(
    PerformSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(SigningInState());
    try {
      final UserCredential userCredential = await authenticationRepository.signInWithEmail(
        event.email,
        event.password,
      );
      emit(
        SuccessSignInState(userCredential: userCredential),
      );
    } catch (e) {
      emit(
        ErrorSignInState(exception: e),
      );
    }
  }

  FutureOr<void> _onPerformSignInGoogle(
    PerformSignInWithGoogleEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(SigningInState());
    try {
      final UserCredential userCredential = await authenticationRepository.signInWithGoogle();
      emit(
        SuccessSignInState(userCredential: userCredential),
      );
    } catch (e) {
      emit(
        ErrorSignInState(exception: e),
      );
    }
  }

  FutureOr<void> _onPerformSignInApple(
    PerformSignInWithAppleEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(SigningInState());
    try {
      final UserCredential userCredential = await authenticationRepository.signInWithApple();
      emit(
        SuccessSignInState(userCredential: userCredential),
      );
    } catch (e) {
      emit(
        ErrorSignInState(exception: e),
      );
    }
  }

  void signInWithEmail(
    String email,
    String password,
  ) =>
      add(
        PerformSignInEvent(
          email: email,
          password: password,
        ),
      );

  void signInWithGoogle() => add(PerformSignInWithGoogleEvent());

  void signInWithApple() => add(PerformSignInWithAppleEvent());
}
