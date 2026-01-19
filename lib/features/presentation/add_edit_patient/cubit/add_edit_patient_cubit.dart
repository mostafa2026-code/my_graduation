import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/services/firebsase/firestore_helper.dart';
import 'package:my_graduation/core/services/shared_prefrences/shared_helper.dart';

import 'package:my_graduation/features/data/models/patient_model.dart';

import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';

import 'package:uuid/uuid.dart';

class AddEditPatientCubit extends Cubit<AddEditPatientState> {
  AddEditPatientCubit() : super(AddEditPatientInitial());
  String? id;
  late PatientModel currentPatient;
  PatientModel? generatePatient() {
    String id = generateId();
    PatientModel patient = PatientModel(
      id: id,
      doctorId: SharedHelper.getUserInfo()?.id,
      doctorName: SharedHelper.getUserInfo()?.name,
    );
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

  updatePatient(PatientModel patient) async {
    try {
      emit(AddEditPatientLoading());

      String result = await FirestoreHelper.updatePatientData(patient);
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
