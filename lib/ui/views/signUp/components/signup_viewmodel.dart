import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:zc_desktop_flutter/app/app.logger.dart';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/ui/views/startup/startup_viewmodel.dart';

class SignUpViewModel extends BaseViewModel {
  final log = getLogger("SignUpViewModel");

  final _navigationService = locator<NavigationService>();

  String _logoUrl = "assets/images/zc_icon.svg";
  double _logoWidth = 12.0;
  double _logoHeight = 12.0;
  String _title = 'ZURI';
  String _subtitle = 'Create Account';
  String _policy =
      "By signing up, you agree that you have accepted our \nUser Notice and Privacy Policy";

  String get logoUrl => _logoUrl;
  double get logoWidth => _logoWidth;
  double get logoHeight => _logoHeight;
  String get title => _title;
  String get subtitle => _subtitle;
  String get policy => _policy;

  // TODO: 4, Remove after review
  final _storageService = locator<LocalStorageService>();

  // TODO: 5, Remove after review
  // String get testString => _storageService.getFromDisk(testLocalKey) as String;

  void goToHome() {
    // // TODO: 3, This is part of the local storage test. Remove this as well
    // _storageService.saveToDisk(testLocalKey, 'This is a test');

    // _navigationService.navigateTo(Routes.signUpView);
    // notifyListeners();
  }
}
