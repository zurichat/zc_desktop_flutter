import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/startup_service.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _navigationService = locator<NavigationService>();
  final _startupService = locator<StartupService>();
  final _localStorageService = locator<LocalStorageService>();

  void initialise() async {
    await Future.delayed(Duration(milliseconds: 1000));
    await checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    try {
      final auth = await Auth.fromJson(jsonDecode(_localStorageService.getFromDisk(localAuthResponseKey).toString()));
      if(auth.user.toString().isNotEmpty){
        _navigationService.navigateTo(Routes.organizationView);
        return;
      }
      _navigationService.navigateTo(Routes.loginView);
    } catch (e) {
       _navigationService.navigateTo(Routes.loginView);
    }
  }

  Future<void> runStartupLogic() async {
    if (_startupService.hasLoggedInUser) {
      // Do logged in stuff
    } else {
      // Do logged out stuff
    }
  }
}
