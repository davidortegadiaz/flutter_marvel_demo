import 'package:flutter/material.dart';
import 'package:flutter_marvel_demo/features/character_detail/presentation/widgets/detail_appbar.dart';
import 'package:flutter_marvel_demo/features/character_detail/presentation/widgets/detail_description.dart';
import 'package:flutter_marvel_demo/features/character_detail/presentation/widgets/details_comic_row.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/models/character.dart';
import 'package:get/get.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Character _character = Get.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailAppBar(character: _character),
          DetailDescription(character: _character),
          ...[DetailComicsRow()],
        ],
      ),
    );
  }
}
