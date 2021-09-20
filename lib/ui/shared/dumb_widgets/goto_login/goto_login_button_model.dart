import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';

class GotoLoginButtonModel extends BaseViewModel {
  final _navigate = locator<NavigationService>();
  final _gotoText = 'Back to Login';

  get gotoText => _gotoText;


  void gotoLogin() {
    _navigate.navigateTo(Routes.loginView);
    notifyListeners();
  }
}