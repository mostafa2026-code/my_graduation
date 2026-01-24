import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/enums/my_enums.dart';
import 'package:my_graduation/features/data/models/patientcomplain_analysis.dart';

class ComplainAnalysisCubit extends Cubit<ComplainAnalysisState> {
  ComplainAnalysisCubit() : super(ComplainAnalysisInitial());

  Onset? onset;
  Course? course;
  TextEditingController durationController = TextEditingController();
  TextEditingController releivingFactorController = TextEditingController();
  TextEditingController exaeratingFactorController = TextEditingController();
  TextEditingController complaintController = TextEditingController();
  TextEditingController specialCharacter = TextEditingController();
  TextEditingController associatedSymptomsController = TextEditingController();

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

  Map<String, dynamic>? saveComplainAnalysisModel() {
    PatientcomplainAnalysis patientComplainAnalysis = PatientcomplainAnalysis(
      aggravatingFactors: exaeratingFactorController.text.trim(),
      reliefFactors: releivingFactorController.text.trim(),
      associatedSymptoms: associatedSymptomsController.text.trim(),
      onset: onset?.name,
      course: course?.name,
      duration: durationController.text.trim(),
      specialCharacteristics: specialCharacter.text.trim(),
      complain: complaintController.text.trim(),
    );

    emit(ComplainAnalysisInitial());
    return patientComplainAnalysis.toJson();
  }
}

class ComplainAnalysisState {}

class ComplainAnalysisInitial extends ComplainAnalysisState {}
