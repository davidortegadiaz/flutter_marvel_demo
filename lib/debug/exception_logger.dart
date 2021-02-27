import 'package:flutter_marvel_demo/http/custom_exceptions.dart';
import 'package:lumberdash/lumberdash.dart';

enum ExceptionType {
  badRequest,
  noResponse,
  exception,
}

class ExceptionLogger {
  Exception exception({
    ExceptionType type,
    String errorMessage,
    dynamic stackTrace,
  }) {
    Exception _exception;
    switch (type) {
      case ExceptionType.badRequest:
        _exception = BadRequestException(message: errorMessage);
        break;
      case ExceptionType.noResponse:
        _exception = NoResponseException(message: errorMessage);
        break;
      default:
        _exception = Exception(errorMessage);
    }
    logError(_exception);
    return _exception;
  }
}
