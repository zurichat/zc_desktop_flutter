import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';

class ChannelsListViewModel extends BaseViewModel {
  final log = getLogger('ChannelsDisplayViewModel');
  final _channelService = locator<ChannelsService>();
  final _organizationService = locator<OrganizationService>();
  final _localStorageService = locator<LocalStorageService>();



  bool _isChannelHover = false;
  int? _selectedind;

  var _searchChannel = '';

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
    'team-falcons': '34',
    'team-desktop': '500',
    'team-test': '45',
    'annoucements': '105',
    'general': '72',
    'team-zuri': '87'
  };

  Map<String, String> get sidebarItems => _sidebarItems;

  Future<void> getchannels() async {
    await runBusyFuture(performGetChannel());

    notifyListeners();
  }

  Future<void> performGetChannel() async {
    // List<ChannelsDataModel> channelsList = await _channelService.getChannelsList();
    // ignore: unused_local_variable
    List<Channel>? channelsList = await _channelService.getChannels(
        organizationId: _organizationService.getOrganizationId());
  }

  User? user;
  AuthResponse? userdata;
  Future<void> fetchAndSetUserData() async {
    final authResponse = _localStorageService.getFromDisk(localAuthResponseKey);
    // ignore: unused_local_variable
    final resUser = AuthResponse.fromJson(jsonDecode(authResponse as String));
    notifyListeners();
  }
}
