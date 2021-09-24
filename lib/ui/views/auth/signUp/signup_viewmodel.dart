import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';

class SignUpViewModel extends BaseViewModel {
  final log = getLogger("SignUpViewModel");

  final _navigationService = locator<NavigationService>();

  String _logoUrl = "assets/images/zc_icon.svg";
  double _logoWidth = 12.0;
  double _logoHeight = 12.0;
  String _title = 'ZURI';
  String _subtitle = 'Create Account';
  bool _passwordVisibility = true;
  String _policy =
      "By signing up, you agree that you have accepted our User Notice \nand Privacy Policy";

  String get logoUrl => _logoUrl;
  double get logoWidth => _logoWidth;
  double get logoHeight => _logoHeight;
  String get title => _title;
  String get subtitle => _subtitle;
  String get policy => _policy;

  bool get passwordVisibily => _passwordVisibility;

  void setPasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  void goToLogin() {
    _navigationService.navigateTo(Routes.loginView);
    notifyListeners();
  }

  void goToHome() {
    _navigationService.navigateTo(Routes.homeView);
    notifyListeners();
  }
}
