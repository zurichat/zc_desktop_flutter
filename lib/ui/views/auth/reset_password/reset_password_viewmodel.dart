import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';

class ResetPasswordViewModel extends FormViewModel with Validator {
  final _navigator = locator<NavigationService>();

  String? _errorText;
  String _errorMessage = '';
  bool _isBusy = false;
  final _authService = locator<AuthService>();

  get errorText => _errorText;
  get isBusy => _isBusy;
  get errorMessage => _errorMessage;

  final _windowsTitleBarService = locator<WindowTitleBarService>();

  /// This method sets the [title] of the [ResetPasswordView] on the title  bar
  /// it is called immediately the view comes up
  void init() async {
    await Future.delayed(Duration(milliseconds: 1));
    _windowsTitleBarService.setTitle('Zuri | Reset Password');
  }

  /// This function set the busy state of the view.
  _setIsBusy() {
    _isBusy = !_isBusy;
    notifyListeners();
  }

  /// checks if the email address is a valid
  /// it either redirect the user to the CheckEmailView Page or returns an invalid email error,

  verifyAndGotoCheckEmail(email) async {
    if (!emailValidator(email)) {
      _errorText = ResetPasswordEmailErrorText;
      notifyListeners();
      return;
    }
    _setIsBusy();

    try {
      await _authService.requestPasswordResetCode(email);
      _setIsBusy();
      _navigator.navigateTo(Routes.checkEmailView,
          arguments: {'email': email, 'isReset': true});
    } catch (e) {
      /// if it contains a 404 or 405 error code, it means the user is not found
      if (e.toString().contains('40')) {
        _errorMessage = ResetPassword4o4ErrorMessage;
      } else {
        _errorMessage = ResetPasswordOtherEmailErrorMessages;
      }
      _setIsBusy();
    }
  }

  /// This method is meant to  be override while using the FormViewModel but since there's
  /// absolutely no need for the method inside this view model so it remain an empty method
  @override
  void setFormStatus() {}
}
