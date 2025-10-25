part of 'dependency_injector.dart';

final List<SingleChildWidget> services = [
  // Iniezione di Google Sign In
  Provider<GoogleSignIn>(create: (_) => GoogleSignIn.instance
      // GoogleSignIn(
      //   // gli scope sono i modi in cui effettuare il sign in
      //   scopes: [
      //     'https://www.googleapis.com/auth/userinfo.email',
      //     'https://www.googleapis.com/auth/userinfo.profile',
      //   ],
      // ),
      ),
  // Provider<SharedPreferencesDatasource>(
  //   create: (_) => SharedPreferencesDatasource(
  //     sharedPreferences: SharedPreferences.getInstance(),
  //   ),
  // ),

  Provider<AuthenticationService>(
    create: (context) => AuthenticationService(
        // supabase: context.read<SupabaseClient>(),
        ),
  ),
  Provider<ProfileService>(
    create: (context) => ProfileService(
        // supabase: context.read<SupabaseClient>(),
        ),
  ),
];
