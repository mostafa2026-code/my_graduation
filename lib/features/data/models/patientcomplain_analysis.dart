import 'dart:developer';

class PatientcomplainAnalysis {
  String? id;
  String? name;
  String? doctorId;
  String? doctorName;
  String? complain;
  String? onset;
  String? duration;
  String? course;
  String? associatedSymptoms;
  String? reliefFactors;
  String? aggravatingFactors;
  String? specialCharacteristics;

  PatientcomplainAnalysis({
    this.id,
    this.name,
    this.doctorId,
    this.doctorName,
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
    id = json['id'];
    name = json['name'];
    doctorId = json['doctorId'];
    doctorName = json['doctorName'];
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
        'id': id,
        'name': name,
        'doctorId': doctorId,
        'doctorName': doctorName,
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
    String? id,
    String? name,
    String? doctorId,
    String? doctorName,
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
      id: id ?? this.id,
      name: name ?? this.name,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
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
