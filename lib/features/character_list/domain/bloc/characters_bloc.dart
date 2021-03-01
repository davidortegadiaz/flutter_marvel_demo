import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/models/character.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/repositories/characters_repository.dart';
import 'package:get/get.dart' as g;
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersRepository _repository;

  CharactersBloc({CharactersRepository repository})
      : _repository = repository ?? g.Get.find<CharactersRepository>(),
        super(const CharactersState());

  @override
  Stream<CharactersState> mapEventToState(
    CharactersEvent event,
  ) async* {
    if (event is CharactersFetch) {
      yield* _fetchToState();
    }

    if (event is CharactersFilter) {
      yield* _filterToState(event.searchValue);
    }
  }

  @override
  Stream<Transition<CharactersEvent, CharactersState>> transformEvents(
    Stream<CharactersEvent> events,
    TransitionFunction<CharactersEvent, CharactersState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 350)),
      transitionFn,
    );
  }

  Stream<CharactersState> _fetchToState() async* {
    if (!state.hasReachedMax) {
      yield state.copyWith(
        loading: true,
        error: false,
      );
      try {
        List<Character> _characters = await _repository.fetchCharacters(
          offSet: state.characters.length,
        );
        _characters = state.characters + _characters;
        yield state.copyWith(
          characters: _characters,
          showableCharacters: _characters,
          loading: false,
          hasReachedMax: _characters.isEmpty,
        );
      } catch (e) {
        yield* _errorToState();
      }
    }
  }

  Stream<CharactersState> _filterToState(String searchValue) async* {
    yield state.copyWith(
      showableCharacters: _filterCharacters(searchValue),
    );
  }

  Stream<CharactersState> _errorToState() async* {
    yield state.copyWith(
      loading: false,
      error: true,
    );
  }

  List<Character> _filterCharacters([String searchValue = '']) {
    List<Character> _showableCharacters = state.characters
        .where(
          (i) => i.name.toLowerCase().contains(searchValue),
        )
        .toList();
    return _showableCharacters;
  }
}
