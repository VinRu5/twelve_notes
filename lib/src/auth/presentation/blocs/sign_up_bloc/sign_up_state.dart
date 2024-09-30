part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SigningUpState extends SignUpState {}

final class SuccessSignUpState extends SignUpState {
  // final auth.UserCredential userCredential;

  // const SuccessSignUpState({
  //   required this.userCredential,
  // });

  // @override
  // List<Object> get props => [
  //       userCredential,
  //     ];
}

final class ErrorSignUpState extends SignUpState {
  final Object error;

  const ErrorSignUpState({
    required this.error,
  });
}
