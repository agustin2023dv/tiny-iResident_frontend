import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/core/utils/secure_storage.dart';
import 'package:tinyiresidentfrontend/core/config/dio_client.dart';
import 'package:tinyiresidentfrontend/core/config/http_client.dart';

final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage();
});

final dioClientProvider = Provider<DioClient>((ref) {
  final storage = ref.read(secureStorageProvider);
  return DioClient(dio: dioInstance, secureStorage: storage);
});
