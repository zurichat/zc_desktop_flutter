import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';

// TODO: 2, This is part of the local storage test. Remove this as well
const testLocalKey = 'TESTKEY';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _navigationService = locator<NavigationService>();

  void initialise() async {
    await Future.delayed(Duration(milliseconds: 1000));

    await _navigationService.navigateTo(Routes.loginView);
  }
}
