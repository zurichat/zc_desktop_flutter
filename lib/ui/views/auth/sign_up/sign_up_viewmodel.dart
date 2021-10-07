import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';

class SignUpViewModel extends BaseViewModel with Validator {
  final log = getLogger('SignUpViewModel');

  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  bool _passwordVisibility = true;
  bool get passwordVisibility => _passwordVisibility;

  bool _confirmPasswordVisibility = true;
  bool get confirmPasswordVisibility => _confirmPasswordVisibility;

  bool _isPolicyChecked = false;
  bool get isPolicyChecked => _isPolicyChecked;

  void setPasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  void setConfirmPasswordVisibility() {
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

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await runBusyFuture(performSignUp(email, password));
  }

  Future<void> performSignUp(String email, String password) async {
    if (!isPolicyChecked) {
      throw Failure('Please accept our policy before you continue');
    } else {
      this.clearErrors();
      notifyListeners();
    }
    try {
      await _authService.signup(email: email, password: password);
    } catch (e) {
      if(e.toString().contains('email')){
        throw Failure(e.toString());
      }
      throw Failure(AuthErrorMessage);
    }

    _navigationService.navigateTo(Routes.checkEmailView, arguments: {
      'email': email,
      'isReset': false,
    });
  }

  /// Error should be handled here. It could be displaying a toast of something else
  @override
  void onFutureError(error, Object? key) {
    log.i('Handle Error here');
    super.onFutureError(error, key);
  }
}
