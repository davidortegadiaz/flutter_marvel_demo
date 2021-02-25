import 'package:flutter/foundation.dart';
import 'package:flutter_marvel_demo/shared/models/thumbnail.dart';
import 'package:flutter_marvel_demo/shared/models/url.dart';

class Comic {
  final int id;
  final String title;
  final String variantDescription;
  final String description;
  final String format;
  final int pageCount;
  final Thumbnail thumbnail;
  final List<Url> urls;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Comic({
    this.id,
    this.title,
    this.variantDescription,
    this.description,
    this.format,
    this.pageCount,
    this.thumbnail,
    this.urls,
  });

  Comic copyWith({
    int id,
    String title,
    String variantDescription,
    String description,
    String format,
    int pageCount,
    Thumbnail thumbnail,
    List<Url> urls,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (title == null || identical(title, this.title)) &&
        (variantDescription == null || identical(variantDescription, this.variantDescription)) &&
        (description == null || identical(description, this.description)) &&
        (format == null || identical(format, this.format)) &&
        (pageCount == null || identical(pageCount, this.pageCount)) &&
        (thumbnail == null || identical(thumbnail, this.thumbnail)) &&
        (urls == null || identical(urls, this.urls))) {
      return this;
    }

    return Comic(
      id: id ?? this.id,
      title: title ?? this.title,
      variantDescription: variantDescription ?? this.variantDescription,
      description: description ?? this.description,
      format: format ?? this.format,
      pageCount: pageCount ?? this.pageCount,
      thumbnail: thumbnail ?? this.thumbnail,
      urls: urls ?? this.urls,
    );
  }

  @override
  String toString() {
    return 'Comic{id: $id, title: $title, variantDescription: $variantDescription, description: $description, format: $format, pageCount: $pageCount, thumbnail: $thumbnail, urls: $urls}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comic &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          variantDescription == other.variantDescription &&
          description == other.description &&
          format == other.format &&
          pageCount == other.pageCount &&
          thumbnail == other.thumbnail &&
          listEquals(other.urls, urls));

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      variantDescription.hashCode ^
      description.hashCode ^
      format.hashCode ^
      pageCount.hashCode ^
      thumbnail.hashCode ^
      urls.hashCode;

  factory Comic.fromMap(Map<String, dynamic> map) {
    return Comic(
      id: map['id'] as int,
      title: map['title'] as String,
      variantDescription: map['variantDescription'] as String,
      description: map['description'] as String,
      format: map['format'] as String,
      pageCount: map['pageCount'] as int,
      thumbnail: Thumbnail.fromMap(map['thumbnail'] as Map<String, dynamic>),
      urls: (map['urls'] as List)?.map((e) => e == null ? null : Url.fromMap(e as Map<String, dynamic>))?.toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'variantDescription': this.variantDescription,
      'description': this.description,
      'format': this.format,
      'pageCount': this.pageCount,
      'thumbnail': this.thumbnail,
      'urls': this.urls,
    };
  }

//</editor-fold>

}
