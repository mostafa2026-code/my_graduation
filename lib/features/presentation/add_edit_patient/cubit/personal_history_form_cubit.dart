import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/enums/my_enums.dart';
import 'package:my_graduation/features/data/models/patient_personal_history.dart';

class PersonalHistoryFormCubit extends Cubit<PersonalHistoryFormState> {
  PersonalHistoryFormCubit() : super(PersonalHistoryFormInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController childrenNumberController =
      TextEditingController();
  final TextEditingController specailHabitController = TextEditingController();

  String? gender;
  String? martialStatus;
  String? smokingStatus;

  void selectGender(Gender value) {
    if (gender == value.name) {
      gender = null;
    } else {
      gender = value.name;
    }
    emit(PersonalHistoryFormInitial());
  }

  void selectMartialStatus(MartialStatus value) {
    if (martialStatus == value.name) {
      martialStatus = null;
    } else {
      martialStatus = value.name;
    }
    emit(PersonalHistoryFormInitial());
  }

  void selectSmokingStatus(SmokingStatus value) {
    if (smokingStatus == value.name) {
      smokingStatus = null;
    } else {
      smokingStatus = value.name;
    }
    emit(PersonalHistoryFormInitial());
  }

  Map<String, dynamic> setPersonalHistoryData() {
    PatientPersonalHistory patientPersonalHistory = PatientPersonalHistory(
      name: nameController.text.trim(),
      age: ageController.text.trim(),
      address: addressController.text.trim(),
      occupation: occupationController.text.trim(),
      gender: gender,
      martialStatus: martialStatus,
      childrenNumber: int.tryParse(childrenNumberController.text),
      specialHabits: specailHabitController.text.trim(),
    );

    return patientPersonalHistory.toJson();
  }

  editPersonalHistory() {}
}

class PersonalHistoryFormState {}

class PersonalHistoryFormInitial extends PersonalHistoryFormState {}
