import 'package:flutter_marvel_demo/features/character_detail/domain/models/comic.dart';

abstract class ComicsRepository {
  Future<List<Comic>> fetchComics(int characterId);
}
