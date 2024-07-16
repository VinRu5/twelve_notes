part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class PerformSignInEvent extends SignInEvent {}

class PerformSignInWithGoogleEvent extends SignInEvent {}

class PerformSignInWithAppleEvent extends SignInEvent {}
