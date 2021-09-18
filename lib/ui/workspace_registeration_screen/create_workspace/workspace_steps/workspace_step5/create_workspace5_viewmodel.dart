import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class CreateWorkspaceViewModel5 extends BaseViewModel {
  final ScrollController controllerOne = ScrollController();
  String _logoUrl = "assets/images/zc_logo2.png";
  String _signInText1 = "Click “";
  String _signInText2 = "TB";
  String _signInText3 = "Launching Project Zuri ";
  String _signInSubtext = "Open Zuri Chat";
  String _signInText4 = "\" to launch the desktop app";
  String _signInText5 = "Not Working? You can also ";
  String _signInText6 = "use Zuri Chat in your browser";

  String get signInText4 => _signInText4;
  String get signInText1 => _signInText1;
  String get logoUrl => _logoUrl;
  String get signInText2 => _signInText2;
  String get signInText3 => _signInText3;
  String get signInText5 => _signInText5;
  String get signInText6 => _signInText6;
  String get signInSubtext => _signInSubtext;
}
