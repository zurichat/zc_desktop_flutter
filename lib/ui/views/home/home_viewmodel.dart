import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _logoUrl = 'assets/images/zc_logo.png';
  double _logoWidth = 10.0;
  double _logoHeight = 10.0;
  String _title =
      'Welcome to Zuri Chat! An open source, very flexible tool built by HNGi4G8 Flutter desktop team.';

  String get logoUrl => _logoUrl;
  double get logoWidth => _logoWidth;
  double get logoHeight => _logoHeight;
  String get title => _title;
}
