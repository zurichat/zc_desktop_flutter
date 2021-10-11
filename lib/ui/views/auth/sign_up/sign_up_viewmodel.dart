import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'sign_up_view.form.dart';

class SignUpViewModel extends FormViewModel with Validator {
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

  Future<void> signUp() async {
    await runBusyFuture(performSignUp(emailValue!, passwordValue!));
  }

  Future<void> performSignUp(String email, String password) async {
    if (!isPolicyChecked) {
      throw Failure('Please accept our policy before you continue');
    } else {
      this.clearErrors();
      notifyListeners();
    }
    try {
      await _authService.signup(email: email.trim(), password: password);
    } catch (e) {
      if(e.toString().contains('40')){
        throw Failure(EmailAlreadyInUseError);
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

  @override
  void setFormStatus() {}
}
