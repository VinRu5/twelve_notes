import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationRepository authenticationRepository;

  SignInBloc({
    required this.authenticationRepository,
  }) : super(SignInInitial()) {
    on<PerformSignInWithGoogleEvent>(_onPerformSignInWithGoogleEvent);
    on<PerformSignInWithAppleEvent>(_onPerformSignInWithAppleEvent);
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

  signInWithGoogle() => add(PerformSignInWithGoogleEvent());
  signInWithApple() => add(PerformSignInWithAppleEvent());
}
