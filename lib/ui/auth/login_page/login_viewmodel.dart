import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  final log = getLogger("LoginViewModel");

  final _navigationService = locator<NavigationService>();
  final _auth = locator<AuthService>();

  bool _passwordVisibility = true;

  bool get passwordVisibily => _passwordVisibility;

  void setPasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  void goToSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
    notifyListeners();
  }

  void gotoForgetpassword() {
    _navigationService.navigateTo(Routes.forgotPasswordView);
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await runBusyFuture(performLogin(email, password));
  }

  Future<void> performLogin(String email, String password) async {
    await _auth.login(email, password);
    _navigationService.navigateTo(Routes.workspaceView);
  }

  @override
  void onFutureError(error, Object? key) {
    print('Handle Error here');
    super.onFutureError(error, key);
  }
}
