import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  static const emailNameKey = 'email';
  static const passwordNameKey = 'password';

  final formKey = GlobalKey<FormBuilderState>();

  SignInBloc() : super(SignInInitial()) {
    on<PerformSignInEvent>(_onPerformSignIn);
  }

  FutureOr<void> _onPerformSignIn(
    PerformSignInEvent event,
    Emitter<SignInState> emit,
  ) {}
}
