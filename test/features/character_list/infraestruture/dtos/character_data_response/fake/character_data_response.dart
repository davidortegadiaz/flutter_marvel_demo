import 'package:flutter_marvel_demo/features/character_list/infraestruture/dtos/characters_data_response.dart';

import '../../../../domain/models/character/fake/character.dart';

const CharacterDataResponse tCharacterDataResponse = CharacterDataResponse(
  offset: 0,
  limit: 20,
  total: 1,
  count: 1,
  results: [tCharacter],
);
