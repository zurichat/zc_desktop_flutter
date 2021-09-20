import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';

const testLocalKey = 'TESTKEY';

class LoginViewModel extends BaseViewModel with Validator {
  final log = getLogger("LoginViewModel");
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<LocalStorageService>();
  final _auth = locator<AuthService>();
  String _logoUrl = 'assets/images/zc_logo2.png';
  String _logoUrlG = 'assets/images/google.png';
  String _logoUrlF = 'assets/images/facebook.png';
  String _logoUrlT = 'assets/images/twitter.png';
  String _errorMessage = '';
  bool _initial = false;
  String? _emailErrorText;
  String? _passwordErrorText;
  double _logoWidth = 5.0;
  double _logoHeight = 5.0;
  String _signIn = 'Sign in';
  String _email = '';
  String _password = '';
  String _emailhint = 'someone@gmail.com';
  String _hint = 'password';
  bool _passwordVisibility = true;
  bool _isBusy = false;
  bool _isError = false;

  String get logoUrl => _logoUrl;
  String get logoUrlG => _logoUrlG;
  String get errorMessage => _errorMessage;
  String? get emailErrorText => _emailErrorText;
  String? get passwordErrorText => _passwordErrorText;
  bool get passwordVisibily => _passwordVisibility;
  bool get isBusy => _isBusy;
  bool get isError => _isError;
  get email => _email;
  get password => _password;

  String get signIn => _signIn;
  String get logoUrlF => _logoUrlF;
  String get logoUrlT => _logoUrlT;

  double get logoWidth => _logoWidth;

  double get logoHeight => _logoHeight;

  String get emailhint => _emailhint;

  String get hint => _hint;

  String emailText = '';
  String passwordText = '';

  void emailChanged(String? value) {
    emailText = value!;
  }

  void setErrorMessage(String msg) {
    _errorMessage = msg;
    notifyListeners();
  }

  void setInitial() {
    _initial = true;
    notifyListeners();
  }

  void _setIsError() {
    _isError = true;
    notifyListeners();
  }

  void setPasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  void _goToHome() {
    if (emailText.isEmpty) {
      _navigationService.navigateTo(Routes.workspaceView);
      return;
    }
    _storageService.saveToDisk(testLocalKey, emailText);

    _navigationService.navigateTo(Routes.workspaceView);
  }

  void goToSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
    notifyListeners();
  }


  void gotoForgetpassword() {
    _navigationService.navigateTo(Routes.resetPasswordView);
    notifyListeners();
  }

  void _setIsBusy() {
    _isBusy = !_isBusy;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<void> validateAndLogin() async {
    notifyListeners();
    if (!(emailValidator(_email)) || _password.length <= 0) {
      if (!(emailValidator(_email))) {
        _emailErrorText = 'Invalid Email';
      } else {
        _emailErrorText = null;
      }
      if (_password.length <= 0) {
        _passwordErrorText = 'Password cannnot be empty';
      } else {
        _passwordErrorText = null;
      }
      notifyListeners();
      return;
    }

    try {
      _setIsBusy();
      _emailErrorText = null;
      await _auth.loginWithCred(_email, _password);
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        setErrorMessage(
            'Somthing went wrong!!! Please check your internet and try again');
      } else {
        setErrorMessage('Invalid Email OR Password');
      }
      _setIsError();
      _setIsBusy();
      return;
    }

    _goToHome();
    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
    try {
      if(!_initial) {
        await _auth.checkToken();
        setInitial();
        _goToHome();
      }
      return;
    } catch (e) {
      _navigationService.navigateTo(Routes.loginView);
    }
  }

}
