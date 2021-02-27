import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/models/character.dart';
import 'package:flutter_marvel_demo/routes/route_names.dart';
import 'package:get/get.dart';

class CharacterListItem extends StatelessWidget {
  const CharacterListItem({
    Key key,
    @required Character character,
  })  : _character = character,
        super(key: key);

  final Character _character;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GestureDetector(
        key: Key('tappableListTile'),
        child: ListTile(
          key: Key('characterListTile'),
          leading: Padding(
            padding: EdgeInsets.only(
              top: 4,
              bottom: 4,
              right: 4,
            ),
            child: Image.network(_character.picture),
          ),
          title: Text(
            _character.name.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () async {
            Get.toNamed(
              RouteNames.characterDetailPage,
              arguments: _character,
            );
          },
        ),
      ),
    );
  }
}
