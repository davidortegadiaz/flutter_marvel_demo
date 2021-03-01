import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/bloc/characters_bloc.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/models/character.dart';
import 'package:get/get.dart';

import 'character_list_item.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({
    Key key,
  }) : super(key: key);

  @override
  _CharactersListState createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) Get.find<CharactersBloc>().add(CharactersFetch());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

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
        final List<Character> _characters = state.characters;
        if (_characters.isEmpty) {
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
          controller: _scrollController,
          padding: const EdgeInsets.all(8),
          itemCount: _characters.length,
          itemBuilder: (BuildContext context, int index) {
            final Character _character = _characters[index];
            return CharacterListItem(
              key: Key('character.list.item.${_character.id}'),
              character: _character,
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
