import '../services/auth_api_service.dart';

class AuthRepository {
  final AuthApiService _apiService;

  AuthRepository(this._apiService);

  Future<void> login({
    required String username,
    required String password,
  }) async {
    await _apiService.login(username, password);
  }
}
