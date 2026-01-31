import 'dart:convert';

import 'package:my_graduation/features/data/models/doctors_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static late final SharedPreferences sharedPreferences;
  static const String kDocror = "doctor";
  static const String kisLoggedIn = "isLoggedIn";
  static const String kThemeMode = "themeMode";
  static const String kOnboarding = "onboarding";

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

  static bool isLoggedIn() {
    return sharedPreferences.getBool(kisLoggedIn) ?? false;
  }

  static saveOnboardingDone() {
    sharedPreferences.setBool(kOnboarding, true);
  }

  static bool isOnboardingDone() {
    return sharedPreferences.getBool(kOnboarding) ?? false;
  }

  static DoctorsModel? getUserInfo() {
    final String? docString = sharedPreferences.getString(kDocror);
    if (docString == null) return null;

    try {
      final Map<String, dynamic> json = Map<String, dynamic>.from(
        jsonDecode(docString),
      );

      // Merge patientsIds if they are stored separately
      final List<String>? ids = sharedPreferences.getStringList('patientsIds');
      if (ids != null) {
        json['patientsIds'] = ids;
      }

      return DoctorsModel.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  static Future<void> saveThemeMode(bool isDark) async {
    await sharedPreferences.setBool(kThemeMode, isDark);
  }

  static bool getThemeMode() {
    return sharedPreferences.getBool(kThemeMode) ?? false;
  }
}
