class PatientModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  Map<String, dynamic>? personalHistory;
  Map<String, dynamic>? analysisofcomplains;
  Map<String, dynamic>? pastMedicalHistory;
  Map<String, dynamic>? theraputicHistory;
  List<String >? diagnosis;
  

  PatientModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.personalHistory,
    this.analysisofcomplains,
    this.pastMedicalHistory,
    this.theraputicHistory,
    this.diagnosis
  });


  //to Json 
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
    'personalHistory': personalHistory,
    'analysisofcomplains': analysisofcomplains,
    'pastMedicalHistory': pastMedicalHistory,
    'theraputicHistory': theraputicHistory,
    'diagnosis': diagnosis,
  };



  //fromJson
  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    personalHistory: json['personalHistory'],
    analysisofcomplains: json['analysisofcomplains'],
    pastMedicalHistory: json['pastMedicalHistory'],
    theraputicHistory: json['theraputicHistory'],
    diagnosis: json['diagnosis'],
  );




  //edit
  PatientModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    Map<String, dynamic>? personalHistory,
    Map<String, dynamic>? analysisofcomplains,
    Map<String, dynamic>? pastMedicalHistory,
    Map<String, dynamic>? theraputicHistory,
    List<String>? diagnosis,
  }) => PatientModel(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    personalHistory: personalHistory ?? this.personalHistory,
    analysisofcomplains: analysisofcomplains ?? this.analysisofcomplains,
    pastMedicalHistory: pastMedicalHistory ?? this.pastMedicalHistory,
    theraputicHistory: theraputicHistory ?? this.theraputicHistory,
    diagnosis: diagnosis ?? this.diagnosis,
  );  

}
