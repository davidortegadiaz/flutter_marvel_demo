import 'package:flutter_driver/flutter_driver.dart';
import 'package:lumberdash/lumberdash.dart';

Future<void> delay([int milliseconds = 1000]) async {
  await Future<void>.delayed(
    Duration(milliseconds: milliseconds),
  );
}

Future<bool> isPresent(
  SerializableFinder byValueKey,
  FlutterDriver driver, {
  Duration timeout = const Duration(milliseconds: 1500),
}) async {
  try {
    await driver.waitFor(
      byValueKey,
      timeout: timeout,
    );
    return true;
  } catch (exception) {
    logError('Not found ${byValueKey.serialize().toString()}');
    return false;
  }
}
