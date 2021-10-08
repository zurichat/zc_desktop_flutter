import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';

class ChangePasswordViewModel extends BaseViewModel with Validator{
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

  _setIsError() {
    _isError = !_isError;
    notifyListeners();
  }

  _setIsBusy(){
    _isBusy = !_isBusy;
    notifyListeners();
  }

  _setIsShowDialog(bool value) async {
    _isShowDialog = value;
    notifyListeners();
  }

  setIsPasswordVisible() {
    _isNotPasswordVisible = !_isNotPasswordVisible;
    notifyListeners();
  }


  Future<void> changePassword(String password, String confirmPassword) async {
    _setIsShowDialog(false);
    bool passwordCheck = passwordValidator(password);
    bool confirmPasswordCheck =
        confirmPasswordValidator(password, confirmPassword);
    if(!passwordCheck || !confirmPasswordCheck) {
      if(!passwordCheck) {
        _passwordMsg = 
        '''Invalid Password. Password should consist of atleast:
                       One Uppercase 
                       One Lowercase
                       One Character
                       And must be at least 8 characters long ''';
      }else {
        _passwordMsg = null;
      }

      if(!confirmPasswordCheck) {
        _confirmErrorMsg = 'Password does not match';
      } else {
        _confirmErrorMsg = null;
      }
      notifyListeners();
      return;
    }
    try{
      _setIsBusy();
      await _authService.updateUserPassword(password);
      _setIsBusy();
    } catch (e) {
      _setIsBusy();
      _setIsError();
    }
    _setIsShowDialog(true);
  }

  gotoLogin(){
    _navigationService.navigateTo(Routes.loginView);
  }
}