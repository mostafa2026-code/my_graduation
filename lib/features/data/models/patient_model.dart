class PatientModel {
  String? id;
  String? doctorName;
  String? doctorId;
  String? phone;
  Map<String, dynamic>? personalHistory;
  Map<String, dynamic>? analysisofcomplains;
  Map<String, dynamic>? pastMedicalHistory;
  Map<String, dynamic>? theraputicHistory;
  String? diagnosis;
  Map<String, dynamic>? chestInspection;

  PatientModel({
    this.id,
    this.doctorId,
    this.doctorName,
    this.phone,
    this.personalHistory,
    this.analysisofcomplains,
    this.pastMedicalHistory,
    this.theraputicHistory,
    this.diagnosis,
    this.chestInspection,
  });

  //to Json
  Map<String, dynamic> toJson() => {
    'doctorName': doctorName,
    'doctorId': doctorId,
    'phone': phone,
    'id':id,
    'personalHistory': personalHistory,
    'analysisofcomplains': analysisofcomplains,
    'pastMedicalHistory': pastMedicalHistory,
    'theraputicHistory': theraputicHistory,
    'diagnosis': diagnosis,
    'chestInspection': chestInspection,
  };

  //fromJson
  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
    id: json['id'],
    doctorId: json['doctorId'],
    doctorName: json['doctorName'],
    phone: json['phone'],
    personalHistory: json['personalHistory'],
    analysisofcomplains: json['analysisofcomplains'],
    pastMedicalHistory: json['pastMedicalHistory'],
    theraputicHistory: json['theraputicHistory'],
    diagnosis: json['diagnosis'],
    chestInspection: json['chestInspection'],
  );

  //edit
  PatientModel copyWith({
    String? id,
    String? doctorName,
    String? doctorId,

    String? email,
    String? phone,
    Map<String, dynamic>? personalHistory,
    Map<String, dynamic>? analysisofcomplains,
    Map<String, dynamic>? pastMedicalHistory,
    Map<String, dynamic>? theraputicHistory,
    String? diagnosis,
    Map<String, dynamic>? chestInspection,
  }) => PatientModel(
    id: id ?? this.id,
    doctorId: doctorId ?? this.doctorId,
    doctorName: doctorName ?? doctorName,

    phone: phone ?? this.phone,
    personalHistory: personalHistory ?? this.personalHistory,
    analysisofcomplains: analysisofcomplains ?? this.analysisofcomplains,
    pastMedicalHistory: pastMedicalHistory ?? this.pastMedicalHistory,
    theraputicHistory: theraputicHistory ?? this.theraputicHistory,
    diagnosis: diagnosis ?? this.diagnosis,
    chestInspection: chestInspection ?? this.chestInspection,
  );
}
