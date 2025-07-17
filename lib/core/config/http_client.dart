import 'package:dio/dio.dart';
import '../utils/secure_storage.dart';

class DioClient {
  final Dio _dio;
  final SecureStorage _secureStorage;

  DioClient({required Dio dio, required SecureStorage secureStorage})
    : _dio = dio,
      _secureStorage = secureStorage;

  Future<Response> get(
    String endpoint, {
    bool auth = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    final headers = await _buildHeaders(auth: auth);

    return _dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  Future<Response> post(
    String endpoint, {
    bool auth = false,
    Map<String, dynamic>? data,
  }) async {
    final headers = await _buildHeaders(auth: auth);

    return _dio.post(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Map<String, String>> _buildHeaders({bool auth = false}) async {
    final headers = <String, String>{'Content-Type': 'application/json'};

    if (auth) {
      final token = await _secureStorage.getAccessToken();

      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }
}
