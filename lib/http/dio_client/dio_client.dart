import 'package:dio/dio.dart';
import 'package:flutter_marvel_demo/http/api_config/api_config.dart';
import 'package:flutter_marvel_demo/http/endpoints.dart';

class DioClient {
  final Dio dio;
  final ApiConfig config;

  const DioClient({this.dio, this.config});

  static DioClient _instance;

  static DioClient getInstance() {
    final _options = BaseOptions();
    _options.baseUrl = Endpoints.baseUrl;
    _options.contentType = 'application/json';
    final _dio = Dio(_options);

    _instance ??= DioClient(dio: _dio);
    return _instance;
  }
}
