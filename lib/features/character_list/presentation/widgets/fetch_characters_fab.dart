import 'package:flutter/material.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/controller/characters_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FetchCharactersFAB extends StatefulWidget {
  const FetchCharactersFAB({
    Key key = const Key('characters.fetch.fab'),
  }) : super(key: key);

  @override
  _FetchCharactersFABState createState() => _FetchCharactersFABState();
}

class _FetchCharactersFABState extends State<FetchCharactersFAB> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<CharactersController>(
      builder: (controller) {
        controller.isLoading.isTrue ? _controller.repeat() : _controller.reset();

        return RotationTransition(
          turns: _animation,
          child: FloatingActionButton(
            onPressed: () async => await controller.fetchCharacters(),
            tooltip: 'Fetch Characters',
            child: SvgPicture.asset(
              'assets/icons/icon_avengers.svg',
              width: 24,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
