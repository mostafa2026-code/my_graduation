import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/services/firebsase/firestore_helper.dart';
import 'package:my_graduation/features/data/models/family_history.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/data/models/patient_past_medical_history.dart';
import 'package:my_graduation/features/data/models/patient_personal_history.dart';
import 'package:my_graduation/features/data/models/patient_therapuetic_history.dart';
import 'package:my_graduation/features/data/models/patientcomplain_analysis.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';

import 'package:uuid/uuid.dart';

class AddEditPatientCubit extends Cubit<AddEditPatientState> {
  AddEditPatientCubit() : super(AddEditPatientInitial());
    String? id;
   

  String generateId() {
    String id = Uuid().v4();
    return id;
  }

  savePatientPersonalHistory(
    PatientPersonalHistory patientPersonalHistory,
    PatientModel patientModel,
  ) async {
    try {
      emit(AddEditPatientLoading());

      String result = await FirestoreHelper.savePesonalHistory(
        patientPersonalHistory,
        patientModel,
      );
      if (result == "success") {
        emit(AddEditPatientSuccess());
      } else {
        emit(AddEditPatientFailure(result));
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(AddEditPatientFailure(e.toString()));
    }
  }

  savePatientPastMedicalHistory(
    PatientPastMedicalHistory patientPastMedicalHistory,
    PatientModel patientModel,
  ) async {
    try {
      emit(AddEditPatientLoading());

      String result = await FirestoreHelper.savePastHistory(
        patientPastMedicalHistory,
        patientModel,
      );
      if (result == "success") {
        emit(AddEditPatientSuccess());
      } else {
        emit(AddEditPatientFailure(result));
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(AddEditPatientFailure(e.toString()));
    }
  }

  savePresentIlnessHistory(
    PatientcomplainAnalysis patientcomplainAnalysis,
    PatientModel patientModel,
  ) async {
    try {
      emit(AddEditPatientLoading());

      String result = await FirestoreHelper.savePresentIllnessHistory(
        patientcomplainAnalysis,
        patientModel,
      );
      if (result == "success") {
        emit(AddEditPatientSuccess());
      } else {
        emit(AddEditPatientFailure(result));
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(AddEditPatientFailure(e.toString()));
    }
  }

  saveTherapeuticHistory(
    PatientTherapueticHistory patientTherapueticHistory,
    PatientModel patientModel,
  ) async {
    try {
      emit(AddEditPatientLoading());

      String result = await FirestoreHelper.saveTherapeuticHistory(
        patientTherapueticHistory,
        patientModel,
      );
      if (result == "success") {
        emit(AddEditPatientSuccess());
      } else {
        emit(AddEditPatientFailure(result));
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(AddEditPatientFailure(e.toString()));
    }
  }

  saveFamilyHistory(
    PatientFamilyHistory patientFamilyHistory,
    PatientModel patientModel,
  ) async {
    try {
      emit(AddEditPatientLoading());

      String result = await FirestoreHelper.saveFamilyHistory(
        patientFamilyHistory,
        patientModel,
      );
      if (result == "success") {
        emit(AddEditPatientSuccess());
      } else {
        emit(AddEditPatientFailure(result));
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(AddEditPatientFailure(e.toString()));
    }
  }
}
