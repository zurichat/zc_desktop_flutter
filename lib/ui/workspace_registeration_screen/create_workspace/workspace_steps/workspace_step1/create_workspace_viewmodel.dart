import 'package:stacked/stacked.dart';

class CreateWorkspaceViewModel extends BaseViewModel {
  String _logoUrl = "assets/images/zc_logo2.png";
  String _signInText = "First, enter your email ";
  String _signInText2 = "We suggest using the email address you use at work. ";
  String _emailHint = "name@workemail.com";
  String _btnText = "Continue";
  String get policy => _policy;

  String _policy = "It’s okay to send me emails about Zuri.";
  String _signInPolicySubtext =
      "By continuing, you agree that you have accepted our User \nNotice and Privacy Policy and Cookie Policy.";

  String _privacy = "Privacy & Terms";
  String _contactUs = "Contact us";
  String _changeRegion = "Change Region";

  String get signInText => _signInText;
  String get signInText2 => _signInText2;

  String get logoUrl => _logoUrl;

  String get signInPolicySubtext => _signInPolicySubtext;

  String get emailHint => _emailHint;

  String get btnText => _btnText;

  String get privacy => _privacy;

  String get contactUs => _contactUs;

  String get changeRegion => _changeRegion;
}
