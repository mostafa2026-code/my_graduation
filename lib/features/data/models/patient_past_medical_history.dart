import 'dart:developer';

class PatientPastMedicalHistory {
  String? id;
  String? name;
  String? doctorId;
  String? doctorName;
  String? similarCondition;
  String ?previousHospitalizationCondition;
  String? previousOperations;
  String ?previousChronicDiseases;
  String ?bloodTransfusion;
  String ?foodAllergy;

  PatientPastMedicalHistory({
    this.id,
    this.name,
    this.doctorId,
    this.doctorName,
    this.similarCondition,
    this.previousHospitalizationCondition,
    this.previousOperations,
    this.previousChronicDiseases,
    this.bloodTransfusion,
    this.foodAllergy,
  });

  //tojson

  PatientPastMedicalHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    doctorId = json['doctorId'];
    doctorName = json['doctorName'];
    similarCondition = json['similarCondition'];
    previousHospitalizationCondition = json['previousHospitalizationCondition'];
    previousOperations = json['previousOperations'];
    previousChronicDiseases = json['previousChronicDiseases'];
    bloodTransfusion = json['bloodTransfusion'];
    foodAllergy = json['foodAllergy'];
  }

  Map<String, dynamic> toJson() {
    try {
      final Map<String, dynamic> data = {
        'id': id,
        'name': name,
        'doctorId': doctorId,
        'doctorName': doctorName,
        'similarCondition': similarCondition,
        'previousHospitalizationCondition': previousHospitalizationCondition,
        'previousOperations': previousOperations,
        'previousChronicDiseases': previousChronicDiseases,
        'bloodTransfusion': bloodTransfusion,
        'foodAllergy': foodAllergy,
      };
      return data;
    } on Exception catch (e) {
      log(e.toString());
      return {};
    }
  }

  PatientPastMedicalHistory copyWith({
    String? id,
    String? name,
    String? doctorId,
    String? doctorName,
    String? similarCondition,
    String? previousHospitalizationCondition,
    String? previousOperations,
    String? previousChronicDiseases,
    String? bloodTransfusion,
    String? foodAllergy,
  }) {
    return PatientPastMedicalHistory(
      id: id ?? this.id,
      name: name ?? this.name,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      similarCondition: similarCondition ?? this.similarCondition,
      previousHospitalizationCondition:
          previousHospitalizationCondition ??
          this.previousHospitalizationCondition,
      previousOperations: previousOperations ?? this.previousOperations,
      previousChronicDiseases:
          previousChronicDiseases ?? this.previousChronicDiseases,
      bloodTransfusion: bloodTransfusion ?? this.bloodTransfusion,
      foodAllergy: foodAllergy ?? this.foodAllergy,
    );
  }
}
