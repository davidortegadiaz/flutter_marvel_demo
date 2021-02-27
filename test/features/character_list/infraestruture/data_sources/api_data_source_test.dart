import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_marvel_demo/features/character_list/infraestruture/data_sources/characters_data_source.dart';
import 'package:flutter_marvel_demo/http/api_config/api_config.dart';
import 'package:flutter_marvel_demo/http/custom_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture_reader.dart';
import '../dtos/character_data_response/fake/character_reponse_data.dart';

class MockDio extends Mock implements Dio {}

class MockApiConfig extends Mock implements ApiConfig {}

void main() {
  CharactersDataSource _dataSource;
  Dio _mockDio;
  ApiConfig _mockApiConfig;

  setUp(() {
    _mockDio = MockDio();
    _mockApiConfig = MockApiConfig();
    _dataSource = ApiCharactersDataSource(
      dio: _mockDio,
      apiConfig: _mockApiConfig,
    );
  });

  test(
    'fetchCharacters should return an tCharactersResponseData when response statusCode is 200',
    () async {
      when(
        _mockDio.get(
          any,
          queryParameters: anyNamed('queryParameters'),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: jsonDecode(
            fixture('features/character_list/infraestruture/data_sources/fixture/fetch_characters_response.json'),
          ),
          statusCode: 200,
        ),
      );

      final _result = await _dataSource.fetchCharacters();
      expect(_result, tCharactersResponseData);
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
      final _result = _dataSource.fetchCharacters;
      expect(
        _result.call(),
        throwsA(
          predicate((e) => e is BadRequestException),
        ),
      );
    },
  );
}
