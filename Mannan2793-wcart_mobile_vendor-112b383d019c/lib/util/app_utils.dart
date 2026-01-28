import 'package:flutter/material.dart';

class AppUtils {
  static bool parseBool(String status) {
    bool value = false;
    if (status.toLowerCase() == 'true') {
      value = true;
    } else if (status.toLowerCase() == 'false') {
      value = false;
    }
    return value;
  }

  // static bool parseBool(String status) => status.toLowerCase() == 'true';

  static double hs(double size, dynamic context) {
    return (size / 1728) * MediaQuery.of(context).size.width;
  }

  static double vs(double size, dynamic context) {
    return (size / 1309) * MediaQuery.of(context).size.height;
  }
}
