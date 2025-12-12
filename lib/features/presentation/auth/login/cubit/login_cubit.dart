import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/core/services/shared_prefrences/shared_helper.dart';
import 'package:my_graduation/features/data/models/doctors_model.dart';
import 'package:my_graduation/features/presentation/auth/login/cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  final TextEditingController emailLogin = TextEditingController();
  final TextEditingController passwordLogin = TextEditingController();
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  login() async {
    if (formKeyLogin.currentState!.validate()) {
      emit(LoginLoadingState());
      try {
        UserCredential? response = await FirebaseHelper.login(
          emailLogin.text.trim(),
          passwordLogin.text.trim(),
        );
        if (response == null) {
          emit(LoginErrorState("Login failed"));
          return;
        } else {
          emit(LoginSuccessState());
          SharedHelper.saveDoctor(
            DoctorsModel(
              name: response.user!.displayName!,
              email: response.user!.email!,
              id: response.user!.uid,
              image: response.user!.photoURL!,
            ),
          );
          SharedHelper.isLoggedIn();
        }
      } on Exception catch (e) {
        emit(LoginErrorState(e.toString()));
        log(e.toString());
      }
    }
  }

  loginWithGoogle() {}
}
