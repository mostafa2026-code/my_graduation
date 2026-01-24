import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/features/data/models/family_history.dart';

class FamilyHistoryFormCubit extends Cubit<FamilyHistoryFormState> {
  FamilyHistoryFormCubit() : super(FamilyHistoryFormInitial());
  TextEditingController herediteryDiseasesOfTheFamilyController =
      TextEditingController();
  TextEditingController familyHistoryOfSimilarConditionController =
      TextEditingController();

  Map<String, dynamic> saveFamilyHistory() {
    PatientFamilyHistory patientFamilyHistory = PatientFamilyHistory(
      hereditaryDiseasesOfTheFamily: herediteryDiseasesOfTheFamilyController
          .text
          .trim(),
      similarCondition: familyHistoryOfSimilarConditionController.text.trim(),
    );
    emit(FamilyHistoryFormInitial());
    return patientFamilyHistory.toJson();
  }
}

class FamilyHistoryFormState {}

class FamilyHistoryFormInitial extends FamilyHistoryFormState {}
