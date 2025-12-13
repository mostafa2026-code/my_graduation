import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/services/firebsase/firestore_helper.dart';

import 'package:my_graduation/features/data/models/patient_model.dart';

import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';

import 'package:uuid/uuid.dart';

class AddEditPatientCubit extends Cubit<AddEditPatientState> {
  AddEditPatientCubit() : super(AddEditPatientInitial());
  String? id;
late   PatientModel currentPatient;
  PatientModel? generatePatient() {
    String id = generateId();
    PatientModel patient = PatientModel(id: id);
    currentPatient = patient;
    return currentPatient;
  }

  PatientModel setPatient(PatientModel newPatient) {
    currentPatient = newPatient;
    return currentPatient;
  }

  String generateId() {
    String id = Uuid().v4();
    return id;
  }

  Future<void> generateDoc(PatientModel patientModel) async {
    await FirestoreHelper.createPatientDocWithId(patientModel);
  }

  
  void updatePersonalHistory(Map<String, dynamic> history) {
    currentPatient = currentPatient.copyWith(personalHistory: history);
  }

  void updatePresentIllness(Map<String, dynamic> history) {
    currentPatient = currentPatient.copyWith(analysisofcomplains: history);
  }

  void updatePastMedicalHistory(Map<String, dynamic> history) {
    currentPatient = currentPatient.copyWith(pastMedicalHistory: history);
  }

  void updateTherapeuticHistory(Map<String, dynamic> history) {
    currentPatient = currentPatient.copyWith(theraputicHistory: history);
  }

  void updateChestInspection(Map<String, dynamic> history) {
    currentPatient = currentPatient.copyWith(chestInspection: history);
  }


  updatePatient() async {
    try {
      emit(AddEditPatientLoading());

      String result = await FirestoreHelper.updatePatientData(currentPatient);
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
