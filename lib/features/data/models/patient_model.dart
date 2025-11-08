import 'package:my_graduation/core/enums/my_enums.dart';

class PatientModel {
  // Basic info
  String? id;
  String? name;
  String? age;
  String? gender;
  String? address;
  String? occupation;
  String? phone;
  String? email;
  String? password;
  String? doctorId;
  String? doctorName;
  String? specialHabit;

  // Personal History
  late Map<String, dynamic>? personalHistory;
  // history  of present Illness
  List<String>? complain;
  Onset? onset;
  String? duration;
  Course? course;
  List<String>? associatedSymptoms;
  List<String>? reliefFactors;
  List<String>? aggravatingFactors;
  List<String>? specialCharacteristics;

  late Map<String, dynamic>? complainAnalysis;

  List<String>? generalSymptoms;
  List<String>? sympotmsOfOtherSystems;

  List<String>? similarCondition;
  List<String>? previousHospitalizationCondition;
  List<String>? previousOperations;
  List<String>? previousChronicDiseases;
  List<String>? bloodTransfusion;
  List<String>? foodAllergy;

  Map<String, dynamic>? pastMedicalHistory={
    
  };
  //familyHistory
  List<String>? abnormalityInFamilyHistory;

  List<String>? drugTherapy;
  List<String>? allergyToDrugs;
  List<String>? recentPrescribedDrugs;

  Map<String, dynamic>? therapueticHistory;

  //generalExamination
  List<String>? generalExaminationAbnormality;

  //special
  List<String>? specialExaminationAbnormality;
  //additionalExamination
  List<String>? diagnosis;

  List<String>? managment;
  List<String>? investigationsRequired;

  PatientModel({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.address,
    this.occupation,
    this.phone,
    this.email,
    this.password,
    this.doctorId,
    this.doctorName,
    this.specialHabit,

    this.complain,
    this.onset,
    this.duration,
    this.course,
    this.associatedSymptoms,
    this.reliefFactors,
    this.aggravatingFactors,
    this.specialCharacteristics,
    // this.complainAnalysis,
    this.generalSymptoms,
    this.sympotmsOfOtherSystems,
    this.similarCondition,
    this.previousHospitalizationCondition,
    this.previousOperations,
    this.previousChronicDiseases,
    this.bloodTransfusion,
    this.foodAllergy,
    // this.pastMedicalHistory,
    this.abnormalityInFamilyHistory,
    this.drugTherapy,
    this.allergyToDrugs,
    this.recentPrescribedDrugs,
    // this.therapueticHistory,
    this.generalExaminationAbnormality,
    this.specialExaminationAbnormality,
    this.diagnosis,
    this.managment,
    this.investigationsRequired,
  }) : personalHistory = {
         "name": name,
         "age": age,
         "gender": gender,
         "address": address,
         "occupation": occupation,
         "specialHabit": specialHabit,
       },
       complainAnalysis = {
         "onset": onset,
         "duration": duration,
         "course": course,
         "reliefFactors": reliefFactors,
         "aggravatingFactors": aggravatingFactors,
         "specialCharacteristics": specialCharacteristics,
       },
       pastMedicalHistory = {
         "similarCondition": similarCondition,
         "previousHospitalizationCondition": previousHospitalizationCondition,
         "previousOperations": previousOperations,
         "previousChronicDiseases": previousChronicDiseases,
         "bloodTransfusion": bloodTransfusion,
         "foodAllergy": foodAllergy,
       },

       therapueticHistory = {
         "drugTherapy": drugTherapy,
         "allergyToDrugs": allergyToDrugs,
         "recentPrescribedDrugs": recentPrescribedDrugs,
       };



     
}
