import 'package:my_graduation/core/enums/my_enums.dart';

class PatientPersonalHistory {
  String? id;
  String? name;
  String? age;
  Gender? gender;
  String? address;
  String? occupation;
  String? specialHabits;
  MartialStatus? martialStatus;
  int? childrenNumber;
  String? doctorId;
  String? doctorName;

  PatientPersonalHistory({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.address,
    this.occupation,
    this.specialHabits,
    this.martialStatus,
    this.childrenNumber = 0,
    this.doctorId,
    this.doctorName,
  });

  // from json
  PatientPersonalHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    address = json['address'];
    occupation = json['occupation'];
    specialHabits = json['specialHabits'];
    martialStatus = json['martialStatus'];
    childrenNumber = json['childrenNumber'];
    doctorId = json['doctorId'];
    doctorName = json['doctorName'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age,
    'gender': gender,
    'address': address,
    'occupation': occupation,
    'specialHabits': specialHabits,
    'martialStatus': martialStatus,
    'childrenNumber': childrenNumber,
    'doctorId': doctorId,
    'doctorName': doctorName,
  };

  PatientPersonalHistory copyWith({
    String? id,
    String? name,
    String? age,
    Gender? gender,
    String? address,
    String? occupation,
   String? specialHabits,
    MartialStatus? martialStatus,
    int? childrenNumber,
    String? doctorId,
    String? doctorName,
  }) {
    return PatientPersonalHistory(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      occupation: occupation ?? this.occupation,
      specialHabits: specialHabits ?? this.specialHabits,
      martialStatus: martialStatus ?? this.martialStatus,
      childrenNumber: childrenNumber ?? this.childrenNumber,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
    );
  }
}
