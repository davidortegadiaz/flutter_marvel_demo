import 'package:dio/dio.dart' as d;
import 'package:flutter_marvel_demo/features/character_list/infraestruture/dtos/characters_response_data.dart';
import 'package:flutter_marvel_demo/http/api_config/api_config.dart';
import 'package:flutter_marvel_demo/http/endpoints.dart';
import 'package:flutter_marvel_demo/debug/exception_logger.dart';
import 'package:get/get.dart';

abstract class CharactersDataSource {
  Future<CharacterResponseData> fetchCharacters();
}

class ApiCharactersDataSource extends CharactersDataSource with ExceptionLogger {
  final d.Dio _dio;
  final ApiConfig _apiConfig;

  ApiCharactersDataSource({
    d.Dio dio,
    ApiConfig apiConfig,
  })  : _dio = dio ?? Get.find<d.Dio>(),
        _apiConfig = apiConfig ?? Get.find<ApiConfig>();

  @override
  Future<CharacterResponseData> fetchCharacters() async {
    final Map<String, Object> _queryParams = await _apiConfig.queryParams();
    final d.Response _response = await _dio.get(
      Endpoints.characters,
      queryParameters: _queryParams,
    );
    if (_response.statusCode == 409) {
      throw exception(
        type: ExceptionType.badRequest,
        errorMessage: _response.statusMessage,
      );
    }
    return CharacterResponseData.fromMap(_response.data['data']);
  }
}
