part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class LoadingAuthState extends AuthState {}

final class AuthenticatedState extends AuthState {
  // final User user;

  // const AuthenticatedState({
  //   required this.user,
  // });

  // @override
  // List<Object> get props => [user];
}

final class NotAuthicatedState extends AuthState {}
