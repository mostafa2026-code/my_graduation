import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/features/data/models/patient_therapuetic_history.dart';

class TheraputicHistoryFormState {}

class TheraputicHistoryFormInitial extends TheraputicHistoryFormState {}

class TheraputicHistoryFormCubit extends Cubit<TheraputicHistoryFormState> {
  TheraputicHistoryFormCubit() : super(TheraputicHistoryFormInitial());
   TextEditingController drugs = TextEditingController();
   TextEditingController drugsAllergy = TextEditingController();
   TextEditingController recentPrescribedDrugs = TextEditingController();

  Map<String, dynamic>? saveTheraputicHistoryModel() {
    PatientTherapueticHistory patientTherapueticHistory =
        PatientTherapueticHistory(
          drugTherapy: drugs.text.trim(),
          allergyToDrugs: drugsAllergy.text.trim(),
          recentPrescribedDrugs: recentPrescribedDrugs.text.trim(),
        );

    return patientTherapueticHistory.toJson();
  }
}
