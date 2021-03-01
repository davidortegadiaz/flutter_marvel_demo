import 'package:url_launcher/url_launcher.dart' as launcher;

class UrlLauncherHelper {
  final String baseUrl;

  UrlLauncherHelper({this.baseUrl = ''});

  Future<void> launch(String url) async {
    final String _url = baseUrl + url;
    final bool _canLaunch = await launcher.canLaunch(_url);
    _canLaunch ? launcher.launch(_url) : throw 'Could not launch $_url';
  }
}
