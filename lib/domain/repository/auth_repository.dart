import 'package:finder_seller/domain/repository/custom_exception.dart';
import 'package:finder_seller/domain/repository/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseAuthRepository {
  Stream<User?> get authStateChanges;
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signInWithGoogle();
  User? getCurrentUser();
  Future<void> signOut();
}

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref.read));

class AuthRepository implements BaseAuthRepository {
  //_read to _reader
  final Reader _reader;

  const AuthRepository(this._reader);

  @override
  Stream<User?> get authStateChanges =>
      _reader(firebaseAuthProvider).authStateChanges();

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _reader(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if(googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential = await _reader(firebaseAuthProvider).signInWithCredential(credential);

        //User を返す場合
        // final user = userCredential.user;
        // user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        throw CustomException(message: e.message);
      }
    }
  }

  @override
  User? getCurrentUser() {
    try {
      return _reader(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if(!kIsWeb) {
        await _reader(firebaseAuthProvider).signOut();
      }
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
