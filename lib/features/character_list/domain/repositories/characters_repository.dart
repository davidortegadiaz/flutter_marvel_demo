import 'package:flutter_marvel_demo/features/character_list/domain/models/character.dart';

abstract class CharactersRepository {
  Future<List<Character>> fetchCharacters();
}
