import 'dart:convert';

import 'package:flutter_marvel_demo/features/character_detail/domain/models/comic.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture_reader.dart';
import 'fake/comic.dart';

void main() {
  group(
    'Comic model test',
    () {
      test(
        'Comic.fromMap should return a valid model',
        () async {
          final Map<String, dynamic> jsonMap = json.decode(
            fixture(
              'features/character_detail/domain/models/comic/fixture/comic.json',
            ),
          ) as Map<String, dynamic>;

          final Comic result = Comic.fromMap(jsonMap);

          expect(result, tComic);
        },
      );
    },
  );
}
