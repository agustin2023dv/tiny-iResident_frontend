// lib/core/navigation/navigation_service.dart

import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> to(String route, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(route, arguments: arguments);
  }

  static Future<dynamic> replace(String route, {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      route,
      arguments: arguments,
    );
  }

  static void back() {
    navigatorKey.currentState!.pop();
  }

  static Future<dynamic> toAndRemoveUntil(String route) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      route,
      (route) => false,
    );
  }
}
