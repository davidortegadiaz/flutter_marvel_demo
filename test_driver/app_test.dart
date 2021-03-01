import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'finder_helper.dart';

void main() {
  group('Flutter Marvel Demo', () {
    final charactersListInitialMessage = find.byValueKey('character.list.empty.message');
    final charactersPageFAB = find.byTooltip('Fetch Characters');
    final charactersList = find.byValueKey('character.list');
    final abyssCharacter = find.text('ABYSS');
    final abyssCharacterTile = find.ancestor(of: abyssCharacter, matching: find.byValueKey('character.list.item'));
    final characterDetailPage = find.byValueKey('character.detail.page');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Starts with initial message', () async {
      expect(
        await driver.getText(charactersListInitialMessage),
        'Press the button to fetch characters!!',
      );
    });

    test('App shows animation and load characters list when tap on fetchFAB ', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(charactersPageFAB);
        await delay(5000);
        expect(await isPresent(charactersList, driver), true);
      });
    });

    test('App navigates to detail page when tap on Abyss item ', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(abyssCharacterTile);
        expect(await isPresent(characterDetailPage, driver), true);
      });
    });
  });
}
