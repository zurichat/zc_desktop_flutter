import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class ErrorViewModel extends BaseViewModel {
  void lauchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not lauch the $url';
    }
  }
}
