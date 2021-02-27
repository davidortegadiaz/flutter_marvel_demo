import 'dart:async' show Future;
import 'dart:convert' show json;

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_marvel_demo/http/api_config/api_config.dart';

class ApiConfigLoader {
  final String secretPath;

  ApiConfigLoader({this.secretPath});
  Future<ApiConfig> load() {
    return rootBundle.loadStructuredData<ApiConfig>(secretPath, (jsonStr) async {
      final secret = ApiConfig.fromJson(json.decode(jsonStr) as Map<String, dynamic>);
      return secret;
    });
  }
}
