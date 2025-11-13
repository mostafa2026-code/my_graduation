class PatientPersonalHistory {
  String? id;
  String? name;
  String? age;
  String? gender;
  String? address;
  String? occupation;
  List<String>? specialHabits;
  bool? married;
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
    this.married,
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
    married = json['married'];
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
    'married': married,
    'childrenNumber': childrenNumber,
    'doctorId': doctorId,
    'doctorName': doctorName,
  };

  PatientPersonalHistory copyWith({
    String? id,
    String? name,
    String? age,
    String? gender,
    String? address,
    String? occupation,
    List<String>? specialHabits,
    bool? married,
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
      married: married ?? this.married,
      childrenNumber: childrenNumber ?? this.childrenNumber,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
    );
  }
}
