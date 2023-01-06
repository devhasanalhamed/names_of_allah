import 'package:flutter/material.dart';
import 'package:names_of_allah/app/providers/namesProvider.dart';
import 'package:names_of_allah/core/colors/theme_constants.dart';
import 'package:names_of_allah/core/controllers/theme_manager.dart';
import 'package:names_of_allah/core/data/light_theme_data.dart';
import 'app/view/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ThemeData myTheme = ThemeData();
    return ChangeNotifierProvider(
      create: (ctx) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (context, theme, child) => MaterialApp(
          title: 'أسماء الله الحُسنى',
          theme: getLightThemeData(),
          darkTheme: darkTheme,
          themeMode: Provider.of<ThemeManager>(context).themeMode,
          home: ChangeNotifierProvider(
            create: (ctx) => DataProvider(),
            child: const Directionality(
              textDirection: TextDirection.rtl,
              child: HomePage(),
            ),
          ),
        ),
      ),
    );
  }
}
