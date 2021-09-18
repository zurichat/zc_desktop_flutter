import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class CreateWorkspaceViewModel3 extends BaseViewModel {
  final ScrollController controllerOne = ScrollController();
  String _signInPgNum = "Stage 2 of 3 ";
  String _signInText2 = "What is your team working on \nright now? ";
  String _emailHint = "Ex: Q1 Budget, Project Alpha ";
  String _btnText = "Continue";
  String get policy => _policy;

  String _policy = "It’s okay to send me emails about Zuri.";
  String _signInSubtext =
      "This could be anything: a project, a campaign, event, or the deal you are trying to close";

  String _privacy = "Privacy & Terms";
  String _contactUs = "Contact us";
  String _changeRegion = "Change Region";

  String get signInPgNum => _signInPgNum;
  String get signInText2 => _signInText2;

  String get signInSubtext => _signInSubtext;

  String get emailHint => _emailHint;

  String get btnText => _btnText;

  String get privacy => _privacy;

  String get contactUs => _contactUs;

  String get changeRegion => _changeRegion;
}
