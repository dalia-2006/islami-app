import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData darkMode = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      selectedIconTheme: IconThemeData(color: AppColors.whiteColor),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
    ),
  );
}
