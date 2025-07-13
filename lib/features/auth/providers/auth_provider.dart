import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/core/config/dio_client.dart';
import 'package:tinyiresidentfrontend/core/utils/secure_storage.dart';
import 'package:tinyiresidentfrontend/features/auth/models/auth_state.dart';
import 'package:tinyiresidentfrontend/features/auth/services/auth_api_service.dart';
import 'package:tinyiresidentfrontend/features/auth/repositories/auth_repository.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(AuthRepository(AuthApiService(dio))),
);

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthState.initial());

  Future<void> login(String username, String password) async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      final tokens = await _authRepository.login(
        username: username,
        password: password,
      );

      await SecureStorage().saveTokens(
        accessToken: tokens.access,
        refreshToken: tokens.refresh,
      );

      state = state.copyWith(status: AuthStatus.authenticated);
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}
