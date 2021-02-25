import 'package:http/http.dart' as http;
import 'package:flutter_marvel_demo/debug/exception_logger.dart';

class ErrorHelper {
  ExceptionLogger logger = ExceptionLogger();
  void checkStatusCode(http.Response postCall) {
    if (postCall.statusCode == 409) {
      throw logger.exception(
        type: ExceptionType.badRequest,
        errorMessage: postCall.body,
      );
    }
  }
}
