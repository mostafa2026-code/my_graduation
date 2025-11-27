import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/features/presentation/auth/login/cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  final TextEditingController emailLogin = TextEditingController();
  final TextEditingController passwordLogin = TextEditingController();
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  login() {
    if (formKeyLogin.currentState!.validate()) {
      emit(LoginLoadingState());
      try {
        FirebaseHelper.login(emailLogin.text.trim(), passwordLogin.text.trim());
        emit(LoginSuccessState());
      } on Exception catch (e) {
        emit(LoginErrorState(e.toString()));
        log(e.toString());
      }
    }
  }
  loginWithGoogle(){
    
  }
}
