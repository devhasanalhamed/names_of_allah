import 'package:flutter/material.dart';
import 'package:names_of_allah/core/colors/light_theme_colors.dart';

//TODO do the dark theme data

ThemeData getLightThemeData() => ThemeData(
      primaryColor: ColorsLight.primaryColor,
      backgroundColor: ColorsLight.backgroundColor,
      //*
      fontFamily: 'NotoKufiArabic',
      //! Colorscheme theme start here
      colorScheme: const ColorScheme.light(
        primary: ColorsLight.primaryColor,
        secondary: ColorsLight.secondaryColor,
        background: ColorsLight.backgroundColor,
      ),
      //! texttheme section
      textTheme: const TextTheme(
        titleLarge: TextStyle(),
        titleMedium: TextStyle(),
        titleSmall: TextStyle(),
        bodyLarge: TextStyle(),
        bodyMedium: TextStyle(),
        bodySmall: TextStyle(),
      ),
      //*
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsLight.backgroundColor,
        foregroundColor: ColorsLight.primaryColor,
      ),
      //*
      splashColor: ColorsLight.backgroundColor,
      //*
      iconTheme: const IconThemeData(
        color: ColorsLight.backgroundColor,
        size: 26,
      ),
      //! Appbar theme starts here
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsLight.backgroundColor,
        foregroundColor: ColorsLight.primaryColor,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'NotoKufiArabic',
          fontSize: 18,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
    );
