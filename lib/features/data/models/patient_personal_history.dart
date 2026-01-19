import 'package:my_graduation/core/enums/my_enums.dart';

class PatientPersonalHistory {

  String? name;
  String? age;
  Gender? gender;
  String? address;
  String? occupation;
  String? specialHabits;
  MartialStatus? martialStatus;
  int? childrenNumber;
  

  PatientPersonalHistory({
    
    this.name,
    this.age,
    this.gender,
    this.address,
    this.occupation,
    this.specialHabits,
    this.martialStatus,
    this.childrenNumber = 0,
    
  });

  // from json
  PatientPersonalHistory.fromJson(Map<String, dynamic> json) {
   
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    address = json['address'];
    occupation = json['occupation'];
    specialHabits = json['specialHabits'];
    martialStatus = json['martialStatus'];
    childrenNumber = json['childrenNumber'];
 
  }

  Map<String, dynamic> toJson() => {
 
    'name': name,
    'age': age,
    'gender': gender,
    'address': address,
    'occupation': occupation,
    'specialHabits': specialHabits,
    'martialStatus': martialStatus,
    'childrenNumber': childrenNumber,
   
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
    
  }) {
    return PatientPersonalHistory(
      
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      occupation: occupation ?? this.occupation,
      specialHabits: specialHabits ?? this.specialHabits,
      martialStatus: martialStatus ?? this.martialStatus,
      childrenNumber: childrenNumber ?? this.childrenNumber,
     
    );
  }
}
