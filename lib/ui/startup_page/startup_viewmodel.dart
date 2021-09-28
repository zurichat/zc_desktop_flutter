import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';

class StartUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _auth = locator<AuthService>();

  final log = getLogger("StartUpViewModel");

  String _appName = 'Zuri Chat';

  String get appName => _appName;

  final String _circularImage = 'assets/lottie/hng.gif';

  String get circularImage => _circularImage;

  String _title = 'Unlimited Team Collaboration Platform';
  String _subTitle =
      'Unlimited team collaboration platform with emphasis on team building,\n fun, team manageent and above all, project management.';

  String get title => _title;

  String get subTitle => _subTitle;

/*  Future<void> checkLoginStatus() async {
    try {
      await _auth.checkToken();
      if() {

      }

    } catch (e) {
    await Future.delayed(Duration(milliseconds: 1000));
    _navigationService.navigateTo(Routes.loginView);
    }
  }

  Future<void> setup() async {
    await locator.allReady();
    bool loggedIn = await _auth.hasToken();

    // AutoLogin feature
    if (loggedIn) {
      //_navigationService.pushNamedAndRemoveUntil(Routes.selectEstateView);
    } else {
      //_navigationService.pushNamedAndRemoveUntil(Routes.signInView);
    }
  }*/

  void goToHome() {
    //_navigationService.navigateTo(Routes.homeView);

    notifyListeners();
  }
}
