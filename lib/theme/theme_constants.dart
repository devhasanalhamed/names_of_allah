//TODO color change

import 'package:flutter/material.dart';

const lightPrimary = Color.fromARGB(255, 100, 163, 111);
const lightBackGround = Color.fromARGB(255, 247, 247, 247);

const darkPrimary = Color.fromARGB(255, 216, 216, 216);
const darkBackground = Color.fromARGB(255, 85, 110, 83);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: lightPrimary,
  appBarTheme: const AppBarTheme(
    color: lightPrimary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: lightBackGround,
    foregroundColor: lightPrimary,
  ),
  backgroundColor: lightBackGround,
  fontFamily: 'NotoKufiArabic',
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 230, 72, 72),
  ),
  splashColor: lightPrimary,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: darkPrimary,
  focusColor: Colors.black,
  appBarTheme: const AppBarTheme(
    color: darkBackground,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: darkBackground,
    foregroundColor: darkPrimary,
  ),
  backgroundColor: darkBackground,
  fontFamily: 'NotoKufiArabic',
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 194, 16, 16),
  ),
  splashColor: darkPrimary,
);
