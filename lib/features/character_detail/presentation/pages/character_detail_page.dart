import 'package:flutter/material.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/models/character.dart';
import 'package:get/get.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Character _character = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _character.name,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            letterSpacing: -5,
          ),
        ),
      ),
      body: Center(
        child: Text(_character.name),
      ),
    );
  }
}
