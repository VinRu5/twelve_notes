part of 'dependency_injector.dart';

final List<SingleChildWidget> repositories = [
  RepositoryProvider(
    create: (context) => AuthenticationRepository(
      firebaseAuth: context.read<FirebaseAuth>(),
      googleSignIn: context.read<GoogleSignIn>(),
    ),
  ),
];
