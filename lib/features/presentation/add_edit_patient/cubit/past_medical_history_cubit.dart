import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/data/models/patient_past_medical_history.dart';

class PastMedicalHistoryCubit extends Cubit<PastMedicalHistoryState> {
  PastMedicalHistoryCubit() : super(PastMedicalHistoryInitial());
  final TextEditingController similarConditionController =
      TextEditingController();

  final TextEditingController previosChronicDiseasesController =
      TextEditingController();

  final TextEditingController previousHospitalizationController =
      TextEditingController();

  final TextEditingController bloodTransfusionController =
      TextEditingController();

  final TextEditingController foodAllergyController = TextEditingController();

  Map<String, dynamic>? setPastMedicalHistoryModel() {
    PatientPastMedicalHistory patientPastMedicalHistory =
        PatientPastMedicalHistory(
          similarCondition: similarConditionController.text.trim(),
          previousChronicDiseases: previosChronicDiseasesController.text.trim(),
          previousHospitalizationCondition: previousHospitalizationController
              .text
              .trim(),
          bloodTransfusion: bloodTransfusionController.text.trim(),
          foodAllergy: foodAllergyController.text.trim(),
        );

    emit(PastMedicalHistoryInitial());
    return patientPastMedicalHistory.toJson();
  }
}

class PastMedicalHistoryState {}

class PastMedicalHistoryInitial extends PastMedicalHistoryState {}
