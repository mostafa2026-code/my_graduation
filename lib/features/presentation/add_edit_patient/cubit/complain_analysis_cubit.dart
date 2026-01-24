import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/enums/my_enums.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/data/models/patientcomplain_analysis.dart';

class ComplainAnalysisCubit extends Cubit<ComplainAnalysisState> {
  ComplainAnalysisCubit() : super(ComplainAnalysisInitial());

  Onset? onset;
  Course? course;
  final TextEditingController durationController = TextEditingController();
  final TextEditingController releivingFactorController =
      TextEditingController();
  final TextEditingController exaeratingFactorController =
      TextEditingController();
  final TextEditingController complaintController = TextEditingController();
  final TextEditingController specialCharacter = TextEditingController();
  final TextEditingController associatedSymptomsController =
      TextEditingController();
  PatientcomplainAnalysis? patientcomplainAnalysis;

  void selectOnset(Onset value) {
    if (onset == value) {
      onset = null;
    } else {
      onset = value;
    }
    emit(ComplainAnalysisInitial());
  }

  void selectCourse(Course value) {
    if (course == value) {
      course = null;
    } else {
      course = value;
    }
    emit(ComplainAnalysisInitial());
  }

  PatientModel? saveComplainAnalysisModel(PatientModel model) {
    PatientcomplainAnalysis patientComplainAnalysis = PatientcomplainAnalysis(
      aggravatingFactors: exaeratingFactorController.text.trim(),
      reliefFactors: releivingFactorController.text.trim(),
      associatedSymptoms: associatedSymptomsController.text.trim(),
      onset: onset.toString(),
      course: course.toString(),
      duration: durationController.text.trim(),
      specialCharacteristics: specialCharacter.text.trim(),
      complain: complaintController.text.trim(),
    );
    PatientModel patient = model.copyWith(
      analysisofcomplains: patientComplainAnalysis.toJson(),
    );
    emit(ComplainAnalysisInitial());
    return patient;
  }
}

class ComplainAnalysisState {}

class ComplainAnalysisInitial extends ComplainAnalysisState {}
