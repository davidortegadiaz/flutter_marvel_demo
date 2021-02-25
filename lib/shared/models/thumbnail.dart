class Thumbnail {
  final String path;
  final String extension;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Thumbnail({
    this.path,
    this.extension,
  });

  Thumbnail copyWith({
    String path,
    String extension,
  }) {
    if ((path == null || identical(path, this.path)) && (extension == null || identical(extension, this.extension))) {
      return this;
    }

    return Thumbnail(
      path: path ?? this.path,
      extension: extension ?? this.extension,
    );
  }

  @override
  String toString() {
    return 'Thumbnail{path: $path, extension: $extension}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Thumbnail && runtimeType == other.runtimeType && path == other.path && extension == other.extension);

  @override
  int get hashCode => path.hashCode ^ extension.hashCode;

  factory Thumbnail.fromMap(Map<String, dynamic> map) {
    return Thumbnail(
      path: map['path'] as String,
      extension: map['extension'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'path': this.path,
      'extension': this.extension,
    };
  }

//</editor-fold>

}
