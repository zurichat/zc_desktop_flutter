import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class CreateWorkspaceViewModel2 extends BaseViewModel {
  final ScrollController controllerOne = ScrollController();
  String _signInPgNum = "Stage 1 of 3 ";
  String _signInText2 = "What’s the name of your \ncompany or team? ";
  String _emailHint = "Ex: Paystack internatonal ";
  String _btnText = "Continue";
  String get policy => _policy;

  String _policy = "It’s okay to send me emails about Zuri.";
  String _signInSubtext =
      "This will be the name of your slack workspace - choose somethiong that your team will recognise";

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
