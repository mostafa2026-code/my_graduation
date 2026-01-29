import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/core/services/shared_prefrences/shared_helper.dart';
import 'package:my_graduation/features/data/models/doctors_model.dart';
import 'package:my_graduation/features/presentation/auth/register/cubit/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  final TextEditingController emailReg = TextEditingController();
  final TextEditingController nameReg = TextEditingController();
  final TextEditingController passwordReg = TextEditingController();

  register() async {
    emit(RegisterLoadingState());
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailReg.text.trim(),
        password: passwordReg.text.trim(),
      );
      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(nameReg.text.trim());

        emit(RegisterSuccessState());
        SharedHelper.saveDoctor(
          DoctorsModel(
            email: emailReg.text.trim(),
            name: nameReg.text.trim(),
            id: userCredential.user!.uid,

            // image: userCredential.user!.photoURL!,
          ),
        );
        SharedHelper.saveIsLoggedIn();
      } else {
        emit(RegisterErrorState("Error in Register"));
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      emit(RegisterErrorState(e.toString()));
    }
  }

  signUpWithGoogle() async {
    emit(RegisterLoadingState());
    try {
      UserCredential? response = await FirebaseHelper.signInWithGoogle();
      if (response == null) {
        emit(RegisterErrorState("Google Sign up failed or cancelled"));
        return;
      } else {
        await _saveUser(response);
      }
    } on Exception catch (e) {
      emit(RegisterErrorState(e.toString()));
      log(e.toString());
    }
  }

  Future<void> _saveUser(UserCredential response) async {
    emit(RegisterSuccessState());
    SharedHelper.saveDoctor(
      DoctorsModel(
        name: response.user!.displayName ?? "No Name",
        email: response.user!.email ?? "No Email",
        id: response.user!.uid,
        image: response.user!.photoURL ?? "",
      ),
    );
    SharedHelper.saveIsLoggedIn();
  }

  @override
  Future<void> close() {
    emailReg.dispose();
    nameReg.dispose();
    passwordReg.dispose();
    return super.close();
  }
}
