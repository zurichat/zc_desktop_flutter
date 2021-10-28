import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';
import 'package:zc_desktop_flutter/ui/views/auth/change_password/change_password_view.dart';

import 'change_password_view.form.dart';

class ChangePasswordViewModel extends FormViewModel with Validator {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  bool _isNotPasswordVisible = true;
  String? _confirmErrorMsg, _passwordMsg;
  bool _isError = false;
  bool _isBusy = false;
  bool _isShowDialog = false;
  get isPasswordVisible => _isNotPasswordVisible;
  get confirmErrorMsg => _confirmErrorMsg;
  get passwordMsg => _passwordMsg;
  get isError => _isError;
  get isShowDialog => _isShowDialog;
  get isBusy => _isBusy;

  final _windowsTitleBarService = locator<WindowTitleBarService>();

  /// This method sets the [title] of the [ChangePasswordView] on the title  bar
  /// it is called immediately the view comes up
  void init() async {
    await Future.delayed(Duration(milliseconds: 1));
    _windowsTitleBarService.setTitle('Zuri | Change Password');
  }

  /// sets the error state of the view
  _setIsError() {
    _isError = !_isError;
    notifyListeners();
  }

  /// set the busy state of the view
  _setIsBusy() {
    _isBusy = !_isBusy;
    notifyListeners();
  }

  /// this method sets dialog  to view
  _setIsShowDialog(bool value) async {
    _isShowDialog = value;
    notifyListeners();
  }

  /// this method sets the password field visibility
  setIsPasswordVisible() {
    _isNotPasswordVisible = !_isNotPasswordVisible;
    notifyListeners();
  }

  /// this method enables you to change your password if all criteria are met
  /// criteria include password must be same with confirm password, password must not be less
  /// than 8 characters and must include special characters
  /// then takes you back to login view
  Future<void> changePassword() async {
    _setIsShowDialog(false);
    bool passwordCheck = passwordValidator(passwordValue!);
    bool confirmPasswordCheck =
        confirmPasswordValidator(passwordValue!, confirmPasswordValue!);
    if (!passwordCheck || !confirmPasswordCheck) {
      if (!passwordCheck) {
        _passwordMsg = ChangePasswordErrorMessage;
      } else {
        _passwordMsg = null;
      }

      if (!confirmPasswordCheck) {
        _confirmErrorMsg = ConfirmPasswordErrorMessage;
      } else {
        _confirmErrorMsg = null;
      }
      notifyListeners();
      return;
    }
    try {
      _setIsBusy();
      await _authService.updateUserPassword(passwordValue!);
      _setIsBusy();
    } catch (e) {
      _setIsBusy();
      _setIsError();
    }
    _setIsShowDialog(true);
  }

  /// this method navigates to the login view
  gotoLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }

  /// This method is meant to  be override while using the FormViewModel but since there's
  /// absolutely no need for the method inside this view model so it remain an empty method
  @override
  void setFormStatus() {}
}
