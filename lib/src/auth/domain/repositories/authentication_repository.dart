import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twelve_notes/src/errors/errors.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthenticationRepository({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  static const _userNotFoundKey = 'user-not-found';
  static const _wrongPasswordKey = 'wrong-password';
  static const _weakPasswordKey = 'weak-password';
  static const _emailAlreadyInUseKey = 'email-already-in-use';

  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == _userNotFoundKey) {
        throw AccountUserNotFoundException();
      } else if (e.code == _wrongPasswordKey) {
        throw WrongPasswordException();
      }
      rethrow;
    } catch (e) {
      throw GenericSignInException();
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    }

    throw SignInCanceledException();
  }

  Future<UserCredential> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    try {
      if (kIsWeb) {
        return await _firebaseAuth.signInWithPopup(appleProvider);
      } else {
        return await _firebaseAuth.signInWithProvider(appleProvider);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signUp(String email, String password) async {
    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == _weakPasswordKey) {
        throw WrongCredentialException();
      } else if (e.code == _emailAlreadyInUseKey) {
        throw AlreadyExistingAccountException();
      }
      rethrow;
    } catch (e) {
      throw GenericSignInException();
    }
  }

  Future<void> signOut() async => _firebaseAuth.signOut();
}
