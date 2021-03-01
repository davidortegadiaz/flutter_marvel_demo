import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/bloc/characters_bloc.dart';
import 'package:flutter_marvel_demo/features/character_list/presentation/managers/search_bar_bloc.dart';
import 'package:flutter_marvel_demo/features/character_list/presentation/widgets/characters_list.dart';
import 'package:flutter_marvel_demo/features/character_list/presentation/widgets/fetch_characters_fab.dart';
import 'package:get/get.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _AppBarTitle(),
          actions: <Widget>[
            _AppBarSearchButton(),
          ],
        ),
        body: const CharactersList(),
        floatingActionButton: const FetchCharactersFAB());
  }
}

class _AppBarSearchButton extends StatelessWidget {
  const _AppBarSearchButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      tooltip: 'Filter',
      onPressed: () {
        Get.find<SearchBarBloc>().toggle();
      },
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBarBloc, bool>(
        cubit: Get.find<SearchBarBloc>(),
        builder: (context, search) {
          if (search) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter a search term',
                ),
                onChanged: (value) {
                  print(value);
                  Get.find<CharactersBloc>().add(
                    CharactersFilter(searchValue: value),
                  );
                },
              ),
            );
          } else {
            return Text(
              'MARVEL',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                letterSpacing: -5,
              ),
            );
          }
        });
  }
}
