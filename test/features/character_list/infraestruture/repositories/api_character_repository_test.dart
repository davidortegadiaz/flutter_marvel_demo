import 'package:flutter_marvel_demo/features/character_list/domain/repositories/characters_repository.dart';
import 'package:flutter_marvel_demo/features/character_list/infraestruture/data_sources/api_characters_data_source.dart';
import 'package:flutter_marvel_demo/features/character_list/infraestruture/repositories/api_characters_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../dtos/character_data_response/fake/character_reponse_data.dart';

class MockCharactersDataSource extends Mock implements CharactersDataSource {}

void main() {
  CharactersRepository _repository;
  CharactersDataSource _mockCharactersDataSource;

  setUp(() {
    _mockCharactersDataSource = MockCharactersDataSource();
    _repository = ApiCharactersRepository(dataSource: _mockCharactersDataSource);
  });

  test(
    'fetchComicss should return an character list when dataSource returns a CharacterResponseData',
    () async {
      when(
        _mockCharactersDataSource.fetchCharacters(),
      ).thenAnswer((_) async => tCharactersResponseData);

      final _result = await _repository.fetchCharacters();

      expect(_result, tCharactersResponseData.results);
      verify(_mockCharactersDataSource.fetchCharacters()).called(1);
      verifyNoMoreInteractions(_mockCharactersDataSource);
    },
  );

  test(
    'fetchCharacters should throw BadRequestException when dataSource throws Exception',
    () async {
      when(
        _mockCharactersDataSource.fetchCharacters(),
      ).thenThrow((_) async => Exception());

      final _result = _repository.fetchCharacters;

      expect(
        _result.call(),
        throwsA(
          predicate((e) => e is Exception),
        ),
      );
    },
  );
}
