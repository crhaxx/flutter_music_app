import 'package:flutter/material.dart';
import 'package:flutter_music_app/themes/dark_mode.dart';
import 'package:flutter_music_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //NOTE: light mode
  ThemeData _themeData = lightMode;

  //NOTE: get theme
  ThemeData get themeData => _themeData;

  //NOTE: is dark mode
  bool get isDarkMode => _themeData == darkMode;

  //NOTE: set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    //NOTE: update UI
    notifyListeners();
  }

  //NOTE: toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
