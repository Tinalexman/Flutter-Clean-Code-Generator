String get networkConfigurations {
  return
"""
import 'package:dio/dio.dart';
export 'package:dio/dio.dart';

const String baseUrl = "";
const String accessToken = "";

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  ),
);
  """;
}