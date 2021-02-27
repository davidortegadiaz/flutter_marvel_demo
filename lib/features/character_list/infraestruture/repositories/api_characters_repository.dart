import 'package:flutter_marvel_demo/debug/exception_logger.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/models/character.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/repositories/characters_repository.dart';
import 'package:flutter_marvel_demo/features/character_list/infraestruture/data_sources/api_characters_data_source.dart';
import 'package:flutter_marvel_demo/features/character_list/infraestruture/dtos/characters_response_data.dart';
import 'package:get/get.dart';

class ApiCharactersRepository extends CharactersRepository with ExceptionLogger {
  final CharactersDataSource _dataSource;

  ApiCharactersRepository({
    CharactersDataSource dataSource,
  }) : _dataSource = dataSource ?? Get.find<CharactersDataSource>();

  @override
  Future<List<Character>> fetchCharacters() async {
    try {
      CharacterResponseData _data = await _dataSource.fetchCharacters();
      return _data.results;
    } catch (e) {
      throw exception(
        type: ExceptionType.exception,
        errorMessage: e.toString(),
      );
    }
  }
}
