import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';
// import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';

class LoginViewModel extends BaseViewModel {
  final log = getLogger("HomeViewwModel");
  // final _navigationService = locator<NavigationService>();

  String _logoUrl = 'assets/images/zc_logo2.png';
  String _logoUrlG = 'assets/images/google.png';
  String _logoUrlF = 'assets/images/facebook.png';
  String _logoUrlT = 'assets/images/twitter.png';
  double _logoWidth = 5.0;
  double _logoHeight = 5.0;
  String _title = 'Sign in';
  String _email = 'Email';
  String _password = 'Password';
  String _emailhint = 'password@gmail.com';
  String _hint = 'password';

  String get logoUrl => _logoUrl;
  String get logoUrlG => _logoUrlG;
  String get logoUrlF => _logoUrlF;
  String get logoUrlT => _logoUrlT;

  double get logoWidth => _logoWidth;

  double get logoHeight => _logoHeight;

  String get emailhint => _emailhint;
  String get title => _title;
  String get email => _email;
  String get password => _password;
  String get hint => _hint;
}

// _buildPasswordTF(),
// _buildForgotPasswordBtn(),
// _buildRememberMeCheckbox(),
// _buildLoginBtn(),
// _buildSignInWithText(),
// _buildSocialBtnRow(),
// _buildSignupBtn(),
