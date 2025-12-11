import 'dart:convert';

import 'package:my_graduation/features/data/models/doctors_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  late final SharedPreferences sharedPreferences;
  final String kDocror = "doctor";
  final String kisLoggedIn = "isLoggedIn";

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  saveDoctor(DoctorsModel doctor) {
    final Map<String, dynamic> json = doctor.toJson();
    final String docString = jsonEncode(json);

    sharedPreferences.setString(kDocror, docString);
  }

  isLoggedIn() {
    sharedPreferences.setBool(kisLoggedIn, true);
  }
}
