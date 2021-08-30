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

  void goToHome() {
    _navigationService.navigateTo(Routes.homeView);
    notifyListeners();
  }
}
