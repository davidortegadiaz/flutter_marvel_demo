import 'dart:convert';

import 'package:flutter_marvel_demo/shared/models/thumbnail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixture_reader.dart';
import 'fake/thumbnail.dart';

void main() {
  group(
    'Thumbnail model test',
    () {
      test(
        'Thumbnail.fromMap should return a valid model',
        () async {
          final Map<String, dynamic> jsonMap = json.decode(
            fixture(
              'shared/models/thumbnail/fixture/thumbnail.json',
            ),
          ) as Map<String, dynamic>;

          final Thumbnail result = Thumbnail.fromMap(jsonMap);

          expect(result, tThumbnail);
        },
      );
    },
  );
}
