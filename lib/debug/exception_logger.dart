import 'package:lumberdash/lumberdash.dart';
import 'package:flutter_marvel_demo/http/custom_exceptions.dart';

enum ExceptionType {
  badRequest,
  noResponse,
}

class ExceptionLogger {
  Exception exception({
    ExceptionType type,
    String errorMessage,
    dynamic stackTracke,
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
