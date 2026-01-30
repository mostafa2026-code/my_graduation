class DoctorsModel {
  String? name;
  String? image;
  String? speciality;
  String? address;
  String? phone;
  String? email;
  String? id;
  String? password;
  String? position;
  String? qualification;
  String? about;
  List<String>? patientsIds;
  double? salary;
  String? fromHour;
  String? toHour;

  DoctorsModel({
    this.name,
    this.image,
    this.speciality,
    this.address,
    this.phone,
    this.email,
    this.id,
    this.password,
    this.position,
    this.qualification,
    this.about,
    this.patientsIds,
    this.salary,
    this.fromHour,
    this.toHour,
  });

  DoctorsModel.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    image = json['image']?.toString();
    speciality = json['speciality']?.toString();
    address = json['address']?.toString();
    phone = json['phone']?.toString();
    email = json['email']?.toString();
    id = json['id']?.toString();
    password = json['password']?.toString();
    position = json['position']?.toString();
    qualification = json['qualification']?.toString();
    about = json['about']?.toString();
    patientsIds = json['patientsIds'] != null
        ? List<String>.from(json['patientsIds'])
        : null;
    salary = json['salary'] is num ? (json['salary'] as num).toDouble() : null;
    fromHour = json['fromHour']?.toString();
    toHour = json['toHour']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['speciality'] = speciality;
    data['address'] = address;
    data['phone'] = phone;
    data['email'] = email;
    data['id'] = id;
    data['password'] = password;
    data['position'] = position;
    data['qualification'] = qualification;
    data['about'] = about;
    data['patientsIds'] = patientsIds;
    data['salary'] = salary;
    data['fromHour'] = fromHour;
    data['toHour'] = toHour;
    return data;
  }

  //copyWith

  DoctorsModel copyWith(
    String? name,
    String? image,
    String? speciality,
    String? address,
    String? phone,
    String? email,
    String? id,
    String? password,
    String? position,
    String? qualification,
    String? about,
    List<String>? patientsIds,
    double? salary,
    String? fromHour,
    String? toHour,
  ) {
    return DoctorsModel(
      name: name ?? this.name,
      image: image ?? this.image,
      speciality: speciality ?? this.speciality,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      id: id ?? this.id,
      password: password ?? this.password,
      position: position ?? this.position,
      qualification: qualification ?? this.qualification,
      about: about ?? this.about,
      patientsIds: patientsIds ?? this.patientsIds,
      salary: salary ?? this.salary,
      fromHour: fromHour ?? this.fromHour,
      toHour: toHour ?? this.toHour,
    );
  }
}
