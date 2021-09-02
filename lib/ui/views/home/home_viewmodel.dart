import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:zc_desktop_flutter/app/app.logger.dart';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/ui/views/startup/startup_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger("HomeViewwModel");

  String _logoUrl = 'assets/images/zc_logo.png';
  double _logoWidth = 10.0;
  double _logoHeight = 10.0;
  String _title =
      'Welcome to Zuri Chat! An open source, very flexible tool built by Flutter desktop team.';

  String get logoUrl => _logoUrl;
  double get logoWidth => _logoWidth;
  double get logoHeight => _logoHeight;
  String get title => _title;

  // TODO: 4, Remove after review
  final _storageService = locator<LocalStorageService>();


  // TODO: 5, Remove after review
  String get testString => _storageService.getFromDisk(testLocalKey) as String;


  //TODO: Remove After Review
  final _navigationService = locator<NavigationService>();

  void goToInputView(){
    _navigationService.navigateTo(Routes.authInputTestView);
    notifyListeners();
  }
}
