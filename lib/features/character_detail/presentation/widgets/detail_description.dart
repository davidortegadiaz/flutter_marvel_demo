import 'package:flutter/material.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/models/character.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({
    Key key,
    @required Character character,
  })  : _character = character,
        super(key: key);

  final Character _character;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 12,
        right: 12,
      ),
      sliver: SliverToBoxAdapter(
        child: Text(
          _character.description.isNotEmpty
              ? _character.description
              : 'Marvel Worldwide, Inc. known as Marvel Comics, is an American comic book publisher founded in 1939, initially under the name Timely Publications. Its iconic characters in the superhero genre include Spider-Man, Wolverine, X-Men, Captain America, Iron Man, Hulk, Thor, Fantastic 4, among others. Starting in the 1990s, the company positioned itself as one of the leading comic book publishers in the country.',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
