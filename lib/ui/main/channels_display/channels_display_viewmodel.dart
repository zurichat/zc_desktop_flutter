import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';

import 'package:stacked_services/stacked_services.dart';

import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/models/auth_response.dart';
import 'package:zc_desktop_flutter/models/user.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';

import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';
import 'package:zc_desktop_flutter/ui/auth/login_page/login_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChannelsDisplayViewModel extends BaseViewModel {
  final log = getLogger("ChannelsDisplayViewModel");

  String _channelText1 = 'Channel browser';
  String _channelText2 = 'Search Channel';
  String _channelText3 = '4 recommended results';
  String _channelText4 = 'Sort';
  String _channelText5 = 'Filter';
  String _channelText6 = 'channelName';
  String _channelText7 = ' Joined ';
  String _channelText8 = '34';
  String _channelText9 = ' members  ';
  String _channelText10 = 'View';
  String _channelText11 = 'Join';
  double _channelWidth = double.infinity;
  double _channelHeight = double.infinity;
  double _paddingall = 10.0;
  double _paddingTop = 1.0;
  double _paddingTop2 = 5.0;
  double _paddingLeft = 18.0;
  double _paddingRight = 15.0;
  double _paddingBottom = 5.0;
  double _paddingBottom2 = 8.0;
  double _paddingBottom3 = 2.5;
  double _paddingBottom4 = 3.0;
  bool _isChannelHover = false;
  int? _selectedind;

  var _searchChannel = '';

  String get channelText1 => _channelText1;
  String get channelText2 => _channelText2;
  String get channelText3 => _channelText3;
  String get channelText4 => _channelText4;
  String get channelText5 => _channelText5;
  String get channelText6 => _channelText6;
  String get channelText7 => _channelText7;
  String get channelText8 => _channelText8;
  String get channelText9 => _channelText9;
  String get channelText10 => _channelText10;
  String get channelText11 => _channelText11;
  double get channelWidth => _channelWidth;
  double get channelHeight => _channelHeight;
  double get paddingall => _paddingall;
  double get paddingTop => _paddingTop;
  double get paddingTop2 => _paddingTop2;
  double get paddingLeft => _paddingLeft;
  double get paddingRight => _paddingRight;
  double get paddingBottom => _paddingBottom;
  double get paddingBottom2 => _paddingBottom2;
  double get paddingBottom3 => _paddingBottom3;
  double get paddingBottom4 => _paddingBottom4;
  bool get isChannelHover => _isChannelHover;

  int? get selectedind => _selectedind;

  setIsChannelHover() {
    _isChannelHover = !_isChannelHover;
    notifyListeners();
  }

  void setIsselectedind(int val) {
    _selectedind = val;
    notifyListeners();
  }

  get searchChannel => _searchChannel;

  bool _isSwitched = false;
  bool get isSwitched => _isSwitched;

  void setIsSwitched() {
    _isSwitched = !_isSwitched;
    notifyListeners();
  }

  Map<String, String> _sidebarItems = {
    'Annoucements': '34',
    'Team-Desktop-Client': '500',
    'Games': '45',
  };

  Map<String, String> get sidebarItems => _sidebarItems;

  final _localStorageService = locator<LocalStorageService>();
  User? user;
  AuthResponse? userdata;
  Future<void> fetchAndSetUserData() async {
    final authResponse = _localStorageService.getFromDisk(localAuthResponseKey);
    final resUser = AuthResponse.fromMap(jsonDecode(authResponse as String));

  print(resUser.user.token);
  notifyListeners(); 
  }
 
}
