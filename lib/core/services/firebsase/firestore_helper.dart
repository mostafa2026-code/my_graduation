import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_graduation/core/services/shared_prefrences/shared_helper.dart';
import 'package:my_graduation/features/data/models/doctors_model.dart';

import 'package:my_graduation/features/data/models/patient_model.dart';

class FirestoreHelper {
  static const String kpatientsCollection = 'patients';
  static const String doctorCollection = 'doctors';
  static DoctorsModel? get doctorsModel => SharedHelper.getUserInfo();
  static String? get name => doctorsModel?.name;
  static String? get email => doctorsModel?.email;
  static String? get uid => doctorsModel?.id;

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

  static Future<String> updatePatientData(PatientModel patient) async {
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
      'id': patient.id,
      'doctorId': patient.doctorId,
      'doctorName': patient.doctorName,
      'phone': patient.phone,
      'personalHistory': patient.personalHistory,
      'analysisofcomplains': patient.analysisofcomplains,
      'pastMedicalHistory': patient.pastMedicalHistory,
      'theraputicHistory': patient.theraputicHistory,
      'diagnosis': patient.diagnosis,
    });
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllPatient() {
    return _firestore
        .collection(kpatientsCollection)
        .where("doctorId", isEqualTo: uid)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getPatientByDisease(
    String diagnosis,
  ) {
    return _firestore
        .collection(kpatientsCollection)
        .where("diagnosis", isEqualTo: diagnosis)
        .where("doctorId", isEqualTo: uid)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>
  getPatientWithoutDiagnosis() {
    return _firestore
        .collection(kpatientsCollection)
        .where("diagnosis", isNull: true)
        .where("doctorId", isEqualTo: uid)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> filterAndSearchPatient(
    String? diagnosis,
    String? sortBy,
    String? name,
  ) {
    log(
      "Query Parameters: diagnosis=$diagnosis, sortBy=$sortBy, name=$name, uid=$uid",
    );

    Query<Map<String, dynamic>> collectionReference = _firestore
        .collection(kpatientsCollection)
        .where("doctorId", isEqualTo: uid);

    if (diagnosis != null && diagnosis.isNotEmpty) {
      collectionReference = collectionReference.where(
        "diagnosis",
        isEqualTo: diagnosis,
      );
    }

    if (name != null && name.trim().isNotEmpty) {
      log("Adding name search order");
      collectionReference = collectionReference.orderBy(
        FieldPath(['personalHistory', 'name']),
      );
      collectionReference = collectionReference.startAt([name]).endAt([
        '$name\uf8ff',
      ]);
    } else {
      log("Adding sort order: $sortBy");
      // لو مفيش بحث بالاسم → نفرز حسب sortBy
      switch (sortBy) {
        case "name":
          collectionReference = collectionReference.orderBy(
            FieldPath(['personalHistory', 'name']),
          );
          break;
        case "age":
          collectionReference = collectionReference.orderBy(
            FieldPath(['personalHistory', 'age']),
          );
          break;

        default:
          collectionReference = collectionReference.orderBy(
            FieldPath(['personalHistory', 'name']),
          );
      }
    }
    return collectionReference.snapshots();
  }
}
