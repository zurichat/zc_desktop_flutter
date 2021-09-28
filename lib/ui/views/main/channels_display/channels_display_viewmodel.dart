import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';

class ChannelsDisplayViewModel extends BaseViewModel {
  final log = getLogger("ChannelsDisplayViewModel");
  final _channelService = locator<ChannelsService>();
  final _localStorageService = locator<LocalStorageService>();

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
    'announcements': '34',
    'team-Desktop-Client': '500',
    'games': '45',
  };

  Map<String, String> get sidebarItems => _sidebarItems;

  Future<void> getchannels() async {
    await runBusyFuture(performGetChannel());

    notifyListeners();
  }

  Future<void> performGetChannel() async {
    // List<ChannelsDataModel> channelsList = await _channelService.getChannelsList();
    List<Channel>? channelsList = await _channelService.getChannelsList("1");
    print(channelsList);
  }

  void selectChannel() {
    _channelService.setSelectedChannel(_selectedind);
  }

  User? user;
  AuthResponse? userdata;
  Future<void> fetchAndSetUserData() async {
    final authResponse = _localStorageService.getFromDisk(localAuthResponseKey);
    final resUser = AuthResponse.fromJson(jsonDecode(authResponse as String));

    print(resUser.user.token);
    notifyListeners();
  }
}
