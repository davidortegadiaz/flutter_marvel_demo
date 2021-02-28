import 'package:flutter_marvel_demo/debug/exception_logger.dart';
import 'package:flutter_marvel_demo/features/character_detail/domain/models/comic.dart';
import 'package:flutter_marvel_demo/features/character_detail/domain/repositories/comics_repository.dart';
import 'package:flutter_marvel_demo/features/character_detail/infraestruture/data_sources/api_comics_data_source.dart';
import 'package:flutter_marvel_demo/features/character_detail/infraestruture/dtos/comics_response_data.dart';
import 'package:get/get.dart';

class ApiComicsRepository extends ComicsRepository with ExceptionLogger {
  final ComicsDataSource _dataSource;

  ApiComicsRepository({
    ComicsDataSource dataSource,
  }) : _dataSource = dataSource ?? Get.find<ComicsDataSource>();

  @override
  Future<List<Comic>> fetchComics(int characterId) async {
    try {
      ComicsResponseData _data = await _dataSource.fetchComics(characterId);
      return _data.results;
    } catch (e) {
      throw exception(
        type: ExceptionType.exception,
        errorMessage: e.toString(),
      );
    }
  }
}
