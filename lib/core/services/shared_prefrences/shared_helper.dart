import 'dart:convert';

import 'package:my_graduation/features/data/models/doctors_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static late final SharedPreferences sharedPreferences;
  static const String kDocror = "doctor";
  static const String kisLoggedIn = "isLoggedIn";

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveDoctor(DoctorsModel doctor) {
    final Map<String, dynamic> json = doctor.toJson();
    final String docString = jsonEncode(json);

    sharedPreferences.setString(kDocror, docString);
  }

  static saveIsLoggedIn() {
    sharedPreferences.setBool(kisLoggedIn, true);
  }

  static isLoggedIn() {
    sharedPreferences.getBool(kisLoggedIn);
  }

  static DoctorsModel? getUserInfo() {
    final String? docString = sharedPreferences.getString(kDocror);
    if (docString != null) {
      final Map<String, dynamic> json = jsonDecode(docString);
      DoctorsModel doctor = DoctorsModel.fromJson(json);
      return doctor;
    }
    return null;
  }
}
