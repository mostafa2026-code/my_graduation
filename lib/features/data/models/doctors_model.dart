class DoctorsModel {
  String? name;
  String? image;
  String? speciality;
  String? address;
  List<String>? phone;
  String? email;
  String? id;
  String? password;
  String? position;
  List<String>? qualification;
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
    name = json['name'];
    image = json['image'];
    speciality = json['speciality'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
    password = json['password'];
    position = json['position'];
    qualification = json['qualification'];
    about = json['about'];
    patientsIds = json['patientsIds'];
    salary = json['salary'];
    fromHour = json['fromHour'];
    toHour = json['toHour'];
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



}
