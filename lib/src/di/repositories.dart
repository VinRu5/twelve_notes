part of 'dependency_injector.dart';

final List<SingleChildWidget> repositories = [
  RepositoryProvider(
    create: (context) => AuthenticationRepository(
      // googleSignIn: context.read<GoogleSignIn>(),
      authService: context.read<AuthenticationService>(),
      sessionMapper: SessionMapper(
        userMapper: UserMapper(),
      ),
    ),
  ),
  // RepositoryProvider(
  //   create: (context) => UserRepository(
  //     firebaseFirestore: context.read<FirebaseFirestore>(),
  //     userAdapter: context.read<UserAdapter>(),
  //   ),
  // ),
];
