import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class CreateWorkspaceViewModel4 extends BaseViewModel {
  final ScrollController controllerOne = ScrollController();
  String _signInPgNum = "Stage 3 of 3 ";
  String _signInText2 = "Who do you email most about ";
  String _signInText3 = "project-zuri? ";
  String _emailHint = "Ex: bola@gmail.com ";
  String _btnText = "Add Teammates";
  String _btnText2 = "Skip this step";
  String get policy => _policy;

  String _policy = "It’s okay to send me emails about Zuri.";
  String _signInSubtext =
      "This could be anything: a project, a campaign, event, or the deal you are trying to close";

  String _privacy = "Privacy & Terms";
  String _contactUs = "Contact us";
  String _changeRegion = "Change Region";

  String get signInPgNum => _signInPgNum;
  String get signInText2 => _signInText2;
  String get signInText3 => _signInText3;

  String get signInSubtext => _signInSubtext;

  String get emailHint => _emailHint;

  String get btnText => _btnText;
  String get btnText2 => _btnText2;

  String get privacy => _privacy;

  String get contactUs => _contactUs;

  String get changeRegion => _changeRegion;
}
