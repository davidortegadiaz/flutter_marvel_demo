import 'package:flutter/foundation.dart';
import 'package:flutter_marvel_demo/shared/models/thumbnail.dart';
import 'package:flutter_marvel_demo/shared/models/url.dart';
import 'package:flutter_marvel_demo/features/character_detail/domain/models/comic.dart';

class Character {
  final int id;
  final String name;
  final String description;
  final Thumbnail thumbnail;
  final List<Url> urls;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Character({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.thumbnail,
    @required this.urls,
  });

  Character copyWith({
    int id,
    String name,
    String description,
    Thumbnail thumbnail,
    List<Comic> comics,
    List<Url> urls,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (name == null || identical(name, this.name)) &&
        (description == null || identical(description, this.description)) &&
        (thumbnail == null || identical(thumbnail, this.thumbnail)) &&
        (urls == null || identical(urls, this.urls))) {
      return this;
    }

    return new Character(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      urls: urls ?? this.urls,
    );
  }

  @override
  String toString() {
    return 'Character{id: $id, name: $name, description: $description, thumbnail: $thumbnail, urls: $urls}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          thumbnail == other.thumbnail &&
          listEquals(other.urls, urls));

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode ^ thumbnail.hashCode ^ urls.hashCode;

  factory Character.fromMap(Map<String, dynamic> map) {
    return new Character(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      thumbnail: Thumbnail.fromMap(map['thumbnail'] as Map<String, dynamic>),
      urls: (map['urls'] as List)?.map((e) => e == null ? null : Url.fromMap(e as Map<String, dynamic>))?.toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'thumbnail': this.thumbnail,
      'urls': this.urls,
    };
  }

//</editor-fold>

}
