import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:zc_desktop_flutter/app/app.logger.dart';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';

class SignUpViewModel extends BaseViewModel {
  final log = getLogger("SignUpViewModel");

  final _navigationService = locator<NavigationService>();
  final _auth = locator<AuthService>();

  String _logoUrl = "assets/images/zc_icon.svg";
  double _logoWidth = 12.0;
  double _logoHeight = 12.0;
  String _title = 'ZURI';
  String _subtitle = 'Create Account';
  String _password = '';
  String _email = '';
  String _fname = '';
  String _lname = '';
  String _username = '';
  String _phone = '';

  bool _passwordVisibility = true;
  String _policy =
      "By signing up, you agree that you have accepted our User Notice \nand Privacy Policy";

  String get logoUrl => _logoUrl;
  double get logoWidth => _logoWidth;
  double get logoHeight => _logoHeight;
  String get title => _title;
  String get subtitle => _subtitle;
  String get policy => _policy;
  String get password => _password;

  bool get passwordVisibily => _passwordVisibility;

  void setPasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  void goToLogin() {
    _navigationService.navigateTo(Routes.loginView);
    notifyListeners();
  }

  void goToHome() {
    _navigationService.navigateTo(Routes.homeView);
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setFname(String fname) {
    _fname = fname;
    notifyListeners();
  }

  void setLname(String lname) {
    _lname = lname;
    notifyListeners();
  }

  Future<void> validateAndSignUP(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    try {
      await _auth.signUpWithCred(
          fname: _fname,
          lname: _lname,
          username: _username,
          password: _password,
          tel: _phone,
          email: _email);
    } catch (e) {
      return;
    }
    goToLogin();
    notifyListeners();
  }
}
