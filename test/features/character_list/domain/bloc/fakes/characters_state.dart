import 'package:flutter_marvel_demo/features/character_list/domain/bloc/characters_bloc.dart';

import '../../models/character/fake/character.dart';

const CharactersState tInitialCharactersState = CharactersState();
const CharactersState tLoadingCharactersState = CharactersState(
  loading: true,
);
const CharactersState tSuccessCharactersState = CharactersState(
  characters: [tCharacter],
  showableCharacters: [tCharacter],
  loading: false,
  error: false,
);

final CharactersState tCharactersFetchMoreLoadingState = tLoadingCharactersState.copyWith(
  characters: [tCharacter],
  showableCharacters: [tCharacter],
  loading: true,
);

final CharactersState tCharactersFetchMoreSuccessState = tSuccessCharactersState.copyWith(
  characters: [tCharacter, tCharacter2],
  showableCharacters: [tCharacter, tCharacter2],
  loading: false,
  error: false,
);

const CharactersState tErrorCharactersState = CharactersState(
  loading: false,
  error: true,
);

const CharactersState tBeforeFilterCharactersState = CharactersState(
  characters: [tCharacter, tCharacter2],
  showableCharacters: [tCharacter, tCharacter2],
);

const CharactersState tAfterFilterCharactersState = CharactersState(
  characters: [tCharacter, tCharacter2],
  showableCharacters: [tCharacter2],
);

const CharactersState tHasReachedMaxCharactersState = CharactersState(
  hasReachedMax: true,
  characters: [tCharacter, tCharacter2],
  showableCharacters: [tCharacter, tCharacter2],
);
