import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/startup_service.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _navigationService = locator<NavigationService>();
  final _startupService = locator<StartupService>();

  void initialise() async {
    await Future.delayed(Duration(milliseconds: 1000));

    await _navigationService.navigateTo(Routes.loginView);
  }

  Future<void> runStartupLogic() async {
    if (_startupService.hasLoggedInUser) {
      // Do logged in stuff
    } else {
      // Do logged out stuff
    }
  }
}
