//TODO color change

import 'package:flutter/material.dart';

const lightPrimary = Color(0xFFFFC107);
const lightSecondary = Color(0xFF333333);
const lightBackGround = Color(0xFF333333);

const darkPrimary = Color.fromARGB(255, 216, 216, 216);
const darkBackground = Color.fromARGB(255, 85, 110, 83);

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
