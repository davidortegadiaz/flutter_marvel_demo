import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_marvel_demo/features/character_detail/domain/bloc/comics_bloc.dart';
import 'package:flutter_marvel_demo/features/character_detail/domain/repositories/comics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../models/comic/fake/comic.dart';
import 'fake/comics_state.dart';

class MockComicsBloc extends MockBloc<ComicsState> implements ComicsBloc {}

class MockComicsRepository extends Mock implements ComicsRepository {}

void main() {
  ComicsBloc comicsBloc;
  ComicsRepository _mockComicsRepository;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    _mockComicsRepository = MockComicsRepository();

    comicsBloc = ComicsBloc(repository: _mockComicsRepository);
  });

  tearDown(() {
    comicsBloc?.close();
  });

  group('whenListen', () {
    test("Mock the ComicsBloc's stream!", () {
      final _mockedBloc = MockComicsBloc();
      whenListen(
        _mockedBloc,
        Stream.fromIterable(
          [
            tInitialComicsState,
            tLoadingComicsState,
            tSuccessComicsState,
            tErrorComicsState,
          ],
        ),
      );
      expectLater(
        _mockedBloc,
        emitsInOrder(
          <ComicsState>[
            tInitialComicsState,
            tLoadingComicsState,
            tSuccessComicsState,
            tErrorComicsState,
          ],
        ),
      );
    });
  });

  group('ComicsBloc', () {
    blocTest<ComicsBloc, ComicsState>(
      'emits [] when nothing is added',
      build: () => comicsBloc,
      expect: [],
    );

    test('has a correct initialState', () {
      expect(comicsBloc.state, tInitialComicsState);
    });

    group('ComicsFetch ', () {
      blocTest<ComicsBloc, ComicsState>(
        'should emit [tComicsLoading, tComicsSuccessState] when ComicsRepository returns a list of comics',
        build: () {
          when(_mockComicsRepository.fetchComics(any)).thenAnswer((_) async => [
                tComic,
              ]);
          return comicsBloc;
        },
        act: (bloc) async {
          const int mockId = 0;
          comicsBloc.add(ComicsFetch(characterId: mockId));
        },
        expect: <ComicsState>[
          tLoadingComicsState,
          tSuccessComicsState,
        ],
      );

      blocTest<ComicsBloc, ComicsState>(
        'should emit [tComicsLoading, tComicsError] when ComicsRepository throws Exception',
        build: () {
          when(_mockComicsRepository.fetchComics(any)).thenThrow((_) async => Exception());
          return comicsBloc;
        },
        act: (bloc) async {
          const int mockId = 0;
          comicsBloc.add(ComicsFetch(characterId: mockId));
        },
        expect: <ComicsState>[
          tLoadingComicsState,
          tErrorComicsState,
        ],
      );
    });
  });
}
