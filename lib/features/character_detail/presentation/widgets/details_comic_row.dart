import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marvel_demo/features/character_detail/domain/bloc/comics_bloc.dart';
import 'package:flutter_marvel_demo/features/character_detail/domain/models/comic.dart';
import 'package:flutter_marvel_demo/features/character_detail/presentation/widgets/comic_card.dart';
import 'package:get/get.dart';

class DetailComicsRow extends StatelessWidget {
  const DetailComicsRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicsBloc, ComicsState>(
      cubit: Get.find<ComicsBloc>(),
      builder: (context, state) {
        if (state.error) {
          return SliverToBoxAdapter(
            child: Center(
              key: Key('comic.list.error'),
              child: Text(
                'Ops! sorry, something went wrong...',
                key: Key('comic.list.error.message'),
              ),
            ),
          );
        }
        if (state.loading) {
          return SliverToBoxAdapter(
            child: Center(
              key: Key('comic.list.loading'),
              child: CircularProgressIndicator(),
            ),
          );
        }
        final List<Comic> _comics = state.comics;
        if (_comics.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              key: Key('comic.list.empty'),
              child: Text(
                'Ops! sorry, something went wrong...',
                key: Key('comic.list.empty.message'),
              ),
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Column(
            key: Key('comic.list'),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Label(),
              Container(
                height: 150.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _comics.length,
                  itemBuilder: (context, index) {
                    final Comic _comic = _comics[index];
                    return ComicCard(comic: _comic);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({
    Key key = const Key('comic.list.label'),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
