import 'package:flutter/material.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/bloc/characters_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FetchCharactersFAB extends StatelessWidget {
  const FetchCharactersFAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.find<CharactersBloc>().add(CharactersFetch());
      },
      tooltip: 'Fetch Characters',
      child: SvgPicture.asset(
        'assets/icons/icon_avengers.svg',
        width: 24,
        color: Colors.white,
      ),
    );
  }
}
