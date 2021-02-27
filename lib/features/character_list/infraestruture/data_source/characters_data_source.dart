import 'package:dio/dio.dart' as d;
import 'package:flutter_marvel_demo/http/api_config/api_config.dart';
import 'package:flutter_marvel_demo/http/endpoints.dart';
import 'package:flutter_marvel_demo/debug/exception_logger.dart';
import 'package:get/get.dart';

abstract class CharactersDataSource {
  Future<void> fetchCharacters();
}

class ApiCharactersDataSource extends CharactersDataSource with ExceptionLogger {
  final d.Dio _client;
  final ApiConfig _apiConfig;

  ApiCharactersDataSource({
    d.Dio client,
    ApiConfig apiConfig,
  })  : _client = client ?? Get.find<d.Dio>(),
        _apiConfig = apiConfig ?? Get.find<ApiConfig>();

  @override
  Future<d.Response> fetchCharacters() async {
    try {
      final Map<String, Object> _queryParams = await _apiConfig.queryParams();

      final d.Response _response = await _client.get(
        Endpoints.characters,
        queryParameters: _queryParams,
      );
      if (_response.statusCode == 409) {
        throw exception(
          type: ExceptionType.badRequest,
          errorMessage: _response.statusMessage,
        );
      }
      var data = _response.data;
      var end = 'end';
    } catch (e) {
      throw exception(
        type: ExceptionType.noResponse,
        errorMessage: e.toString(),
      );
    }
  }
}
