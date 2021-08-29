import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';

class StartUpViewModel extends BaseViewModel {
  String _appName = 'Zuri Chat';

  final _navigationService = locator<NavigationService>();

  String get appName => _appName;

  void goToHome() {
    _navigationService.navigateTo(Routes.homeView);
    notifyListeners();
  }
}
