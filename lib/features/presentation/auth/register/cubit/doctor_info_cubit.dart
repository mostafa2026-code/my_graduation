import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/services/firebsase/firestore_helper.dart';
import 'package:my_graduation/core/services/shared_prefrences/shared_helper.dart';
import 'package:my_graduation/features/data/models/doctors_model.dart';

abstract class DoctorInfoStates {}

class DoctorInfoInitial extends DoctorInfoStates {}

class DoctorInfoLoading extends DoctorInfoStates {}

class DoctorInfoSuccess extends DoctorInfoStates {}

class DoctorInfoError extends DoctorInfoStates {
  final String error;
  DoctorInfoError(this.error);
}

class DoctorInfoCubit extends Cubit<DoctorInfoStates> {
  DoctorInfoCubit() : super(DoctorInfoInitial());

  final TextEditingController specialityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController fromHourController = TextEditingController();
  final TextEditingController toHourController = TextEditingController();

  void saveDoctorInfo() async {
    emit(DoctorInfoLoading());
    try {
      final currentDoctor = SharedHelper.getUserInfo();
      if (currentDoctor == null) {
        emit(DoctorInfoError("User session not found"));
        return;
      }

      final updatedDoctor = DoctorsModel(
        id: currentDoctor.id,
        name: currentDoctor.name,
        email: currentDoctor.email,
        image: currentDoctor.image,
        speciality: specialityController.text.trim(),
        address: addressController.text.trim(),
        phone: phoneController.text.trim(),
        position: positionController.text.trim(),
        qualification: qualificationController.text.trim(),
        about: aboutController.text.trim(),
        salary: double.tryParse(salaryController.text.trim()),
        fromHour: fromHourController.text.trim(),
        toHour: toHourController.text.trim(),
      );

      await FirestoreHelper.saveDoctorData(updatedDoctor);
      SharedHelper.saveDoctor(updatedDoctor);
      emit(DoctorInfoSuccess());
    } catch (e) {
      emit(DoctorInfoError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    specialityController.dispose();
    addressController.dispose();
    phoneController.dispose();
    positionController.dispose();
    qualificationController.dispose();
    aboutController.dispose();
    salaryController.dispose();
    fromHourController.dispose();
    toHourController.dispose();
    return super.close();
  }
}
