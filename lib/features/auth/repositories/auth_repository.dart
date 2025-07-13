import '../services/auth_api_service.dart';
import '../models/token_pair.dart';

class AuthRepository {
  final AuthApiService _apiService;

  AuthRepository(this._apiService);

  Future<TokenPair> login({
    required String username,
    required String password,
  }) async {
    final data = await _apiService.login(username, password);
    return TokenPair(access: data['access'], refresh: data['refresh']);
  }
}
