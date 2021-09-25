import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';

class CheckEmailViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _auth = locator<AuthService>();
  final _resetTitle = 'Check your email for code';
  final _confirmTitle = 'Next, confirm your email address';
  bool _isBusy = false;
  String _otp0 = '';
  String _otp1 = '';
  String _otp2 = '';
  String _otp3 = '';
  String _otp4 = '';
  String _otp5 = '';
  String _errorMsg = '';
  final _focusNode0 = FocusNode();
  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNode3 = FocusNode();
  final _focusNode4 = FocusNode();
  final _focusNode5 = FocusNode();

  get focusNode0 => _focusNode0;
  get focusNode1 => _focusNode1;
  get focusNode2 => _focusNode2;
  get focusNode3 => _focusNode3;
  get focusNode4 => _focusNode4;
  get focusNode5 => _focusNode5;
  get isBusy => _isBusy;
  get errorMsg => _errorMsg;

  get resetTitle => _resetTitle;
  get confirmTitle => _confirmTitle;
  void _setIsBusy() {
    _isBusy = !_isBusy;
    notifyListeners();
  }

  void setOtp0(value,){
    _otp0 = value;
    if(_otp0.length == 1) {
      _focusNode1.requestFocus();
    } else {
      _focusNode0.requestFocus();
    }
    notifyListeners();
  }

  void setOtp1(value, ){
    _otp1 = value;
    if(_otp1.length == 1) {
      _focusNode2.requestFocus();
    } else {
      _focusNode1.requestFocus();
    }
    notifyListeners();
  }

  void setOtp2(value, ){
    _otp2 = value;
    if(_otp2.length == 1) {
      _focusNode3.requestFocus();
    } else {
      _focusNode2.requestFocus();
    }
    notifyListeners();
  }

  void setOtp3(value,){
    _otp3 = value;
    if(_otp3.length == 1) {
      _focusNode4.requestFocus();
    } else {
      _focusNode3.requestFocus();
    }
    notifyListeners();
  }

  void setOtp4(value,){
    _otp4 = value;
    if(_otp4.length == 1) {
     _focusNode5.requestFocus();
    } else {
      _focusNode4.requestFocus();
    }
    notifyListeners();
  }
  void setOtp5(value, bool isReset) async{
    _otp5 = value;
    String otp = '$_otp0$_otp1$_otp2$_otp3$_otp4$_otp5';
    if(_otp5.length == 1) {
      _focusNode5.unfocus();
    }
    await Future.delayed(Duration(milliseconds: 10));
    if(otp.length == 6) {
      _setIsBusy();
      try {
        if(!isReset){
          await _auth.confirmEmail(otp);
        } else {
          await _auth.confirmResetCode(otp);
        }
        _navigator.navigateTo(isReset ? Routes.changePasswordView : Routes.successView);
      } catch (e) {
        _errorMsg = 'Invalid ${isReset? 'reset' : 'confirmation'} code';
        _setIsBusy();
        return;
      }
      
    }
    notifyListeners();
  }
  @override
  void dispose() {
    _focusNode0.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    super.dispose();
  }

} 