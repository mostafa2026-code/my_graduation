class PatientFamilyHistory {
  String? hereditaryDiseasesOfTheFamily;
  String? similarCondition;

  PatientFamilyHistory({
    this.hereditaryDiseasesOfTheFamily,
    this.similarCondition,
  });

  Map<String, dynamic> toJson() {
    return {
      'hereditaryDiseasesOfTheFamily': hereditaryDiseasesOfTheFamily,
      'similarCondition': similarCondition,
    };
  }

  //from json
  factory PatientFamilyHistory.fromJson(Map<String, dynamic> json) {
    return PatientFamilyHistory(
      hereditaryDiseasesOfTheFamily: json['hereditaryDiseasesOfTheFamily'],
      similarCondition: json['similarCondition'],
    );
  }

  PatientFamilyHistory copyWith(
    String? hereditaryDiseasesOfTheFamily,
    String? similarCondition,
  ) {
    return PatientFamilyHistory(
      hereditaryDiseasesOfTheFamily:
          hereditaryDiseasesOfTheFamily ?? this.hereditaryDiseasesOfTheFamily,
      similarCondition: similarCondition ?? this.similarCondition,
    );
  }
}
