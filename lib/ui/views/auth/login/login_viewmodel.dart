import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';

class LoginViewModel extends BaseViewModel {
  final log = getLogger("LoginViewModel");
  final _windowTitleBarService = locator<WindowTitleBarService>();
  final _navigationService = locator<NavigationService>();
  final _auth = locator<AuthService>();

  // final _fakeApiService = locator<FakeApi>();

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

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await runBusyFuture(performLogin(email, password));
  }

  Future<void> performLogin(String email, String password) async {
    try {
      await _auth.login(email, password);
    } catch (e) {
      if (e.toString().contains('Invalid')) {
        throw Failure(e.toString());
      }
      if (e.toString().contains('await')) {
        throw Failure("Something unexpected happened, please try again.");
      }
      throw Failure('Faileed');
    }
    _navigationService.navigateTo(Routes.organizationView);
  }

  @override
  void onFutureError(error, Object? key) {
    print('Handle Error here');
    super.onFutureError(error, key);
  }

  Future<void> checkLoginStatus() async {
    // try {
    //   await _auth.checkToken();
    //   _goToHome();

    // } catch (e) {
    await Future.delayed(Duration(milliseconds: 1000));
    _navigationService.navigateTo(Routes.loginView);
    // }
  }
}
