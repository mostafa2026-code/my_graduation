import 'dart:developer';

class PatientPastMedicalHistory {
 
  String? similarCondition;
  String ?previousHospitalizationCondition;
  String? previousOperations;
  String ?previousChronicDiseases;
  String ?bloodTransfusion;
  String ?foodAllergy;

  PatientPastMedicalHistory({
    
    this.similarCondition,
    this.previousHospitalizationCondition,
    this.previousOperations,
    this.previousChronicDiseases,
    this.bloodTransfusion,
    this.foodAllergy,
  });

  //tojson

  PatientPastMedicalHistory.fromJson(Map<String, dynamic> json) {
   
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
   
    String? similarCondition,
    String? previousHospitalizationCondition,
    String? previousOperations,
    String? previousChronicDiseases,
    String? bloodTransfusion,
    String? foodAllergy,
  }) {
    return PatientPastMedicalHistory(
      
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
