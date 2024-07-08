part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class PerformSignInEvent extends SignInEvent {
  final String email, password;

  const PerformSignInEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class PerformSignInWithGoogleEvent extends SignInEvent {}

class PerformSignInWithAppleEvent extends SignInEvent {}
