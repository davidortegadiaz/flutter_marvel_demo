import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/bloc/characters_bloc.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/repositories/characters_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../models/character/fake/character.dart';
import 'fakes/characters_state.dart';

class MockCharactersBloc extends MockBloc<CharactersState> implements CharactersBloc {}

class MockCharactersRepository extends Mock implements CharactersRepository {}

void main() {
  CharactersBloc charactersBloc;
  CharactersRepository _mockCharactersRepository;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    _mockCharactersRepository = MockCharactersRepository();

    charactersBloc = CharactersBloc(repository: _mockCharactersRepository);
  });

  tearDown(() {
    charactersBloc?.close();
  });

  group('whenListen', () {
    test("Mock the CharactersBloc's stream!", () {
      final _mockedBloc = MockCharactersBloc();
      whenListen(
        _mockedBloc,
        Stream.fromIterable(
          [
            tInitialCharactersState,
            tLoadingCharactersState,
            tSuccessCharactersState,
            tErrorCharactersState,
          ],
        ),
      );
      expectLater(
        _mockedBloc,
        emitsInOrder(
          <CharactersState>[
            tInitialCharactersState,
            tLoadingCharactersState,
            tSuccessCharactersState,
            tErrorCharactersState,
          ],
        ),
      );
    });
  });

  group('CharactersBloc', () {
    blocTest<CharactersBloc, CharactersState>(
      'emits [] when nothing is added',
      build: () => charactersBloc,
      expect: [],
    );

    test('has a correct initialState', () {
      expect(charactersBloc.state, tInitialCharactersState);
    });

    group('CharactersFetch ', () {
      blocTest<CharactersBloc, CharactersState>(
        'should emit [tCharactersLoading, tCharactersSuccessState] when CharactersRepository returns a list of characters',
        build: () {
          when(_mockCharactersRepository.fetchCharacters()).thenAnswer((_) async => [
                tCharacter,
              ]);
          return charactersBloc;
        },
        act: (bloc) async {
          charactersBloc.add(CharactersFetch());
        },
        expect: <CharactersState>[
          tLoadingCharactersState,
          tSuccessCharactersState,
        ],
      );

      blocTest<CharactersBloc, CharactersState>(
        'should emit [tActivityProviderLoading, tActivityProviderError] when CharactersStateRepository throws Exception',
        build: () {
          when(_mockCharactersRepository.fetchCharacters()).thenThrow((_) async => Exception());
          return charactersBloc;
        },
        act: (bloc) async {
          charactersBloc.add(CharactersFetch());
        },
        expect: <CharactersState>[
          tLoadingCharactersState,
          tErrorCharactersState,
        ],
      );
    });
  });
}
