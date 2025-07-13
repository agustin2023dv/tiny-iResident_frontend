// lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';
import 'app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Montserrat',
    primarySwatch: Colors.indigo,
    textTheme: AppStyles.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.elevatedButtonStyle,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Montserrat',
    primarySwatch: Colors.indigo,
    textTheme: AppStyles.darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.elevatedButtonStyle,
    ),
  );
}
