import 'package:flutter_marvel_demo/features/character_list/infraestruture/dtos/characters_response_data.dart';

import '../../../../domain/models/character/fake/character.dart';

const CharacterResponseData tCharactersResponseData = CharacterResponseData(
  offset: 0,
  limit: 20,
  total: 1,
  count: 1,
  results: [tCharacter],
);
