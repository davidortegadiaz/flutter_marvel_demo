import 'dart:io';

String fixture(String name) {
  try {
    return File('../test/$name').readAsStringSync();
  } catch (e) {
    return File('./test/$name').readAsStringSync();
  }
}
