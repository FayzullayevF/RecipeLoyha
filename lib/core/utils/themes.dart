import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final darkThemes = ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.nameColor,
        onPrimary: Colors.white,
        secondary: AppColors.actionContainerColor,
        onSecondary: AppColors.pinkSubColor,
        error: Colors.red,
        onError: Colors.white,
        surface: AppColors.mainBackgroundColor,
        onSurface: AppColors.nameColor,
      ),
      fontFamily: "Poppins",
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
      ));
}
