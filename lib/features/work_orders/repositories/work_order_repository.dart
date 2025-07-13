// lib/features/work_order/repositories/work_order_repository.dart

import 'dart:io';
import '../services/work_order_api_service.dart';

class WorkOrderRepository {
  final WorkOrderApiService api;

  WorkOrderRepository(this.api);

  Future<void> submitWorkOrder({
    required String jobType,
    required String areaType,
    required String areaName,
    required String description,
    required bool permissionToEnter,
    File? imageFile,
  }) {
    return api.createWorkOrder(
      jobType: jobType,
      areaType: areaType,
      areaName: areaName,
      description: description,
      permissionToEnter: permissionToEnter,
      imageFile: imageFile,
    );
  }

  Future<List<dynamic>> fetchUserWorkOrders() async {
    final response = await api.getUserWorkOrders();
    return response.data;
  }
}
