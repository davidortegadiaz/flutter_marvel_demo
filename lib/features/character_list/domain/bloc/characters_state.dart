part of 'characters_bloc.dart';

@immutable
class CharactersState {
  final List<Character> characters;
  final bool loading;
  final bool error;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const CharactersState({
    this.characters,
    this.loading = false,
    this.error = false,
  });

  CharactersState copyWith({
    List<Character> characters,
    bool loading,
    bool error,
  }) {
    if ((characters == null || identical(characters, this.characters)) &&
        (loading == null || identical(loading, this.loading)) &&
        (error == null || identical(error, this.error))) {
      return this;
    }

    return CharactersState(
      characters: characters ?? this.characters,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'CharactersState{characters: $characters, loading: $loading, error: $error}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharactersState &&
          runtimeType == other.runtimeType &&
          listEquals(other.characters, characters) &&
          loading == other.loading &&
          error == other.error);

  @override
  int get hashCode => characters.hashCode ^ loading.hashCode ^ error.hashCode;

  factory CharactersState.fromMap(Map<String, dynamic> map) {
    return CharactersState(
      characters: (map['characters'] as List)
          ?.map((e) => e == null ? null : Character.fromMap(e as Map<String, dynamic>))
          ?.toList(),
      loading: map['loading'] as bool,
      error: map['error'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'characters': this.characters,
      'loading': this.loading,
      'error': this.error,
    };
  }

//</editor-fold>

}
