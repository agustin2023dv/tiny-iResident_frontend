import 'package:dio/dio.dart';

final Dio dioInstance = Dio(
  BaseOptions(
    baseUrl: 'http://10.0.2.2:8000/api',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Content-Type': 'application/json'},
  ),
);
