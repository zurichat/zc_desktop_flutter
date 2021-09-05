import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';

class StartUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final log = getLogger("StartUpViewModel");

  String _appName = 'Zuri Chat';
  String get appName => _appName;

  final String _circularImage = 'assets/images/circularImage.png';
  String get circularImage => _circularImage;

  String _title = 'Unlimited Team Collaboration Platform';
  String _subTitle =
      'Unlimited team collaboration platform with emphasis on team building,\n fun, team manageent and above all, project management.';

  String get title => _title;
  String get subTitle => _subTitle;

  void goToHome() {
    _navigationService.navigateTo(Routes.homeView);

    notifyListeners();
  }
}
