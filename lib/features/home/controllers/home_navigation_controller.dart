import 'package:flutter/material.dart';

class HomeNavigationController {
  void goToWorkOrder(BuildContext context) {
    Navigator.pushNamed(context, '/work-order');
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
