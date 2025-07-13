import 'package:dio/dio.dart';

class AuthApiService {
  final Dio _dio;

  AuthApiService(this._dio);

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '/auth/token/',
        data: {'username': username, 'password': password},
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data['detail'] ?? 'Login failed');
    }
  }
}
