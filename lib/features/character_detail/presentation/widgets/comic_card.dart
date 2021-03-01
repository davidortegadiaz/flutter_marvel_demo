import 'package:flutter/material.dart';
import 'package:flutter_marvel_demo/features/character_detail/domain/models/comic.dart';
import 'package:flutter_marvel_demo/shared/helpers/url_launcher_helper.dart';
import 'package:flutter_marvel_demo/shared/models/thumbnail.dart';

class ComicCard extends StatelessWidget {
  const ComicCard({
    Key key,
    @required Comic comic,
  })  : _comic = comic,
        super(key: key);

  final Comic _comic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UrlLauncherHelper()..launch(_comic.urls[0].url);
      },
      child: Container(
        width: 110.0,
        child: Card(
          child: Image.network(
            _comic.thumbnail.url(ThumbnailType.portrait_incredible),
          ),
        ),
      ),
    );
  }
}
