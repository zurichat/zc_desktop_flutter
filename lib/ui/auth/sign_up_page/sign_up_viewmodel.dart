import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:zc_desktop_flutter/app/app.logger.dart';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';

class SignUpViewModel extends BaseViewModel with Validator {
  final log = getLogger("SignUpViewModel");

  final _navigationService = locator<NavigationService>();
  final _auth = locator<AuthService>();

  String _logoUrl = "assets/images/zc_icon.svg";
  double _logoWidth = 12.0;
  double _logoHeight = 12.0;
  String _title = 'ZURI';
  String _subtitle = 'Create Account';
  String _errorMessage = '';
  //TextController Error
  String? _phoneError;
  String? _passwordError;
  String? _emailError;
  String? _lnameError;
  String? _fnameError;
  String? _usernameError;
  String? _confirmPasswordError;

  //TextController Error getters

  get phoneError => _phoneError;
  get passwordError => _passwordError;
  get emailError => _emailError;
  get lnameError => _lnameError;
  get fnameError => _fnameError;
  get usernameError => _usernameError;
  get confirmPasswordError => _confirmPasswordError;

  var _password = '';
  var _email = '';
  var _fname = '';
  var _lname = '';
  var _username = '';
  var _phone = '';
  var _confirmPassword = '';

  bool _isBusy = false;
  bool _isSignUpSuccessful = false;
  bool _isSignUpNotSuccessful = false;

  bool _passwordVisibility = true;
  bool get isBusy => _isBusy;
  bool get isSignUpSuccessful => _isSignUpSuccessful;
  bool get isSignUpNotSuccessful => _isSignUpNotSuccessful;

  String _policy =
      "By signing up, you agree that you have accepted our User Notice \nand Privacy Policy";

  String get logoUrl => _logoUrl;
  String get errorMessage => _errorMessage;
  double get logoWidth => _logoWidth;
  double get logoHeight => _logoHeight;
  String get title => _title;
  String get subtitle => _subtitle;
  String get policy => _policy;

  get password => _password;
  get username => _username;
  get lname => _lname;
  get fname => _fname;
  get phone => _phone;
  get email => _email;
  get confirmPassword => _confirmPassword;

  bool get passwordVisibily => _passwordVisibility;

  void setPasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
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

  void setPhone(String value) {
    _phone = value;
    notifyListeners();
  }

  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  void setLname(String value) {
    _lname = value;
    notifyListeners();
  }

  void setFname(String value) {
    _fname = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  void goToLogin() {
    _navigationService.navigateTo(Routes.loginView);
    notifyListeners();
  }

  void _setIsBusy() {
    _isBusy = !_isBusy;
    notifyListeners();
  }

  void _setIsSignUpSuccessful() {
    _isSignUpSuccessful = !isSignUpSuccessful;
    notifyListeners();
  }

  void _setIsSignUpNotSuccessful() {
    _isSignUpNotSuccessful = !_isSignUpNotSuccessful;
    notifyListeners();
  }

  void goToHome() {
    _navigationService.navigateTo(Routes.homeView);
    notifyListeners();
  }

  void setErrorMessage(String msg) {
    _errorMessage = msg;
    notifyListeners();
  }

  Future<void> validateAndSignUP() async {
    bool isFnameValid = nameValidator(_fname);
    bool isLnameValid = nameValidator(_lname);
    bool isUsernameValid = nameValidator(_username);
    bool isPhoneValid = phoneValidator(_phone);
    bool isPasswordValid = passwordValidator(_password);
    bool isEmailValid = emailValidator(_email);
    bool isConfirmPasswordValid =
        confirmPasswordValidator(_password, _confirmPassword);

    if (!isFnameValid ||
        !isLnameValid ||
        !isUsernameValid ||
        !isPhoneValid ||
        !isPasswordValid ||
        !isEmailValid ||
        !isConfirmPasswordValid) {
      if (!isFnameValid) {
        _fnameError = 'First Name must be at least 3 characters long';
      } else {
        _fnameError = null;
      }
      if (!isLnameValid) {
        _lnameError = 'First Name must be at least 3 characters long';
      } else {
        _lnameError = null;
      }
      if (!isPhoneValid) {
        _phoneError = 'Phone must be at least 11 characters';
      } else {
        _phoneError = null;
      }
      if (!isUsernameValid) {
        _usernameError = 'Username must be at least 3 characters long';
      } else {
        _usernameError = null;
      }
      if (!isPasswordValid) {
        _passwordError =
            '''Invalid Password. Password should consist of atleast:
                       One Uppercase 
                       One Lowercase
                       One Character
                       And must be at least 8 characters long ''';
      } else {
        _passwordError = null;
      }
      if (!isEmailValid) {
        _emailError = 'Invalid Email';
      } else {
        _emailError = null;
      }
      if (!isConfirmPasswordValid) {
        _confirmPasswordError = 'Password does not match';
      } else {
        _confirmPasswordError = null;
      }
      notifyListeners();
      return;
    }
    try {
      _setIsBusy();
      await _auth.signUpWithCred(
          fname: _fname,
          lname: _lname,
          username: _username,
          password: _password,
          tel: _phone,
          email: _email);
      _setIsSignUpSuccessful();
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        setErrorMessage(
            'Somthing went wrong!!! Please check your internet and try again');
      } else {
        setErrorMessage('Email Already In Use');
      }
      _setIsBusy();
      _setIsSignUpNotSuccessful();
      return;
    }
    await Future.delayed(
      Duration(milliseconds: 5000),
    );
    goToLogin();
    notifyListeners();
  }
}
