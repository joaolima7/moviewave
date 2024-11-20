import 'package:movie_app/core/consts/api_consts.dart';
import 'package:url_launcher/url_launcher.dart';

class Launcher {
  static Future<void> launchAuthenticationUrl(String requestToken) async {
    final url =
        '${APICONSTS.urlAuthenticate}$requestToken?redirect_to=https://www.yourapp.com/approved';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl((Uri.parse(url)));
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
