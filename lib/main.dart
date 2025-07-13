// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/core/theme/app_theme.dart';
import 'package:tinyiresidentfrontend/core/navigation/app_routes.dart';
import 'package:tinyiresidentfrontend/core/navigation/navigation_service.dart';

// Auth Screens
import 'package:tinyiresidentfrontend/features/auth/screens/landing_screen.dart';
import 'package:tinyiresidentfrontend/features/auth/screens/login_screen.dart';
import 'package:tinyiresidentfrontend/features/auth/screens/register_screen.dart';

// Work Order Screens
import 'package:tinyiresidentfrontend/features/work_orders/screens/personal_information_step.dart';
import 'package:tinyiresidentfrontend/features/work_orders/screens/work_order_details_step.dart';
import 'package:tinyiresidentfrontend/features/work_orders/screens/work_order_summary_step.dart';
import 'package:tinyiresidentfrontend/features/work_orders/screens/work_order_success_screen.dart';

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
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.home: (context) => const LandingScreen(),

        AppRoutes.workOrderSummary: (context) => const WorkOrderSummaryStep(),
        AppRoutes.workOrderDetails: (context) => const WorkOrderDetailsStep(),
        AppRoutes.workOrderSuccess: (context) => const WorkOrderSuccessScreen(),
        AppRoutes.personalInfoOrderStep: (context) =>
            const PersonalInformationStep(),
      },
    );
  }
}
