import 'dart:convert';

import 'package:flutter_marvel_demo/features/character_list/infraestruture/dtos/characters_response_data.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture_reader.dart';
import 'fake/character_reponse_data.dart';

void main() {
  group(
    'CharacterResponseData dto test',
    () {
      test(
        'CharacterResponseData.fromMap should return a valid model',
        () async {
          final Map<String, dynamic> jsonMap = json.decode(
            fixture(
              'features/character_list/infraestruture/dtos/character_data_response/fixture/character_data_response.json',
            ),
          ) as Map<String, dynamic>;

          final CharacterResponseData result = CharacterResponseData.fromMap(jsonMap);

          expect(result, tCharactersResponseData);
        },
      );
    },
  );
}
