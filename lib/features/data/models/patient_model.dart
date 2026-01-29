class PatientModel {
  String? id;
  String? doctorName;
  String? doctorId;
  String? phone;
  Map<String, dynamic>? personalHistory;
  Map<String, dynamic>? analysisofcomplains;
  Map<String, dynamic>? pastMedicalHistory;
  Map<String, dynamic>? theraputicHistory;
  Map<String, dynamic>? familyHistory;
  String? date;

  String? examinationAbnormalities;
  String? neededInvestigation;

  String? diagnosis;

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
    this.examinationAbnormalities,
    this.neededInvestigation,
    this.familyHistory,
    this.date,
  });

  //to Json
  Map<String, dynamic> toJson() => {
    'doctorName': doctorName,
    'doctorId': doctorId,
    'phone': phone,
    'id': id,
    'personalHistory': personalHistory,
    'analysisofcomplains': analysisofcomplains,
    'pastMedicalHistory': pastMedicalHistory,
    'theraputicHistory': theraputicHistory,
    'diagnosis': diagnosis,
    'examinationAbnormalities': examinationAbnormalities,
    'neededInvestigation': neededInvestigation,
    'familyHistory': familyHistory,
    'date': date,
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
    examinationAbnormalities: json['examinationAbnormalities'],
    neededInvestigation: json['neededInvestigation'],
    familyHistory: json['familyHistory'],
    date: json['date'],
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
    Map<String, dynamic>? familyHistory,
    String? date,

    String? examinationAbnormalities,
    String? neededInvestigation,
    String? diagnosis,
  }) => PatientModel(
    id: id ?? this.id,
    doctorId: doctorId ?? this.doctorId,
    doctorName: doctorName ?? this.doctorName,

    phone: phone ?? this.phone,
    personalHistory: personalHistory ?? this.personalHistory,
    analysisofcomplains: analysisofcomplains ?? this.analysisofcomplains,
    pastMedicalHistory: pastMedicalHistory ?? this.pastMedicalHistory,
    theraputicHistory: theraputicHistory ?? this.theraputicHistory,
    familyHistory: familyHistory ?? this.familyHistory,
    diagnosis: diagnosis ?? this.diagnosis,
    examinationAbnormalities:
        examinationAbnormalities ?? this.examinationAbnormalities,
    neededInvestigation: neededInvestigation ?? this.neededInvestigation,
    date: date ?? this.date,
  );
  static PatientModel dummy() => PatientModel(
    id: '123456789',
    doctorName: 'Dr. John Doe',
    phone: '01234567890',
    diagnosis: 'Heart Failure',
    personalHistory: {'name': 'Patient Name'},
    date: '2026-01-29',
  );
}
