import 'package:flutter_marvel_demo/features/character_list/domain/bloc/characters_bloc.dart';

import '../../models/character/fake/character.dart';

const CharactersState tInitialCharactersState = CharactersState();
const CharactersState tLoadingCharactersState = CharactersState(
  loading: true,
);
const CharactersState tSuccessCharactersState = CharactersState(
  characters: [tCharacter],
  loading: false,
  error: false,
);
const CharactersState tErrorCharactersState = CharactersState(
  loading: false,
  error: true,
);
