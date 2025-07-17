import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/core/config/providers.dart';
import 'package:tinyiresidentfrontend/features/user/models/user_model.dart';
import 'package:tinyiresidentfrontend/features/user/services/user_api_service.dart';

final userProvider = FutureProvider<UserModel>((ref) async {
  final dioClient = ref.read(dioClientProvider);
  final api = UserApiService(dioClient);
  return await api.fetchCurrentUser();
});
