
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';

class ForgotPasswordViewModel extends BaseViewModel{
  String _logoUrl ="assets/images/zc_logo2.png";
  String _signInText = "Sign in without your password";
  String _signInSubtext = "We'll email you a link for password-free sign in to your workspaces";
  String _emailText = "Email";
  String _emailHint = "name@work-email.com";
  String _btnText = "Continue";
  String _resetBtnText = "Reset your password";
  String _orText = "OR";

  String get orText => _orText;


  String get signInText => _signInText;

  String get logoUrl => _logoUrl;
  final _navigationService = locator<NavigationService>();

  String get signInSubtext => _signInSubtext;

  String get emailText => _emailText;

  String get emailHint => _emailHint;

  String get btnText => _btnText;

  String get resetBtnText => _resetBtnText;

  void goToCheckEmailView() {
    
    notifyListeners();
  }

  void goToPasswordRest() {
    //_navigationService.navigateTo(Routes.resetPasswordView);
    notifyListeners();
  }
}