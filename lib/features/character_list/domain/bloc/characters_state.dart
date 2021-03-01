part of 'characters_bloc.dart';

@immutable
class CharactersState {
  final List<Character> characters;
  final bool loading;
  final bool error;
  final bool hasReachedMax;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const CharactersState({
    this.characters = const [],
    this.loading = false,
    this.error = false,
    this.hasReachedMax = false,
  });

  CharactersState copyWith({
    List<Character> characters,
    bool loading,
    bool error,
    bool hasReachedMax,
  }) {
    if ((characters == null || identical(characters, this.characters)) &&
        (loading == null || identical(loading, this.loading)) &&
        (error == null || identical(error, this.error)) &&
        (hasReachedMax == null || identical(hasReachedMax, this.hasReachedMax))) {
      return this;
    }

    return CharactersState(
      characters: characters ?? this.characters,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return 'CharactersState{characters: $characters, loading: $loading, error: $error, hasReachedMax: $hasReachedMax}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharactersState &&
          runtimeType == other.runtimeType &&
          listEquals(other.characters, characters) &&
          loading == other.loading &&
          error == other.error &&
          hasReachedMax == other.hasReachedMax);

  @override
  int get hashCode => characters.hashCode ^ loading.hashCode ^ error.hashCode ^ hasReachedMax.hashCode;

//</editor-fold>

}
