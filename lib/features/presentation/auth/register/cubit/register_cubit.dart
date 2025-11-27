import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/features/presentation/auth/register/cubit/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  final TextEditingController emailReg = TextEditingController();
  final TextEditingController nameReg = TextEditingController();
  final TextEditingController passwordReg = TextEditingController();
  final GlobalKey<FormState> formKeyReg = GlobalKey<FormState>();
  

  register() async {
    emit(RegisterLoadingState());
    try {
      UserCredential? userCredential = await FirebaseHelper.register(
        emailReg.text.trim(),
        passwordReg.text.trim(),
      );
      if (userCredential == null) {
        emit(RegisterErrorState("Register failed"));
        return;
      } else {
        emit(RegisterSuccessState());
      }
    } on Exception catch (e) {
      emit(RegisterErrorState(e.toString()));
      log(e.toString());
    }
  }

  loginWithGoogle() {}
}
