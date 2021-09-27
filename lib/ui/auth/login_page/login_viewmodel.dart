import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/constants/strings.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  final log = getLogger("LoginViewModel");

  final _navigationService = locator<NavigationService>();
  final _auth = locator<AuthService>();

  // final _fakeApiService = locator<FakeApi>();

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
    _navigationService.navigateTo(Routes.resetPasswordView);
    notifyListeners();
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
      if(e.toString().contains('Invalid')) {
        throw Failure(e.toString());
      }
      throw Failure(AppStrings.internetError);
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
