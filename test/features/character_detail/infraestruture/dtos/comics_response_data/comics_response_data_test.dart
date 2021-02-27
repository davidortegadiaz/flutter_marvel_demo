import 'dart:convert';

import 'package:flutter_marvel_demo/features/character_detail/infraestruture/dtos/comics_response_data.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture_reader.dart';
import 'fake/comics_response_data.dart';

void main() {
  group(
    'ComicsResponseData dto test',
    () {
      test(
        'ComicsResponseData.fromMap should return a valid model',
        () async {
          final Map<String, dynamic> jsonMap = json.decode(
            fixture(
              'features/character_detail/infraestruture/dtos/comics_response_data/fixture/comics_response_data.json',
            ),
          ) as Map<String, dynamic>;

          final ComicsResponseData result = ComicsResponseData.fromMap(jsonMap);

          expect(result, tComicsResponseData);
        },
      );
    },
  );
}
