import 'dart:convert';

import 'package:flutter_marvel_demo/features/character_list/domain/models/character.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture_reader.dart';
import 'fake/character.dart';

void main() {
  group(
    'Character model test',
    () {
      test(
        'Character.fromMap should return a valid model',
        () async {
          final Map<String, dynamic> jsonMap = json.decode(
            fixture(
              'features/character_list/domain/models/character/fixture/character.json',
            ),
          ) as Map<String, dynamic>;

          final Character result = Character.fromMap(jsonMap);

          expect(result, tCharacter);
        },
      );
    },
  );
}
