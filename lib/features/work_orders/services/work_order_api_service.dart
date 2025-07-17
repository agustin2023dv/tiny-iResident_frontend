// lib/features/work_order/services/work_order_api_service.dart

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tinyiresidentfrontend/core/config/dio_client.dart';
import 'package:tinyiresidentfrontend/features/work_orders/models/personal_info_model.dart';
import 'package:tinyiresidentfrontend/core/utils/secure_storage.dart';

class WorkOrderApiService {
  final SecureStorage _secureStorage = SecureStorage();

  Future<Options> _authHeaders() async {
    final token = await _secureStorage.getAccessToken();
    return Options(
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<PersonalInfo> fetchPersonalInfo() async {
    try {
      final response = await dioInstance.get(
        '/work-orders/personal-info',
        options: await _authHeaders(),
      );
      return PersonalInfo.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch personal info: ${e.message}');
    }
  }

  Future<Response> createWorkOrder({
    required String areaType,
    required String areaName,
    required String jobType,
    required String description,
    required bool permissionToEnter,
    File? imageFile,
  }) async {
    try {
      final formData = FormData.fromMap({
        'area_type': areaType,
        'area_name': areaName,
        'job_type': jobType,
        'description': description,
        'permission_to_enter': permissionToEnter,
        if (imageFile != null)
          'image': await MultipartFile.fromFile(
            imageFile.path,
            filename: imageFile.path.split('/').last,
          ),
      });

      final token = await _secureStorage.getAccessToken();

      return await dioInstance.post(
        '/work-orders/',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
    } on DioException catch (e) {
      throw Exception('Failed to submit work order: ${e.message}');
    }
  }

  Future<Response> getUserWorkOrders() async {
    try {
      return await dioInstance.get(
        '/work-orders/my-orders',
        options: await _authHeaders(),
      );
    } on DioException catch (e) {
      throw Exception('Failed to load work orders: ${e.message}');
    }
  }
}
