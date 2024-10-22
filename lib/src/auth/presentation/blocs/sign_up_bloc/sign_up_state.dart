part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SigningUpState extends SignUpState {}

final class SuccessSignUpNotVerifiedState extends SignUpState {}

final class SuccessSignUpVerifiedState extends SignUpState {}

final class ErrorSignUpState extends SignUpState {
  final Object error;

  const ErrorSignUpState({
    required this.error,
  });

  @override
  List<Object> get props => [
        error,
      ];
}
