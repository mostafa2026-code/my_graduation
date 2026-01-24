// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/data/models/patient_therapuetic_history.dart';

class TheraputicHistoryFormState {}

class TheraputicHistoryFormInitial extends TheraputicHistoryFormState {}

class TheraputicHistoryFormCubit extends Cubit<TheraputicHistoryFormState> {
  TheraputicHistoryFormCubit() : super(TheraputicHistoryFormInitial());
  final TextEditingController drugs = TextEditingController();
  final TextEditingController drugsAllergy = TextEditingController();
  final TextEditingController recentPrescribedDrugs = TextEditingController();



 PatientModel ?saveTheraputicHistoryModel( PatientModel model){
    PatientTherapueticHistory patientTherapueticHistory = PatientTherapueticHistory(
      drugTherapy: drugs.text,
      allergyToDrugs: drugsAllergy.text,
      recentPrescribedDrugs: recentPrescribedDrugs.text,
    );
    PatientModel patientModel =model.copyWith(
      theraputicHistory: patientTherapueticHistory.toJson(),
    );
    return patientModel;

  }
}
