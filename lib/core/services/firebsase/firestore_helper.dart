import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/features/data/models/doctors_model.dart';

import 'package:my_graduation/features/data/models/patient_model.dart';

class FirestoreHelper {
  static const String kpatientsCollection = 'patients';
  static const String doctorCollection = 'doctors';
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static CollectionReference<Map<String, dynamic>> getPatientsCollection() {
    return _firestore.collection(kpatientsCollection);
  }

  static Future<void> createPatientDocWithId(PatientModel patientModel) async {
    await _firestore
        .collection(kpatientsCollection)
        .doc(patientModel.id)
        .set(patientModel.toJson());
  }

  static Future<String> updatePatientData( PatientModel patient) async {
    try {
      await getPatientsCollection()
          .doc(patient.id)
          .set(patient.toJson(), SetOptions(merge: true));

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
    _firestore.collection(kpatientsCollection).doc(patient.id).set({
      'doctorId': patient.doctorId,
      'doctorName': patient.doctorName,
      'phone': patient.phone,
      'personalHistory': patient.personalHistory,
      'analysisofcomplains': patient.analysisofcomplains,
      'pastMedicalHistory': patient.pastMedicalHistory,
      'theraputicHistory': patient.theraputicHistory,
    });
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getAllPatient() {
    return _firestore
        .collection(kpatientsCollection)
        .where("doctorId ", isEqualTo: FirebaseHelper.getUserId())
        .get();
  }

  static DocumentReference<Map<String, dynamic>> getPatientById(String? id) {
    return _firestore.collection(kpatientsCollection).doc(id);
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getPatientByDisease(
    String diagnosis,
  ) {
    return _firestore
        .collection(kpatientsCollection)
        .where("diagnosis", isEqualTo: diagnosis)
        .get();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>>
  getPatientWithoutDiagnosis() {
    return _firestore
        .collection(kpatientsCollection)
        .where("diagnosis", isNull: true)
        .get();
  }

  // static completeFilter(String diagnosis , String? occupation, String? residency, ) {
  //   return _firestore.collection(patientsCollection).where('diagnosis', isEqualTo: diagnosis).where('occupation', isEqualTo: occupation).where('residency', isEqualTo: residency).get();
  // }
}
