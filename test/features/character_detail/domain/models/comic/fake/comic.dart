import 'package:flutter_marvel_demo/features/character_detail/domain/models/comic.dart';

import '../../../../../../shared/models/thumbnail/fake/thumbnail.dart';
import '../../../../../../shared/models/url/fake/url.dart';

const Comic tComic = Comic(
  id: 0,
  title: 'title',
  variantDescription: 'variant description',
  description: 'description',
  format: 'format',
  pageCount: 0,
  urls: [tUrl],
  thumbnail: tThumbnail,
);
