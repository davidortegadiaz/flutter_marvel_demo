import 'package:dio/dio.dart' as d;
import 'package:flutter_marvel_demo/debug/exception_logger.dart';
import 'package:flutter_marvel_demo/features/character_detail/infraestruture/dtos/comics_response_data.dart';
import 'package:flutter_marvel_demo/http/api_config/api_config.dart';
import 'package:flutter_marvel_demo/http/endpoints.dart';
import 'package:get/get.dart';

abstract class ComicsDataSource {
  Future<ComicsResponseData> fetchComics(int characterId);
}

class ApiComicsDataSource extends ComicsDataSource with ExceptionLogger {
  final d.Dio _dio;
  final ApiConfig _apiConfig;

  ApiComicsDataSource({
    d.Dio dio,
    ApiConfig apiConfig,
  })  : _dio = dio ?? Get.find<d.Dio>(),
        _apiConfig = apiConfig ?? Get.find<ApiConfig>();

  @override
  Future<ComicsResponseData> fetchComics(int characterId) async {
    final Map<String, Object> _queryParams = await _apiConfig.queryParams();
    final d.Response _response = await _dio.get(
      Endpoints.characters + '/$characterId' + Endpoints.comics,
      queryParameters: _queryParams,
    );
    if (_response.statusCode == 409) {
      throw exception(
        type: ExceptionType.badRequest,
        errorMessage: _response.statusMessage,
      );
    }
    return ComicsResponseData.fromMap(_response.data['data']);
  }
}
