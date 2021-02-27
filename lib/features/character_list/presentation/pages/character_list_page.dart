import 'package:flutter/material.dart';
import 'package:flutter_marvel_demo/features/character_list/presentation/widgets/characters_list.dart';
import 'package:flutter_marvel_demo/features/character_list/presentation/widgets/fetch_characters_fab.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'MARVEL',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              letterSpacing: -5,
            ),
          ),
        ),
        body: const CharactersList(),
        floatingActionButton: const FetchCharactersFAB());
  }
}
