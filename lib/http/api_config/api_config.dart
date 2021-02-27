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
}
