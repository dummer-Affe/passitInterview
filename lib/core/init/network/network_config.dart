import 'package:dio/dio.dart';

class NetworkConfig {
  late String baseUrl;
  late String baseDummyUrl;
  late BaseOptions options;

  NetworkConfig() {
    baseUrl = 'https://rampant-underwear-production.up.railway.app';
    baseDummyUrl = 'https://dummyjson.com';
    options = BaseOptions(baseUrl: baseUrl);
  }
}
