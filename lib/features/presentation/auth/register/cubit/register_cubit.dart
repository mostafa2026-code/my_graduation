import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
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
      } else {
        emit(RegisterErrorState("Error in Register"));
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      emit(RegisterErrorState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailReg.dispose();
    nameReg.dispose();
    passwordReg.dispose();
    return super.close();
  }
}
