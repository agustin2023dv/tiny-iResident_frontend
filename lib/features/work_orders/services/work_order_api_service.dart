// lib/features/work_order/services/work_order_api_service.dart

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tinyiresidentfrontend/core/config/dio_client.dart';
import 'package:tinyiresidentfrontend/features/work_orders/models/personal_info_model.dart';

class WorkOrderApiService {
  Future<PersonalInfo> fetchPersonalInfo() async {
    final response = await dio.get('/work-orders/personal-info');
    return PersonalInfo.fromJson(response.data);
  }

  Future<Response> createWorkOrder({
    required String title,
    required String description,
    File? imageFile,
  }) async {
    final formData = FormData.fromMap({
      'title': title,
      'description': description,
      if (imageFile != null)
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
    });

    return dio.post('/work-orders/', data: formData);
  }

  Future<Response> getUserWorkOrders() async {
    return dio.get('/work-orders/my-orders');
  }
}
