part of 'comics_bloc.dart';

@immutable
abstract class ComicsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ComicsFetch extends ComicsEvent {
  final int characterId;

  ComicsFetch({
    @required this.characterId,
  });

  @override
  List<Object> get props => [characterId];
}
