import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';

// TODO: 2, This is part of the local storage test. Remove this as well
const testLocalKey = 'TESTKEY';
class StartUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final log = getLogger("StartUpViewModel");

  // TODO: 1, This is to test that the local storage service is working properly. Remove after review
  final _storageService = locator<LocalStorageService>();


  String _appName = 'Zuri Chat';
  String get appName => _appName;

  void goToHome() {
    // TODO: 3, This is part of the local storage test. Remove this as well
    _storageService.saveToDisk(testLocalKey, 'This is a test');

    _navigationService.navigateTo(Routes.homeView);
    notifyListeners();
  }
}
