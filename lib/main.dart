import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/tabs/quran_tab/details/sura_details_screen.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Islami App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.suraDetailsRouteName: (context) => SuraDetailsScreen(),
      },
      darkTheme: AppTheme.darkMode,
      themeMode: ThemeMode.dark,
    );
  }
}
