class PatientTherapueticHistory {
  String? id;
  String? name;
  String? doctorId;
  String? doctorName;
  List<String>? drugTherapy;
  List<String>? allergyToDrugs;
  List<String>? recentPrescribedDrugs;

  PatientTherapueticHistory({
    this.id,
    this.name,
    this.doctorId,
    this.doctorName,
    this.drugTherapy,
    this.allergyToDrugs,
    this.recentPrescribedDrugs,
  });

  //toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'drugTherapy': drugTherapy,
      'allergyToDrugs': allergyToDrugs,
      'recentPrescribedDrugs': recentPrescribedDrugs,
    };
  }



  //fromJson method
  factory PatientTherapueticHistory.fromJson(Map<String, dynamic> json) {
    return PatientTherapueticHistory(
      id: json['id'],
      name: json['name'],
      doctorId: json['doctorId'],
      doctorName: json['doctorName'],
      drugTherapy: List<String>.from(json['drugTherapy'] ?? []),
      allergyToDrugs: List<String>.from(json['allergyToDrugs'] ?? []),
      recentPrescribedDrugs: List<String>.from(json['recentPrescribedDrugs'] ?? []),
    );
  }
}
