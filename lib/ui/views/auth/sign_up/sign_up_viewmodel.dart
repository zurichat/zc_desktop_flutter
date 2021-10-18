import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';
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
  final _windowsTitleBarService = locator<WindowTitleBarService>();

  void init() async {
    await Future.delayed(Duration(milliseconds: 1));
    _windowsTitleBarService.setTitle('Zuri | SignUp');
  }

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
    await runBusyFuture(performSignUp(emailValue!, passwordValue!, fullNameValue!));
  }

  Future<void> performSignUp(String email, String password, String fullName) async {
    if (!isPolicyChecked) {
      throw Failure('Please accept our policy before you continue');
    } else {
      this.clearErrors();
      notifyListeners();
    }
    try {
      String fName = '';
      String lName = '';
      if(fullName.contains(' ')) {
        final names = fullName.split(' ');
        fName = names[0];
        lName = names[1];
      } else {

      }
      await _authService.signup(email: email.trim(), password: password, fName: fName, lName: lName);
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
