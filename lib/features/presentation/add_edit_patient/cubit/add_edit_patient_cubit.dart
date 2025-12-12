import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/services/firebsase/firestore_helper.dart';
import 'package:my_graduation/features/data/models/patient_personal_history.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';

class AddEditPatientCubit extends Cubit<AddEditPatientState> {
  AddEditPatientCubit() : super(AddEditPatientInitial());
  PatientPersonalHistory patientModel = PatientPersonalHistory();

  savePatientPersonalHistory(
    String name,
    String id,
    PatientPersonalHistory patientPersonalHistory,
  ) async {
    emit(AddEditPatientLoading());
    patientModel = PatientPersonalHistory(
      name: name,
      id: id,
      age: patientPersonalHistory.age,
      address: patientPersonalHistory.address,
      occupation: patientPersonalHistory.occupation,
      gender: patientPersonalHistory.gender,
      doctorId: patientPersonalHistory.doctorId,
      doctorName: patientPersonalHistory.doctorName,
      martialStatus: patientPersonalHistory.martialStatus,
      childrenNumber: patientPersonalHistory.childrenNumber,
      specialHabits: patientPersonalHistory.specialHabits,
    );
    String result = await FirestoreHelper.savePesonalHistory(patientModel, );
    if (result == "success") {
      emit(AddEditPatientSuccess());
    } else {
      emit(AddEditPatientFailure(result));
    }
  }

  savePatientPastMedicalHistory() {}
  savePatientTherapueticHistory() {}
  savePatientFamilyHistory() {}
  savePatientPresentHistory() {}
}
