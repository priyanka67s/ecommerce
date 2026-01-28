// import 'package:shared_preferences/shared_preferences.dart';

// class PreferenceHelper {
//   static setString(String key, String value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(key, value);
//   }

//   static setInt(String key, int value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(key, value);
//   }

//   static setDouble(String key, double value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setDouble(key, value);
//   }

//   static setBool(String key, bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(key, value);
//   }

//   static Future<String?> getStringValue(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? stringValue = await prefs.getString(key);
//     return stringValue;
//   }

//   static Future<bool?> getBoolValue(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool? boolValue = await prefs.getBool(key);
//     return boolValue;
//   }

//   static Future<int?> getIntValue(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? intValue = await prefs.getInt(key);
//     return intValue;
//   }

//   static Future<double?> getDoubleValue(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     double? doubleValue = await prefs.getDouble(key);
//     return doubleValue;
//   }

//   static removeValue(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove(key);
//   }
// }
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<void> setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  static Future<void> setDouble(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  static Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static Future<String?> getStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<bool?> getBoolValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<int?> getIntValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future<double?> getDoubleValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  static Future<void> removeValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
