import 'package:flutter/material.dart';
import 'package:names_of_allah/core/storage/preferences.dart';


class ThemeController with ChangeNotifier {
  bool _isDarkMode = false;

  get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  get isDarkMode => _isDarkMode;

  Future<void> getPref() async {
    final theme = Preferences.pref.getBool('theme');
    if (theme != null) {
      _isDarkMode = theme;
    }
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await Preferences.pref.setBool('theme', _isDarkMode);
    notifyListeners();
  }
}
