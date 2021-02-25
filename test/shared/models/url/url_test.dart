import 'dart:convert';

import 'package:flutter_marvel_demo/shared/models/url.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixture_reader.dart';
import 'fake/url.dart';

void main() {
  group(
    'Url model test',
    () {
      test(
        'Url.fromMap should return a valid model',
        () async {
          final Map<String, dynamic> jsonMap = json.decode(
            fixture(
              'shared/models/url/fixture/url.json',
            ),
          ) as Map<String, dynamic>;

          final Url result = Url.fromMap(jsonMap);

          expect(result, tUrl);
        },
      );
    },
  );
}
