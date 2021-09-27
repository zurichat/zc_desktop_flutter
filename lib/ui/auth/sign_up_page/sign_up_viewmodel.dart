import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:zc_desktop_flutter/app/app.logger.dart';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';

class SignUpViewModel extends BaseViewModel with Validator {
  final log = getLogger("SignUpViewModel");

  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  bool _passwordVisibility = true;
  bool get passwordVisibily => _passwordVisibility;

  bool _confirmPasswordVisibility = true;
  bool get confirmPasswordVisibily => _confirmPasswordVisibility;

  bool _isPolicyChecked = false;
  bool get isPolicyChecked => _isPolicyChecked;

  void setPasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  void setconfirmPasswordVisibility() {
    _confirmPasswordVisibility = !_confirmPasswordVisibility;
    notifyListeners();
  }

  void onPolicyCheckChanged(bool? value) {
    _isPolicyChecked = value!;
    notifyListeners();
  }

  void goToLogin() {
    _navigationService.navigateTo(Routes.loginView);
    notifyListeners();
  }

  Future<void> signup({
    required String email,
    required String password,
  }) async {
    await runBusyFuture(performSignup(email, password));
  }

  Future<void> performSignup(String email, String password) async {
    if (!isPolicyChecked) {
      throw Failure('Please accept our policy before you continue');
    } else {
      this.clearErrors();
      notifyListeners();
    }
    try {
      await _authService.signup(email: email, password: password);
    } catch (e) {
      throw Failure(e.toString());
    }

    _navigationService.navigateTo(Routes.checkEmailView, arguments: {
      'email': email,
      'isReset': false,
    });
  }

  /// Error should be handled here. It could be displaying a toast of something else
  @override
  void onFutureError(error, Object? key) {
    print('Handle Error here');
    super.onFutureError(error, key);
  }
}
