import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';

class SuccessViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToLoginView() async {
    await _navigationService.clearStackAndShow(Routes.loginView);
  }
}
