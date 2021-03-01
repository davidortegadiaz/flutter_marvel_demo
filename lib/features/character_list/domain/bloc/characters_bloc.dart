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
    yield state.copyWith(
      loading: true,
      error: false,
    );
    if (!state.hasReachedMax) {
      try {
        final List<Character> _characters = await _repository.fetchCharacters(
          offSet: state.characters.length,
        );
        yield state.copyWith(
          characters: state.characters + _characters,
          loading: false,
          hasReachedMax: _characters.isEmpty,
        );
      } catch (e) {
        yield* _errorToState();
      }
    }
  }

  Stream<CharactersState> _errorToState() async* {
    yield state.copyWith(
      loading: false,
      error: true,
    );
  }
}
