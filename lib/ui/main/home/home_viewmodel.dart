import 'package:stacked/stacked.dart';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';

import 'package:stacked_services/stacked_services.dart';

import 'package:zc_desktop_flutter/app/app.router.dart';

import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';
import 'package:zc_desktop_flutter/ui/auth/login/login_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger("HomeViewwModel");

  String _logoUrl = 'assets/images/zc_logo2.png';
  double _logoWidth = 10.0;
  double _logoHeight = 10.0;
  bool _showThread = false;
  String _title =
      'Welcome to Zuri Chat! An open source, very flexible tool built by Flutter desktop team.';

  String get logoUrl => _logoUrl;
  double get logoWidth => _logoWidth;
  double get logoHeight => _logoHeight;
  String get title => _title;

  final _storageService = locator<LocalStorageService>();

  String get testString => _storageService.getFromDisk(testLocalKey) as String;

  bool get showThread => _showThread;

  final _navigationService = locator<NavigationService>();

  void goToInputView() {
    _navigationService.navigateTo(Routes.authInputTestView);
    notifyListeners();
  }
}
