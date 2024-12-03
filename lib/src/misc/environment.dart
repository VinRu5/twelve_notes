class Environment {
  Environment._();

  static const String _supabaseURLKey = "SUPABASE_URL";
  static const String _supabaseAnonKey = "SUPABASE_ANON";
  static const String _googleAuthWebKey = "GOOGLE_AUTH_WEB";
  static const String _googleAuthIosKey = "GOOGLE_AUTH_IOS";

  static const String supabaseURL = String.fromEnvironment(_supabaseURLKey);
  static const String supabaseAnon = String.fromEnvironment(_supabaseAnonKey);
  static const String googleAuthWeb = String.fromEnvironment(_googleAuthWebKey);
  static const String googleAuthIos = String.fromEnvironment(_googleAuthIosKey);
}
