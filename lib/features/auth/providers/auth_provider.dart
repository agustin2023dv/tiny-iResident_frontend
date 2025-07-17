// lib/features/auth/providers/auth_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/core/config/http_client.dart'; // contiene el Dio base
import 'package:tinyiresidentfrontend/core/config/dio_client.dart';
import 'package:tinyiresidentfrontend/core/utils/secure_storage.dart';
import 'package:tinyiresidentfrontend/features/auth/models/auth_state.dart';
import 'package:tinyiresidentfrontend/features/auth/services/auth_api_service.dart';
import 'package:tinyiresidentfrontend/features/auth/repositories/auth_repository.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final secureStorage = SecureStorage();
  final dioClient = DioClient(dio: dioInstance, secureStorage: secureStorage);
  final apiService = AuthApiService(dioClient);
  final repository = AuthRepository(apiService);

  return AuthNotifier(repository);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthState.initial());

  Future<void> login(String username, String password) async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      await _authRepository.login(username: username, password: password);
      state = state.copyWith(status: AuthStatus.authenticated);
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}
