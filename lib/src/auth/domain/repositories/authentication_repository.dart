import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twelve_notes/src/auth/data/mappers/session_mapper.dart';
import 'package:twelve_notes/src/auth/data/services/authentication_service.dart';
import 'package:twelve_notes/src/utils/logger.dart';

class AuthenticationRepository {
  final AuthenticationService _authService;
  final GoogleSignIn _googleSignIn;
  final SessionMapper _sessionMapper;

  AuthenticationRepository({
    required AuthenticationService authService,
    required GoogleSignIn googleSignIn,
    required SessionMapper sessionMapper,
  })  : _authService = authService,
        _googleSignIn = googleSignIn,
        _sessionMapper = sessionMapper;

  // static const _userAlreadyRegisterKey = 'User already registered';

  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await _authService.signUp(
        email: email,
        password: password,
      );
      talker.info('Repository: $response');

      return response.session != null;
    } catch (e) {
      talker.error(e);
      rethrow;
    }
  }
}
