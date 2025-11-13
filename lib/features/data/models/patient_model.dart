class PatientModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  Map<String, dynamic>? personalHistory;
  Map<String, dynamic>? analysisofcomplains;
  Map<String, dynamic>? pastMedicalHistory;
  Map<String, dynamic>? theraputicHistory;
  

  PatientModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.personalHistory,
    this.analysisofcomplains,
    this.pastMedicalHistory,
    this.theraputicHistory,
  });

}
