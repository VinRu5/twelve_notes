part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class SigningInState extends SignInState {}

class SuccessSignInState extends SignInState {
  final auth.UserCredential userCredential;

  const SuccessSignInState({
    required this.userCredential,
  });

  @override
  List<Object> get props => [
        userCredential,
      ];
}

final class ErrorSignInState extends SignInState {
  final dynamic exception;

  const ErrorSignInState({
    required this.exception,
  });
}
