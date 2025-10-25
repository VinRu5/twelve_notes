import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../errors/errors.dart';
import '../../../misc/environment.dart';
import '../../../profile/data/dto/profile_dto.dart';
import '../../../profile/data/services/profile_service.dart';
import '../../../utils/logger.dart';
import '../../data/mappers/session_mapper.dart';
import '../../data/services/authentication_service.dart';

class AuthenticationRepository {
  final AuthenticationService _authService;
  final ProfileService _profileService;
  final SessionMapper _sessionMapper;
  final Uuid uuid = const Uuid();

  AuthenticationRepository(
      {required AuthenticationService authService,
      required SessionMapper sessionMapper,
      required ProfileService profileService})
      : _authService = authService,
        _sessionMapper = sessionMapper,
        _profileService = profileService;

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

      if (response.user == null) {
        throw GenericSignUpException();
      }

      final profileDTO = ProfileDTO.initialProfile(
        email: email,
        userId: response.user!.id,
        username: _generateUsername(email),
      );

      talker.debug(profileDTO.toJson());

      await _profileService.createProfile(profileDTO);

      return response.session != null;
    } catch (e) {
      talker.error(e);
      rethrow;
    }
  }

  /// Performs Google sign in
  Future<bool> googleSignIn() async {
    /// Web Client ID that you registered with Google Cloud.
    const webClientId = Environment.googleAuthWeb;

    /// iOS Client ID that you registered with Google Cloud.
    const iosClientId = Environment.googleAuthIos;

    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    /*  final GoogleSignIn googleSignIn = GoogleSignIn.instance
      ..initialize(
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

    final AuthResponse response = await _authService.googleSignIn(
      idToken: idToken,
      accessToken: accessToken,
    );

    // Prendere id dell'utente appena creato con google
    // verificare se esiste nella tabella del profilo
    // se non esiste creare il profilo nella rispettiva tabella
    // altrimenti continuare con il login
    return response.session != null; */
    return Future.value(false);
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

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _authService.signIn(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() => _authService.signOut();

  Stream<AuthState> get onAuthStateChange => _authService.onAuthStateChange;

  Future<void> resetPassword(String email) => _authService.resetPassword(email);

  Future<void> updatePassword(String password) => _authService.updateUser(
        UserAttributes(
          password: password,
        ),
      );

  String _generateUsername(String email) {
    final subId = uuid.v4().substring(0, 8);
    final subEmail = email.split('@').first;

    return '${subEmail}_$subId';
  }
}
