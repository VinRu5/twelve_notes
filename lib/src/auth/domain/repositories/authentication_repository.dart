import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twelve_notes/src/auth/data/mappers/session_mapper.dart';
import 'package:twelve_notes/src/auth/data/services/authentication_service.dart';
import 'package:twelve_notes/src/errors/errors.dart';
import 'package:twelve_notes/src/misc/environment.dart';
import 'package:twelve_notes/src/utils/logger.dart';

class AuthenticationRepository {
  final AuthenticationService _authService;
  // final GoogleSignIn _googleSignIn;
  final SessionMapper _sessionMapper;

  AuthenticationRepository({
    required AuthenticationService authService,
    // required GoogleSignIn googleSignIn,
    required SessionMapper sessionMapper,
  })  : _authService = authService,
        // _googleSignIn = googleSignIn,
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

  Future<AuthResponse> googleSignIn() async {
    /// Web Client ID that you registered with Google Cloud.
    const webClientId = Environment.googleAuthWeb;

    /// iOS Client ID that you registered with Google Cloud.
    const iosClientId = Environment.googleAuthIos;

    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
      // scopes: [
      //   'https://www.googleapis.com/auth/userinfo.email',
      //   'https://www.googleapis.com/auth/userinfo.profile',
      // ],
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      throw GoogleOAuthException();
    }

    return _authService.googleSignIn(
      idToken: idToken,
      accessToken: accessToken,
    );

    // Prendere id dell'utente appena creato con google
    // verificare se esiste nella tabella del profilo
    // se non esiste creare il profilo nella rispettiva tabella
    // altrimenti continuare con il login
  }

  /// Performs Apple sign in on iOS or macOS
  Future<AuthResponse> signInWithApple() async {
    final rawNonce = _authService.generateRawNonce();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );

    final idToken = credential.identityToken;
    if (idToken == null) {
      throw const AuthException('Could not find ID Token from generated credential.');
    }

    return _authService.signInWithApple(
      idToken: idToken,
      rawNonce: rawNonce,
    );
  }
}
