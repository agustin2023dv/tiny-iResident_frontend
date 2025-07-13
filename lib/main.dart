import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/core/theme/app_theme.dart';
import 'package:tinyiresidentfrontend/features/auth/screens/landing_screen.dart';
import 'package:tinyiresidentfrontend/features/auth/screens/login_screen.dart';
import 'package:tinyiresidentfrontend/features/auth/screens/register_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const LandingScreen(),

      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
