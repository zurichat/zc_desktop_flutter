import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';

class ProfileDropdownViewModel extends BaseViewModel {
  bool _isDropped = false;
  bool _isHover = false;
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _windowTitleBarService = locator<WindowTitleBarService>();

  bool get isDropped => _isDropped;
  bool get isHover => _isHover;
  User get user => _userService.auth.user!;

  setIsDropped() {
    _isDropped = !_isDropped;
    notifyListeners();
  }

  onEntered(bool isHover) {
    _isHover = isHover;
    notifyListeners();
  }

  void signOut() async {
    _windowTitleBarService.setHome(false);
    Future.delayed(Duration(milliseconds: 10));
    _authService.logOut(_userService.auth.user!.token.toString());
    _navigationService.pushNamedAndRemoveUntil(Routes.loginView);

  }
}
