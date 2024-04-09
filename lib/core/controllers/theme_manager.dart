import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  bool _isDarkMode = false;

  get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  get isDarkMode => _isDarkMode;

  Future<void> getPref() async {
    final pref = await SharedPreferences.getInstance();
    final theme = pref.getBool('theme');
    if (theme != null) {
      _isDarkMode = theme;
    }
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final pref = await SharedPreferences.getInstance();
    _isDarkMode = !_isDarkMode;
    await pref.setBool('theme', _isDarkMode);
    notifyListeners();
  }
}
