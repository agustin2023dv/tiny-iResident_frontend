// lib/core/theme/app_styles.dart

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static TextTheme get lightTextTheme => TextTheme(
    bodyLarge: const TextStyle(color: AppColors.textSecondary),
    bodyMedium: const TextStyle(color: AppColors.textPrimary),
    titleLarge: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
  );

  static TextTheme get darkTextTheme => TextTheme(
    bodyLarge: const TextStyle(color: AppColors.darkTextSecondary),
    bodyMedium: const TextStyle(color: AppColors.darkTextPrimary),
    titleLarge: const TextStyle(
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
