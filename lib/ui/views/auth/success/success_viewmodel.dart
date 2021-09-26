import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';

class SuccessViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _image = 'assets/images/success.svg';
  final _title = 'Email verification succesfull !';
  final _subTitle = 'Click on the Button to continue';

  get title => _title;
  get subTitle => _subTitle;
  get image => _image;

  gotoLogin() {
    _navigator.navigateTo(Routes.loginView);
    notifyListeners();
  }
}