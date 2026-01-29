import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

class FirebaseHelper {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final AuthCredential credential = FacebookAuthProvider.credential(
          accessToken.tokenString,
        );
        return await _auth.signInWithCredential(credential);
      }
      return null;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<UserCredential?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<UserCredential?> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static String? getUserName() {
    return _auth.currentUser?.displayName;
  }

  static Future<void> mylogout() async {
    await _auth.signOut();
  }

  static String? getUserId() {
    return _auth.currentUser?.uid;
  }

  static String? getuserEmail() {
    return _auth.currentUser?.email;
  }

  static Future<bool?> resetPassword(String newPassword) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await user.reload();
      bool isemailVerified = user.emailVerified;
      try {
        if (isemailVerified == true) {
          await user.updatePassword(newPassword);
          return true;
        } else {
          await user.sendEmailVerification();

          return false;
        }
      } on FirebaseAuthException catch (e) {
        log(e.toString());
      }
    } else {
      return false;
    }
    return null;
  }

  static Future<bool?> isEmailVerified() async {
    User? user = _auth.currentUser;
    try {
      if (user != null && user.emailVerified) {
        return true;
      } else if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        return false;
      } else if (user == null) {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return false;
    }
    return null;
  }
}
