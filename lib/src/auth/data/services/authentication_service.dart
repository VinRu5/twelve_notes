import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twelve_notes/src/utils/logger.dart';

class AuthenticationService {
  final SupabaseClient _supabase;

  AuthenticationService({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await _supabase.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: 'https://twelvenotesdl.web.app/confirm',
      );

      talker.info('Auth response: $response');

      return response;
    } catch (e) {
      talker.error(e);
      rethrow;
    }
  }
}
