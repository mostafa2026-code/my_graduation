import 'dart:developer';

class PatientcomplainAnalysis {
  String? complain;
  String? onset;
  String? duration;
  String? course;
  String? associatedSymptoms;
  String? reliefFactors;
  String? aggravatingFactors;
  String? specialCharacteristics;

  PatientcomplainAnalysis({
    this.complain,
    this.onset,
    this.duration,
    this.course,
    this.associatedSymptoms,
    this.reliefFactors,
    this.aggravatingFactors,
    this.specialCharacteristics,
  });

  /// from json
  PatientcomplainAnalysis.fromJson(Map<String, dynamic> json) {
    complain = json['complain'];
    onset = json['onset'];
    duration = json['duration'];
    course = json['course'];
    associatedSymptoms = json['associatedSymptoms'];
    reliefFactors = json['reliefFactors'];
    aggravatingFactors = json['aggravatingFactors'];
    specialCharacteristics = json['specialCharacteristics'];
  }

  //to json

  Map<String, dynamic> toJson() {
    try {
      final Map<String, dynamic> data = {
        'complain': complain,
        'onset': onset,
        'duration': duration,
        'course': course,
        'associatedSymptoms': associatedSymptoms,
        'reliefFactors': reliefFactors,
        'aggravatingFactors': aggravatingFactors,
        'specialCharacteristics': specialCharacteristics,
      };
      return data;
    } on Exception catch (e) {
      log(e.toString());
      return {};
    }
  }

  PatientcomplainAnalysis copyWith({
    String? complain,
    String? onset,
    String? duration,
    String? course,
    String? associatedSymptoms,
    String? reliefFactors,
    String? aggravatingFactors,
    String? specialCharacteristics,
  }) {
    return PatientcomplainAnalysis(
      complain: complain ?? this.complain,
      onset: onset ?? this.onset,
      duration: duration ?? this.duration,
      course: course ?? this.course,
      associatedSymptoms: associatedSymptoms ?? this.associatedSymptoms,
      reliefFactors: reliefFactors ?? this.reliefFactors,
      aggravatingFactors: aggravatingFactors ?? this.aggravatingFactors,
      specialCharacteristics:
          specialCharacteristics ?? this.specialCharacteristics,
    );
  }
}
