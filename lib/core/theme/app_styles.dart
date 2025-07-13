// lib/core/theme/app_styles.dart

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static TextTheme get lightTextTheme => const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textSecondary),
    bodyMedium: TextStyle(color: AppColors.textPrimary),
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
  );

  static TextTheme get darkTextTheme => const TextTheme(
    bodyLarge: TextStyle(color: AppColors.darkTextSecondary),
    bodyMedium: TextStyle(color: AppColors.darkTextPrimary),
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.darkTextPrimary,
    ),
  );

  static ButtonStyle get elevatedButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: AppColors.background,
    foregroundColor: AppColors.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );
}
