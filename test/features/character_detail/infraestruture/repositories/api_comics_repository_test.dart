import 'package:flutter_marvel_demo/features/character_detail/domain/repositories/comics_repository.dart';
import 'package:flutter_marvel_demo/features/character_detail/infraestruture/data_sources/api_comics_data_source.dart';
import 'package:flutter_marvel_demo/features/character_detail/infraestruture/repositories/api_comics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../dtos/comics_response_data/fake/comics_response_data.dart';

class MockComicsDataSource extends Mock implements ComicsDataSource {}

void main() {
  ComicsRepository _repository;
  ComicsDataSource _mockComicsDataSource;

  setUp(() {
    _mockComicsDataSource = MockComicsDataSource();
    _repository = ApiComicsRepository(dataSource: _mockComicsDataSource);
  });

  test(
    'fetchComics should return an comic list when dataSource returns a ComicsResponseData',
    () async {
      when(
        _mockComicsDataSource.fetchComics(any),
      ).thenAnswer((_) async => tComicsResponseData);

      final _result = await _repository.fetchComics(0);

      expect(_result, tComicsResponseData.results);
      verify(_mockComicsDataSource.fetchComics(any)).called(1);
      verifyNoMoreInteractions(_mockComicsDataSource);
    },
  );

  test(
    'fetchComics should throw BadRequestException when dataSource throws Exception',
    () async {
      when(
        _mockComicsDataSource.fetchComics(any),
      ).thenThrow((_) async => Exception());

      final _result = _repository.fetchComics;

      expect(
        _result.call(0),
        throwsA(
          predicate((e) => e is Exception),
        ),
      );
    },
  );
}
