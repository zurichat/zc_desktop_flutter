import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _navigationService = locator<NavigationService>();
  final _localStorageService = locator<LocalStorageService>();

  /// This function checks if user is logged in back checking if the user model on disk 
  /// is not empty. If it is then user is redirected to [Login View] else [Orgnisation View]
  void initialise() async {
    await Future.delayed(Duration(milliseconds: 10));
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
}
