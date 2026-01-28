import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  Future<void> setPreference(String keyPair, dynamic value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (value is bool) {
      await pref.setBool(keyPair, value);
    }
    if (value is int) {
      await pref.setInt(keyPair, value);
    }
    if (value is double) {
      await pref.setDouble(keyPair, value);
    }
    if (value is String) {
      await pref.setString(keyPair, value);
    }
  }

  Future<dynamic> getPreference(String keyPair) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.get(keyPair);
  }

  // Save user data
  Future<void> setUserData(
      Map<String, dynamic> userData, String keyPair) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataJson = jsonEncode(userData); // Convert user data to JSON
    prefs.setString(keyPair, userDataJson);
  }

  Future<void> removeUserData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(
      key,
    );
  }

  // Retrieve user data
  Future<Map<String, dynamic>?> getUserData(String keyPair) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataJson = prefs.getString(keyPair);
    if (userDataJson != null) {
      return jsonDecode(userDataJson); // Convert JSON back to Map
    }
    return null;
  }
}
