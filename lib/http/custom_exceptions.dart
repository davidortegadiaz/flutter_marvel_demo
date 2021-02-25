import 'package:flutter_marvel_demo/debug/exception_logger.dart';

class BadRequestException implements Exception {
  final String message;
  BadRequestException({this.message = 'exception.bad_request'});

  void call() => toString();
  @override
  String toString() {
    return message;
  }
}

class NoResponseException with ExceptionLogger implements Exception {
  final String message;
  NoResponseException({this.message = 'exception.no_response'});

  void call() => toString();
  @override
  String toString() {
    return message;
  }
}
