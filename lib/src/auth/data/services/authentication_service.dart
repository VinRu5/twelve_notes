import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../utils/logger.dart';

class AuthenticationService {
  // final SupabaseClient _supabase;

  // AuthenticationService({
  //   required SupabaseClient supabase,
  // }) : _supabase = supabase;
  AuthenticationService();

  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    try {
      // final AuthResponse response = await _supabase.auth.signUp(
      //   email: email,
      //   password: password,
      //   emailRedirectTo: '${TwelveK.deepLinkBaseUrl}${TwelveK.loginPath}',
      // );

      // return response;
      return AuthResponse();
    } catch (e) {
      talker.error(e);
      rethrow;
    }
  }

  Future<AuthResponse> googleSignIn({
    required String idToken,
    required String accessToken,
  }) =>
      // _supabase.auth.signInWithIdToken(
      //   provider: OAuthProvider.google,
      //   idToken: idToken,
      //   accessToken: accessToken,
      // );
      Future.value(AuthResponse());

  Future<AuthResponse> signInWithApple({
    required String idToken,
    required String rawNonce,
  }) =>
      // _supabase.auth.signInWithIdToken(
      //   provider: OAuthProvider.apple,
      //   idToken: idToken,
      //   nonce: rawNonce,
      // );
      Future.value(AuthResponse());

  String generateRawNonce() => ''; //_supabase.auth.generateRawNonce();

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) =>
      // _supabase.auth.signInWithPassword(
      //   email: email,
      //   password: password,
      // );
      Future.value(AuthResponse());

  Future<void> signOut() => Future.value(); //_supabase.auth.signOut();

  Stream<AuthState> get onAuthStateChange => Stream.value(
        AuthState(
          AuthChangeEvent.signedIn,
          Session(
            accessToken: 'mock_access_token',
            tokenType: 'bearer',
            user: User(
              id: 'mock_id',
              appMetadata: {},
              userMetadata: {},
              aud: 'mock_aud',
              createdAt: DateTime.now().toIso8601String(),
            ),
          ),
        ),
      ); //_supabase.auth.onAuthStateChange;

  Future<void> resetPassword(String email) =>
      Future.value(); //_supabase.auth.resetPasswordForEmail(
  //   email,
  //   redirectTo: '${TwelveK.deepLinkBaseUrl}${TwelveK.newPasswordPath}',
  // );

  Future<void> updateUser(UserAttributes attibutes) =>
      // _supabase.auth.updateUser(
      //       attibutes,
      //     );
      Future.value();
}
