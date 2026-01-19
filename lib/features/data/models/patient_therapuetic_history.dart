class PatientTherapueticHistory {
  
  
  String? drugTherapy;
  String? allergyToDrugs;
  String? recentPrescribedDrugs;

  PatientTherapueticHistory({
    
    this.drugTherapy,
    this.allergyToDrugs,
    this.recentPrescribedDrugs,
  });

  //toJson method
  Map<String, dynamic> toJson() {
    return {
     
      'drugTherapy': drugTherapy,
      'allergyToDrugs': allergyToDrugs,
      'recentPrescribedDrugs': recentPrescribedDrugs,
    };
  }



  //fromJson method
  factory PatientTherapueticHistory.fromJson(Map<String, dynamic> json) {
    return PatientTherapueticHistory(
      
      drugTherapy: json['drugTherapy'],
      allergyToDrugs: json['allergyToDrugs'],
      recentPrescribedDrugs: json['recentPrescribedDrugs'],
    );
  }
  
  
}
