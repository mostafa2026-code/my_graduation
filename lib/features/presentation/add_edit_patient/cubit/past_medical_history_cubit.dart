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

  PatientModel? savePastMedicalHistoryModel(PatientModel model) {
    PatientPastMedicalHistory patientPastMedicalHistory =
        PatientPastMedicalHistory(
          similarCondition: similarConditionController.text,
          previousChronicDiseases: previosChronicDiseasesController.text,
          previousHospitalizationCondition:
              previousHospitalizationController.text,
          bloodTransfusion: bloodTransfusionController.text,
          foodAllergy: foodAllergyController.text,
        );
    PatientModel patient = model.copyWith(
      pastMedicalHistory: patientPastMedicalHistory.toJson(),
    );
    emit(PastMedicalHistoryInitial());
    return patient;
  }
}

class PastMedicalHistoryState {}

class PastMedicalHistoryInitial extends PastMedicalHistoryState {}
