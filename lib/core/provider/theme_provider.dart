import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {

  var tm = ThemeMode.dark;
  String themeText = "d";

  void themeModeChange(newThemeVal) async {
    tm = newThemeVal;
    getThemeText(tm);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("themeText", themeText);
  }

  getThemeText(ThemeMode tm) {
    if (tm == ThemeMode.dark) {
      themeText = "d";
    } else {
      themeText = "l";
    }
    notifyListeners();
  }

  getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    themeText = prefs.getString("themeText") ?? "d";
    if (themeText == "d") {
      tm = ThemeMode.dark;
    } else if (themeText == "l") {
      tm = ThemeMode.light;
    }
    notifyListeners();
  }
}
