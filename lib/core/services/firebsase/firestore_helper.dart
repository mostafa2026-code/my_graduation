import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_graduation/features/data/models/doctors_model.dart';
import 'package:my_graduation/features/data/models/family_history.dart';
// import 'package:my_graduation/features/data/models/family_history.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/data/models/patient_past_medical_history.dart';
import 'package:my_graduation/features/data/models/patient_personal_history.dart';
import 'package:my_graduation/features/data/models/patient_therapuetic_history.dart';
import 'package:my_graduation/features/data/models/patientcomplain_analysis.dart';
// import 'package:my_graduation/features/data/models/patient_past_medical_history.dart';
// import 'package:my_graduation/features/data/models/patient_therapuetic_history.dart';
// import 'package:my_graduation/features/data/models/patientcomplain_analysis.dart';
// import 'package:my_graduation/features/data/models/patient_personal_history.dart';

class FirestoreHelper {
  static const String patientsCollection = 'patients';
  static const String doctorCollection = 'doctors';
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String personalSubCollection = "personalHistory";
  static const String presentIllnessSubCollection = "presentIllness";
  static const String therapeuticHistorySubCollection = "therapeuticHistory";
  static const String familyHistorySubCollection = "familyHistory";
  static const String pastSubCollection = "pastHistory";
    

  static Future<String> savePesonalHistory(
    PatientPersonalHistory patientPersonal,
    PatientModel pateintModel

  ) async {
    try {
      await _firestore
          .collection(patientsCollection)
          .doc(pateintModel.id)
          .collection(personalSubCollection)
          .add(patientPersonal.toJson());

      return "success";
    } on FirebaseException catch (e) {
      log(e.toString());
      return e.toString();
    }
  }
  static Future<String> savePresentIllnessHistory(
    PatientcomplainAnalysis complain,
    PatientModel patient,
  ) async {
    try {
      await _firestore
          .collection(patientsCollection)
          .doc(patient.id)
          .collection(presentIllnessSubCollection)
          .add(complain.toJson());

      return "success";
    } on FirebaseException catch (e) {
      log(e.toString());
      return e.toString();
    }
  }
  static Future<String> saveTherapeuticHistory(
    PatientTherapueticHistory therapy,
    PatientModel patient,
  ) async {
    try {
      await _firestore
          .collection(patientsCollection)
          .doc(patient.id)
          .collection(presentIllnessSubCollection)
          .add(therapy.toJson());

      return "success";
    } on FirebaseException catch (e) {
      log(e.toString());
      return e.toString();
    }
  }
  
  static Future<String> saveFamilyHistory(
    PatientFamilyHistory family,
    PatientModel patient,
  ) async {
    try {
      await _firestore
          .collection(patientsCollection)
          .doc(patient.id)
          .collection(presentIllnessSubCollection)
          .add(family.toJson());

      return "success";
    } on FirebaseException catch (e) {
      log(e.toString());
      return e.toString();
    }
  }
  static Future<String> savePastHistory(
    PatientPastMedicalHistory past,
    PatientModel patient,
  ) async {
    try {
      await _firestore
          .collection(patientsCollection)
          .doc(patient.id)
          .collection(presentIllnessSubCollection)
          .add(past.toJson());

      return "success";
    } on FirebaseException catch (e) {
      log(e.toString());
      return e.toString();
    }
  }
  
  
  static saveDoctorData(DoctorsModel doctor) {
    _firestore.collection(doctorCollection).doc(doctor.id).set(doctor.toJson());
  }

  static saveCompletePatientData(PatientModel patient) {
    _firestore.collection(patientsCollection).doc(patient.id).set({
      'name': patient.name,
      'email': patient.email,
      'phone': patient.phone,
      'personalHistory': patient.personalHistory,
      'analysisofcomplains': patient.analysisofcomplains,
      'pastMedicalHistory': patient.pastMedicalHistory,
      'theraputicHistory': patient.theraputicHistory,
    });
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getAllPatient() {
    return _firestore.collection(patientsCollection).get();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getPatientByDisease(
    String diagnosis,
  ) {
    return _firestore
        .collection(patientsCollection)
        .where("diagnosis", isEqualTo: diagnosis)
        .get();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>>
  getPatientWithoutDiagnosis() {
    return _firestore
        .collection(patientsCollection)
        .where("diagnosis", isNull: true)
        .get();
  }


  // static completeFilter(String diagnosis , String? occupation, String? residency, ) {
  //   return _firestore.collection(patientsCollection).where('diagnosis', isEqualTo: diagnosis).where('occupation', isEqualTo: occupation).where('residency', isEqualTo: residency).get();
  // }
}
