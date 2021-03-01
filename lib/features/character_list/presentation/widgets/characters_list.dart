import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/bloc/characters_bloc.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/models/character.dart';
import 'package:get/get.dart';

import 'character_list_item.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      cubit: Get.find<CharactersBloc>(),
      builder: (context, state) {
        if (state.error) {
          return Center(
            key: Key('character.list.error'),
            child: Text(
              'Ops! sorry, something went wrong...',
              key: Key('character.list.error.message'),
            ),
          );
        }
        final List<Character> _results = state.characters;
        if (_results.isEmpty) {
          return Center(
            key: Key('character.list.empty'),
            child: Center(
              child: Text(
                'Press the button to fetch characters!!',
                key: Key('character.list.empty.message'),
              ),
            ),
          );
        }
        return ListView.builder(
          key: Key('character.list'),
          padding: const EdgeInsets.all(8),
          itemCount: _results.length,
          itemBuilder: (BuildContext context, int index) {
            final Character _character = _results[index];
            return CharacterListItem(
              key: Key('character.list.item.${_character.id}'),
              character: _character,
            );
          },
        );
      },
    );
  }
}
