import 'package:flutter/material.dart';
import 'package:lingoia/core/theme/app_colors.dart';

class AppFonts {
  // Fuente principal (moderna y legible)
  static const String primaryFont = 'Roboto';

  // Fuente secundaria (elegante y versátil)
  static const String secondaryFont = 'Lato';
}

class AppTextStyles {
  // Títulos grandes y destacados
  static const TextStyle headline1 = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primary, // Texto principal
  );

  // Subtítulos y encabezados secundarios
  static const TextStyle headline2 = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primary, // Texto principal
  );

  // Texto de cuerpo principal
  static const TextStyle bodyText1 = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.primary, // Texto principal
  );

  // Texto de cuerpo secundario (descripciones, información menos relevante)
  static const TextStyle bodyText2 = TextStyle(
    fontFamily: AppFonts.secondaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary, // Texto secundario
  );
  // Texto de cuerpo secundario (descripciones, información menos relevante)
  static const TextStyle bodyText3 = TextStyle(
    fontFamily: AppFonts.secondaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary, // Texto secundario
  );

  // Texto en botones
  static const TextStyle button = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white, // Blanco para contraste en botones oscuros
  );

  // Texto en placeholders y notas informativas
  static const TextStyle caption = TextStyle(
    fontFamily: AppFonts.secondaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColors.secondary, // Gris medio
  );
}
