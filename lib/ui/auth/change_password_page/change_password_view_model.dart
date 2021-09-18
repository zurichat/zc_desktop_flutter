import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';

class ChangePasswordViewModel extends BaseViewModel with Validator{
  final _navigationService = locator<NavigationService>();
  bool _showModelSheet = false;
  bool _isNotPasswordVisible = true;
  String? _confirmErrorMsg, _passwordMsg; 
  String _password = '';
  bool _isError = false;
  String _confirmPassword = '';
  String _errorImage = 'assets/images/failed.svg';
  String _successImage = 'assets/images/success.svg';
  String _errorTitle = 'Password Reset failed';
  String _errorSubtitle = 'Your password reset failed! Give it another shot!';
  String _successTitle = 'Password Reset successful';
  String _successSubtitle = 'Your password reset was successful! You can now proceed to Login!';


  get errorImage => _errorImage;
  get errorTitle => _errorTitle;
  get errorSubtiltle => _errorSubtitle;
  get successImage => _successImage;
  get successTitle => _successTitle;
  get successSubtitle => _successSubtitle;

  final _logoUrl = 'assets/images/zc_logo.svg';

  get logoUrl => _logoUrl;
  get showModelSheet => _showModelSheet;
  get isPasswordVisible => _isNotPasswordVisible;
  get confirmErrorMsg => _confirmErrorMsg;
  get passwordMsg => _passwordMsg;
  get isError => _isError;

  setIsError() {
    _isError = !_isError;
    notifyListeners();
  }

  setIsPasswordVisible() {
    _isNotPasswordVisible = !_isNotPasswordVisible;
    notifyListeners();
  }

  setPassword(value) {
    _password = value;
    notifyListeners();
  }
  setConfirmPassword(value) {
    _password = value;
    notifyListeners();
  }

  setShowModel() {
    _showModelSheet = !_showModelSheet;
    notifyListeners();
  }


  changePassword() async {
    bool passwordCheck = passwordValidator(_password);
    bool confirmPasswordCheck = confirmPasswordValidator(_password, _confirmPassword);

    if(!passwordCheck && !confirmPasswordCheck) {
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
      return;
    }

    showModelSheet();
    notifyListeners();
  }

  gotoLogin(){
    _navigationService.navigateTo(Routes.loginView);
  }
}