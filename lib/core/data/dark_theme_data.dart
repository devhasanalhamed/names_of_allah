import 'package:flutter/material.dart';
import '../colors/dark_theme_colors.dart';

ThemeData getDarkThemeData() => ThemeData(
      primaryColor: ColorsDark.primaryColor,
      backgroundColor: ColorsDark.backgroundColor,
      //*
      fontFamily: 'NotoKufiArabic',
      //! Colorscheme theme start here
      colorScheme: const ColorScheme.light(
        primary: ColorsDark.primaryColor,
        secondary: ColorsDark.secondaryColor,
        background: ColorsDark.backgroundColor,
      ),
      //! texttheme section
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: ColorsDark.textColorTitleLarge,
        ),
        titleMedium: TextStyle(
          color: ColorsDark.textColorTitleMedium,
        ),
        titleSmall: TextStyle(
          color: ColorsDark.textColorTitleSmall,
        ),
        bodyLarge: TextStyle(
          color: ColorsDark.textColorBodyLarge,
        ),
        bodyMedium: TextStyle(
          color: ColorsDark.textColorBodyMedium,
          fontSize: 18,
        ),
        bodySmall: TextStyle(
          color: ColorsDark.textColorBodySmall,
        ),
      ),
      //*
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsDark.backgroundColor,
        foregroundColor: ColorsDark.primaryColor,
      ),
      //*
      splashColor: ColorsDark.backgroundColor,
      //*
      iconTheme: const IconThemeData(
        color: ColorsDark.primaryColor,
        size: 26,
      ),
      //! Appbar theme starts here
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsDark.backgroundColor,
        foregroundColor: ColorsDark.primaryColor,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'NotoKufiArabic',
          fontSize: 18,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
    );
