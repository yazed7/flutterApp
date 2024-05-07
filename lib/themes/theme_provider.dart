import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'light_mode.dart';


class ThemeProvider with ChangeNotifier {
  var _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  // ignore: non_constant_identifier_names
  set ThemeData(var themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    // notifyListeners();
  }
}
