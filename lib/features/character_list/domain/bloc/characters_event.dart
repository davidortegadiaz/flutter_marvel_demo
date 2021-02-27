part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CharactersFetch extends CharactersEvent {}
