import 'package:bloc/bloc.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/features/presentation/auth/reset_password/cubit/reset_password_states.dart';
import 'dart:developer';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitialStates());

  void isEmailVerified() async {
    try {
      emit(ResetPasswordLoadingStates());
      bool? isEmailVerified = await FirebaseHelper.isEmailVerified();
      if (isEmailVerified == null || isEmailVerified == false) {
        emit(ResetPasswordFailureStates());
      } else {
        emit(ResetPasswordSuccessStates());
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  resetPassword(String newPassword) async {
    emit(ResetPasswordLoadingStates());
    try {
      bool? resetResult = await FirebaseHelper.resetPassword(newPassword);
      if (resetResult == null || resetResult == false) {
        emit(ResetPasswordFailureStates());
      } else {
        emit(ResetPasswordSuccessStates());
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
