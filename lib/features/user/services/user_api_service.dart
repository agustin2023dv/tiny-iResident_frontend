// lib/features/user/services/user_api_service.dart

import 'package:tinyiresidentfrontend/core/config/http_client.dart';
import 'package:tinyiresidentfrontend/features/user/models/user_model.dart';

class UserApiService {
  final DioClient _dioClient;

  UserApiService(this._dioClient);

  Future<UserModel> fetchCurrentUser() async {
    final response = await _dioClient.get('/me/', auth: true);
    return UserModel.fromJson(response.data);
  }
}
