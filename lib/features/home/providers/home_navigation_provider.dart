import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/home_navigation_controller.dart';

final homeNavigationProvider = Provider<HomeNavigationController>((ref) {
  return HomeNavigationController();
});
