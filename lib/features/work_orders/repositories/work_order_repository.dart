import 'dart:io';

import '../services/work_order_api_service.dart';

class WorkOrderRepository {
  final WorkOrderApiService api;

  WorkOrderRepository(this.api);

  Future<void> submitWorkOrder(
    String title,
    String description, [
    String? imagePath,
  ]) {
    return api.createWorkOrder(
      title: title,
      description: description,
      imageFile: imagePath != null ? File(imagePath) : null,
    );
  }

  Future<List<dynamic>> fetchUserWorkOrders() async {
    final response = await api.getUserWorkOrders();
    return response.data;
  }
}
