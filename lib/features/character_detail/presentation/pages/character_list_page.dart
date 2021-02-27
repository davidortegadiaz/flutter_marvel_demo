import 'package:flutter/material.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/bloc/characters_bloc.dart';
import 'package:get/get.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Center(child: Text('Press the button to fetch characters!!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.find<CharactersBloc>().add(CharactersFetch()),
        tooltip: 'Fetch',
        child: Icon(Icons.download_outlined),
      ),
    );
  }
}
