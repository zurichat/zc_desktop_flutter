import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';

class SuccessViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _windowsTitleBarService = locator<WindowTitleBarService>();
  
  void init() async {
    await Future.delayed(Duration(milliseconds: 1));
    _windowsTitleBarService.setTitle('Zuri | SignUp Successful');
  }

  void navigateToLoginView() async {
    await _navigationService.clearStackAndShow(Routes.loginView);
  }
}
