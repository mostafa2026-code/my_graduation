class PatientTherapueticHistory {
  String? id;
  String? name;
  String? doctorId;
  String? doctorName;
  String? drugTherapy;
  String? allergyToDrugs;
  String? recentPrescribedDrugs;

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
      id: json['id']  ,
      name: json['name'],
      doctorId: json['doctorId'],
      doctorName: json['doctorName'],
      drugTherapy: json['drugTherapy'],
      allergyToDrugs: json['allergyToDrugs'],
      recentPrescribedDrugs: json['recentPrescribedDrugs'],
    );
  }
  
  
}
