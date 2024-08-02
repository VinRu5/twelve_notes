part of 'dependency_injector.dart';

final List<SingleChildWidget> datasources = [
  Provider<FirebaseFirestore>(
    create: (_) => FirebaseFirestore.instance,
  ),
  Provider<FirebaseAuth>(
    create: (_) => FirebaseAuth.instance,
  ),
  // Iniezione di Google Sign In
  Provider<GoogleSignIn>(
    create: (_) => GoogleSignIn(
      // gli scope sono i modi in cui effettuare il sign in
      scopes: [
        'https://www.googleapis.com/auth/userinfo.email',
        'https://www.googleapis.com/auth/userinfo.profile',
      ],
    ),
  ),
  // Provider<SharedPreferencesDatasource>(
  //   create: (_) => SharedPreferencesDatasource(
  //     sharedPreferences: SharedPreferences.getInstance(),
  //   ),
  // ),
];
