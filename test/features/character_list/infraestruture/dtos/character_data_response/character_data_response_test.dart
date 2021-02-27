import 'dart:convert';

import 'package:flutter_marvel_demo/features/character_list/infraestruture/dtos/characters_data_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture_reader.dart';
import 'fake/character_data_response.dart';

void main() {
  group(
    'CharacterDataResponse dto test',
    () {
      test(
        'CharacterDataResponse.fromMap should return a valid model',
        () async {
          final Map<String, dynamic> jsonMap = json.decode(
            fixture(
              'features/character_list/infraestruture/dtos/character_data_response/fixture/character_data_response.json',
            ),
          ) as Map<String, dynamic>;

          final CharacterDataResponse result = CharacterDataResponse.fromMap(jsonMap);

          expect(result, tCharacterDataResponse);
        },
      );
    },
  );
}
