import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';

class LoginViewModel extends FormViewModel {
  final log = getLogger('LoginViewModel');
  final _navigationService = locator<NavigationService>();
  final _auth = locator<AuthService>();
  final _windowsTitleBarService = locator<WindowTitleBarService>();

  void init() async {
    await Future.delayed(Duration(milliseconds: 1));
    _windowsTitleBarService.setHome(false);
    _windowsTitleBarService.setTitle('Zuri | SignIn');
  }

  bool _passwordVisibility = true;

  bool get passwordVisible => _passwordVisibility;

  void setPasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  void goToSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }

  void gotoForgetPassword() {
    _navigationService.navigateTo(Routes.resetPasswordView);
  }

  Future<void> login(String email, String password) async {
    await runBusyFuture(performLogin(email, password));
  }

  Future<void> performLogin(String email, String password) async {
    try {
      await _auth.loginUser(email: email.trim(), password: password);
    } catch (e) {
      if (e.toString().contains('40')) {
        throw Failure(InvalidErrorMessage);
      }
      throw Failure(AuthErrorMessage);
    }
    _navigationService.navigateTo(Routes.chooseWorkspaceView);
  }

  @override
  void onFutureError(error, Object? key) {
    log.i('Handle Error here');
    super.onFutureError(error, key);
  }

  @override
  void setFormStatus() {}
}
