class PatientFamilyHistory {
  String? id;
  String? name;
  String? consanguinity;
  String? hereditaryDiseasesOfTheFamily;
  String? similarCondition;

  PatientFamilyHistory({
    this.id,
    this.name,
    this.consanguinity,
    this.hereditaryDiseasesOfTheFamily,
    this.similarCondition,
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'consanguinity': consanguinity,
      'hereditaryDiseasesOfTheFamily': hereditaryDiseasesOfTheFamily,
      'similarCondition': similarCondition,
    };
  }



  //from json
  factory PatientFamilyHistory.fromJson(Map<String, dynamic> json) {
    return PatientFamilyHistory(
      id: json['id'],
      name: json['name'],
      consanguinity: json['consanguinity'],
      hereditaryDiseasesOfTheFamily: json['hereditaryDiseasesOfTheFamily'],
      similarCondition: json['similarCondition'],
    );
  }
}