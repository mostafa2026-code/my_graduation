import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
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
