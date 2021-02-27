import 'package:flutter/material.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/models/character.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    Key key,
    @required Character character,
  })  : _character = character,
        super(key: key);

  final Character _character;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: SizedBox(
          height: 40,
          child: Text(
            _character.name,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              letterSpacing: -4,
            ),
          ),
        ),
        centerTitle: true,
        background: Image.network(
          _character.picture,
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.multiply,
          color: Colors.grey.shade500,
        ),
        titlePadding: const EdgeInsetsDirectional.only(bottom: 8),
      ),
      pinned: true,
    );
  }
}
