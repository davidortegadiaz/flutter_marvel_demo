class Url {
  final String type;
  final String url;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Url({
    this.type,
    this.url,
  });

  Url copyWith({
    String type,
    String url,
  }) {
    if ((type == null || identical(type, this.type)) && (url == null || identical(url, this.url))) {
      return this;
    }

    return Url(
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  @override
  String toString() {
    return 'Url{type: $type, url: $url}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Url && runtimeType == other.runtimeType && type == other.type && url == other.url);

  @override
  int get hashCode => type.hashCode ^ url.hashCode;

  factory Url.fromMap(Map<String, dynamic> map) {
    return Url(
      type: map['type'] as String,
      url: map['url'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': this.type,
      'url': this.url,
    };
  }

//</editor-fold>

}
