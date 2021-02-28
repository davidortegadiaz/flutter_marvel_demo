import 'package:flutter_marvel_demo/features/character_detail/domain/bloc/comics_bloc.dart';

import '../../models/comic/fake/comic.dart';

const ComicsState tInitialComicsState = ComicsState();
const ComicsState tLoadingComicsState = ComicsState(
  loading: true,
);
const ComicsState tSuccessComicsState = ComicsState(
  comics: [tComic],
  loading: false,
  error: false,
);
const ComicsState tErrorComicsState = ComicsState(
  loading: false,
  error: true,
);
