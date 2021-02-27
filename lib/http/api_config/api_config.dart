import 'dart:convert';

import 'package:crypto/crypto.dart';

import 'api_config_loader.dart';

class ApiConfig {
  final String publicKey;
  final String privateKey;

  ApiConfig({this.privateKey = '', this.publicKey});

  factory ApiConfig.fromJson(Map<String, dynamic> jsonMap) {
    return ApiConfig(
      publicKey: jsonMap['publicKey'] as String,
      privateKey: jsonMap['privateKey'],
    );
  }

  Future<Map<String, Object>> queryParams() async {
    final ApiConfig _config = await ApiConfigLoader(secretPath: 'assets/api_keys.json').load();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = md5
        .convert(
          utf8.encode('$timestamp${_config.privateKey}${_config.publicKey}'),
        )
        .toString();

    Map<String, Object> _queryParams = <String, Object>{
      'apikey': _config.publicKey,
      'ts': timestamp,
      'hash': hash,
    };
    return _queryParams;
  }
}
