import 'package:flutter/material.dart';
import 'package:names_of_allah/app/logic/data_provider.dart';
import 'package:names_of_allah/core/storage/preferences.dart';
import 'package:names_of_allah/core/theme/theme_controller/theme_controller.dart';
import 'package:names_of_allah/core/theme/theme_data/light_theme_data.dart';
import 'app/view/screen/home_page.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme_data/dark_theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Preferences.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ThemeData myTheme = ThemeData();
    return ChangeNotifierProvider(
      create: (ctx) => ThemeController(),
      child: Consumer<ThemeController>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'أسماء الله الحُسنى',
          theme: getLightThemeData(),
          darkTheme: getDarkThemeData(),
          themeMode: Provider.of<ThemeController>(context).themeMode,
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
