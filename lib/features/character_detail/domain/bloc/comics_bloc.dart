import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_marvel_demo/features/character_detail/domain/models/comic.dart';
import 'package:flutter_marvel_demo/features/character_detail/domain/repositories/comics_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'comics_event.dart';

part 'comics_state.dart';

class ComicsBloc extends Bloc<ComicsEvent, ComicsState> {
  final ComicsRepository _repository;

  ComicsBloc({ComicsRepository repository})
      : _repository = repository ?? Get.find<ComicsRepository>(),
        super(const ComicsState());

  @override
  Stream<ComicsState> mapEventToState(
    ComicsEvent event,
  ) async* {
    if (event is ComicsFetch) {
      yield* _fetchToState(event.characterId);
    }
  }

  Stream<ComicsState> _fetchToState(int characterId) async* {
    yield state.copyWith(
      loading: true,
      error: false,
    );
    try {
      final List<Comic> _comics = await _repository.fetchComics(characterId);
      yield state.copyWith(
        comics: _comics,
        loading: false,
      );
    } catch (e) {
      yield* _errorToState();
    }
  }

  Stream<ComicsState> _errorToState() async* {
    yield state.copyWith(
      loading: false,
      error: true,
    );
  }
}
