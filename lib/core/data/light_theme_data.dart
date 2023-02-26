import 'package:flutter/material.dart';
import 'package:names_of_allah/core/colors/light_theme_colors.dart';


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
        titleLarge: TextStyle(
          color: ColorsLight.textColorTitleLarge,
        ),
        titleMedium: TextStyle(
          color: ColorsLight.textColorTitleMedium,
        ),
        titleSmall: TextStyle(
          color: ColorsLight.textColorTitleSmall,
        ),
        bodyLarge: TextStyle(
          color: ColorsLight.textColorBodyLarge,
        ),
        bodyMedium: TextStyle(
          color: ColorsLight.textColorBodyMedium,
          fontSize: 18,
        ),
        bodySmall: TextStyle(
          color: ColorsLight.textColorBodySmall,
        ),
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
        color: ColorsLight.primaryColor,
        size: 26,
      ),
      //! Appbar theme starts here
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsLight.primaryColor,
        foregroundColor: ColorsLight.backgroundColor,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'NotoKufiArabic',
          fontSize: 18,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),

      //! show dialog
      dialogTheme: const DialogTheme(
        backgroundColor: ColorsLight.backgroundColor,
        contentTextStyle: TextStyle(
          color: ColorsLight.primaryColor,
          fontSize: 18,
        ),
      ),
    );
