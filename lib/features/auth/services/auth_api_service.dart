import 'package:tinyiresidentfrontend/core/config/http_client.dart';
import 'package:tinyiresidentfrontend/core/utils/secure_storage.dart';

class AuthApiService {
  final DioClient _dioClient;

  AuthApiService(this._dioClient);

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await _dioClient.post(
        '/auth/token/',
        auth: false,
        data: {'username': username, 'password': password},
      );

      final access = response.data['access'];
      final refresh = response.data['refresh'];

      await SecureStorage().saveTokens(
        accessToken: access,
        refreshToken: refresh,
      );

      return response.data;
    } catch (e) {
      throw Exception('Login failed');
    }
  }
}
