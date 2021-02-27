import 'package:flutter_marvel_demo/features/character_detail/infraestruture/dtos/comics_response_data.dart';

import '../../../../domain/models/comic/fake/comic.dart';

const ComicsResponseData tComicsResponseData = ComicsResponseData(
  offset: 0,
  limit: 20,
  total: 1,
  count: 1,
  results: [tComic],
);
