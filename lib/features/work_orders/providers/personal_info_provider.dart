// lib/features/work_order/providers/personal_info_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/features/work_orders/models/personal_info_model.dart';
import 'package:tinyiresidentfrontend/features/work_orders/services/work_order_api_service.dart';

// Service provider (good for mocking/testing)
final workOrderApiServiceProvider = Provider<WorkOrderApiService>((ref) {
  return WorkOrderApiService();
});

// Personal Info provider using the service above
final personalInfoProvider = FutureProvider<PersonalInfo>((ref) async {
  final apiService = ref.read(workOrderApiServiceProvider);
  return await apiService.fetchPersonalInfo();
});
