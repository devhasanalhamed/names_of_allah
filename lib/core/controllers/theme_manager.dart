import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  bool _isDarkMode = false;

  get themeMode => _isDarkMode?ThemeMode.dark:ThemeMode.light;
  get isDarkMode => _isDarkMode;

  Future<void> getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getBool('theme');
    if(theme != null){
      _isDarkMode = theme;
    }
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = !_isDarkMode;
    await prefs.setBool('theme', _isDarkMode);
    notifyListeners();
  }
}