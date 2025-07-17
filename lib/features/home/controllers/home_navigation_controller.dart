// lib/features/home/controllers/home_navigation_controller.dart

import 'package:flutter/material.dart';
import 'package:tinyiresidentfrontend/core/navigation/app_routes.dart';

class HomeNavigationController {
  void goToWorkOrder(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.personalInfoOrderStep);
  }

  void goToRecertification(BuildContext context) {
    Navigator.pushNamed(context, '/recertification');
  }

  void goToInspection(BuildContext context) {
    Navigator.pushNamed(context, '/inspection');
  }

  void goToPackageDelivery(BuildContext context) {
    Navigator.pushNamed(context, '/package-delivery');
  }
}
