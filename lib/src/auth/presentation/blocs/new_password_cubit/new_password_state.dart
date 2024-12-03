part of 'new_password_cubit.dart';

sealed class NewPasswordState extends Equatable {
  const NewPasswordState();

  @override
  List<Object> get props => [];
}

final class NewPasswordInitial extends NewPasswordState {}

final class NewPasswordUpdated extends NewPasswordState {}

final class NewPasswordError extends NewPasswordState {}
