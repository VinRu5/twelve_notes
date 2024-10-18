class Environment {
  Environment._();

  static const String _supabaseURLKey = "SUPABASE_URL";
  static const String _supabaseAnonKey = "SUPABASE_ANON";

  static const String supabaseURL = String.fromEnvironment(_supabaseURLKey);
  static const String supabaseAnon = String.fromEnvironment(_supabaseAnonKey);
}
