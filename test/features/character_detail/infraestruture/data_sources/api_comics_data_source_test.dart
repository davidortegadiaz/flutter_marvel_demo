import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_marvel_demo/features/character_detail/infraestruture/data_sources/api_comics_data_source.dart';
import 'package:flutter_marvel_demo/http/api_config/api_config.dart';
import 'package:flutter_marvel_demo/http/custom_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture_reader.dart';
import '../dtos/comics_response_data/fake/comics_response_data.dart';

class MockDio extends Mock implements Dio {}

class MockApiConfig extends Mock implements ApiConfig {}

void main() {
  ComicsDataSource _dataSource;
  Dio _mockDio;
  ApiConfig _mockApiConfig;

  setUp(() {
    _mockDio = MockDio();
    _mockApiConfig = MockApiConfig();
    _dataSource = ApiComicsDataSource(
      dio: _mockDio,
      apiConfig: _mockApiConfig,
    );
  });

  test(
    'fetchCharacters should return an tComicsResponseData when response statusCode is 200',
    () async {
      when(
        _mockDio.get(
          any,
          queryParameters: anyNamed('queryParameters'),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: jsonDecode(
            fixture('features/character_detail/infraestruture/data_sources/fixture/fetch_comics_response.json'),
          ),
          statusCode: 200,
        ),
      );

      final _result = await _dataSource.fetchComics(0);
      expect(_result, tComicsResponseData);
    },
  );

  test(
    'fetchCharacters should throw BadRequestException when response statusCode is 409',
    () async {
      when(
        _mockDio.get(
          any,
          queryParameters: anyNamed('queryParameters'),
        ),
      ).thenAnswer(
        (_) async => Response(
          statusCode: 409,
          statusMessage: 'error',
        ),
      );
      final _result = _dataSource.fetchComics;
      expect(
        _result.call(0),
        throwsA(
          predicate((e) => e is BadRequestException),
        ),
      );
    },
  );
}
