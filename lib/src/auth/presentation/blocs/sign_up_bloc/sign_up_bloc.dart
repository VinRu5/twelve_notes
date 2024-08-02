import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:twelve_notes/src/auth/domain/models/user.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';
import 'package:twelve_notes/src/auth/domain/repositories/user_repository.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/auth_cubit/auth_cubit.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  static const nameFieldKey = 'name';
  static const surnameFieldKey = 'surname';
  static const emailFieldKey = 'email';
  static const emailConfirmFieldKey = 'emailConfirm';
  static const passwordFieldKey = 'password';
  static const passwordConfirmFieldKey = 'passwordConfirm';

  final AuthenticationRepository authenticationRepository;
  final AuthCubit authCubit;
  final UserRepository userRepository;

  final formKey = GlobalKey<FormBuilderState>();

  get nameField => formKey.currentState?.fields[nameFieldKey];
  get surnameField => formKey.currentState?.fields[surnameFieldKey];
  get emailField => formKey.currentState?.fields[emailFieldKey];
  get emailConfirmField => formKey.currentState?.fields[emailConfirmFieldKey];
  get passwordField => formKey.currentState?.fields[passwordFieldKey];
  get passwordConfirmField => formKey.currentState?.fields[passwordConfirmFieldKey];

  SignUpBloc({
    required this.authenticationRepository,
    required this.authCubit,
    required this.userRepository,
  }) : super(SignUpInitial()) {
    on<PerformSignUpEvent>(_onPerformSignUp);
  }

  FutureOr<void> _onPerformSignUp(PerformSignUpEvent event, Emitter<SignUpState> emit) async {
    emit(SigningUpState());

    final String email = emailField?.value;
    final String password = passwordField?.value;

    final authSubscription = authCubit.stream
        .where(
          (state) => state is AuthenticatedState,
        )
        .listen(
          (state) => _updateUserProfile(event, state: state as AuthenticatedState),
        );

    try {
      final userCredentials = await authenticationRepository.signUp(email, password);

      emit(
        SuccessSignUpState(
          userCredential: userCredentials,
        ),
      );
    } catch (e) {
      emit(ErrorSignUpState(error: e));
    } finally {
      authSubscription.cancel();
    }
  }

  void signUp() => add(PerformSignUpEvent());

  void onSignUp() {
    final isValid = formKey.currentState?.saveAndValidate();

    if (isValid ?? false) {
      signUp();
    }
  }

  _updateUserProfile(
    PerformSignUpEvent event, {
    required AuthenticatedState state,
  }) async {
    final auth.User authUser = state.user;

    final firstName = nameField?.value;
    final lastName = surnameField?.value;

    await userRepository.create(
      User(
        id: authUser.uid,
        firstName: firstName,
        lastName: lastName,
        favouriteSongs: const [],
        playlists: const [],
      ),
    );

    await authUser.updateDisplayName('$firstName $lastName');
  }
}
