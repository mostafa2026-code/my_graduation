import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

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

  static Future<void> logout() async {
    await _auth.signOut();
  }


  static String getUserId() {
    return _auth.currentUser!.uid;
  }
}
