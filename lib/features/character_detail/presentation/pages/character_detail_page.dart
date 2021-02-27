import 'package:flutter/material.dart';
import 'package:flutter_marvel_demo/features/character_detail/presentation/widgets/detail_appbar.dart';
import 'package:flutter_marvel_demo/features/character_detail/presentation/widgets/detail_description.dart';
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
          //mocked widget
          ...[_DetailComicsRow()],
        ],
      ),
    );
  }
}

class _DetailComicsRow extends StatelessWidget {
  const _DetailComicsRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 12,
            ),
            child: Text(
              'COMICS',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 100.0,
                  child: Card(
                    child: Text('data'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
