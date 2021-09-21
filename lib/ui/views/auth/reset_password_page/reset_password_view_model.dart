import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';

class ResetPasswordViewModel extends BaseViewModel with Validator {
  final _navigator = locator<NavigationService>();
  final _title = 'Reset your password';
  final _subTitle =
      'To reset your password, enter the email address you use to sign in to your workspace';
  String? _errorText;
  String _email = '';
  String _errorMesage = '';
  bool _isBusy = false;
  final _authService = locator<AuthService>();

  get title => _title;
  get subTitle => _subTitle;
  get errorText => _errorText;
  get isBusy => _isBusy;
  get errorMessage => _errorMesage;

  _setIsBusy() {
    _isBusy = !_isBusy;
    notifyListeners();
  }

  setEmail(value) {
    _email = value;
    notifyListeners();
  }

  verfiyAndGotoCheckEmail() async {
    if (!emailValidator(_email)) {
      _errorText = 'Invalid Email Address';
      notifyListeners();
      return;
    }
    _setIsBusy();

    try {
      await _authService.getResetCode(_email);
      _setIsBusy();
      _navigator.navigateTo(Routes.checkEmailView,
          arguments: {'email': _email, 'isReset': true});
    } catch (e) {
      _errorMesage = 'Something went wrong please try again';
      _setIsBusy();
    }
  }
}
