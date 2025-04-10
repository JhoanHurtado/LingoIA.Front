import 'package:flutter/material.dart';
import 'package:lingoia/core/theme/app_colors.dart';
import 'package:lingoia/core/theme/app_fonts.dart';

final ThemeData lingoIATheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  fontFamily: AppFonts.primaryFont,
  textTheme: TextTheme(
    headlineLarge: AppTextStyles.headline1,
    headlineMedium: AppTextStyles.headline2,
    bodyLarge: AppTextStyles.bodyText1,
    bodyMedium: AppTextStyles.bodyText2,
    labelLarge: AppTextStyles.button,
    bodySmall: AppTextStyles.caption,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.accent, // Azul eléctrico para destacar botones
    textTheme: ButtonTextTheme.primary,
  ),
);
