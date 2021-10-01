import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';

class ChooseWorkspaceViewmodel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool value = false;
  int _counter = 0;
  int get getCounter => _counter;

  void onChange(bool? cValue) {
    cValue = !value;
    _counter++;
    notifyListeners();
  }

  void goToCreateWorkSpace() {
    _navigationService.navigateTo(Routes.createWorkspaceView);
  }
   void goToCreateAccount() {
    _navigationService.navigateTo(Routes.signUpView);
  }
}
