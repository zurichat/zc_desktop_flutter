import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';

class CreateChannelViewModel extends BaseViewModel with Validator {

  //Declare the services that are dependent upon
  final _localStorageService = locator<LocalStorageService>();

  /// This gets the currently logged in user respose
  Auth get _auth {
    final auth = _localStorageService.getFromDisk(localAuthResponseKey);
    return Auth.fromJson(jsonDecode(auth as String));
  }

  final log = getLogger('CreateChannelViewModel');
  final _navigationService = locator<NavigationService>();
  final _channelsService = locator<ChannelsService>();
  
  int selectedChannelIndex = 0;

  List<Channel> _channels = [];

  // List<Channel> _newChannel = [
  //   Channel(
  //         id: '1',
  //         name: 'team-zuri',
  //         private: false,
  //         description: 'All about Zuri Main Channel',
  //         owner: ''),
  // ];
  
  List<Channel> get channels => _channels;

  bool _isSwitched = false;
  String _errorMessage = '';
  bool _showError = false;

  //TextController Error
  String? _channelNameError;
  String? _channelDescriptionError;

  bool _isBusy = false;
  bool _isPrivate = false;
  bool _isCreateChannelSuccessful = false;
  bool _isCreateChannelNotSuccessful = false;

  var _channelName = '';
  var _channelDescription = '';

  bool get isSwitched => _isSwitched;
  String get errorMessage => _errorMessage;
  bool get showError => _showError;

  //TextController Error getters

  bool get isPrivate => _isPrivate;
  bool get isCreateChannelSuccessful => _isCreateChannelSuccessful;
  bool get isCreateChannelNotSuccessful => _isCreateChannelNotSuccessful;

  get channelNameError => _channelNameError;
  get channelDescriptionError => _channelDescriptionError;

  get channelName => _channelName;
  get channelDescription => _channelDescription;

  void setchannelName(String value) {
    _channelName = value;
    notifyListeners();
  }

  void setchannelDescription(String value) {
    _channelDescription = value;
    notifyListeners();
  }

  void goToViewChannels() {
    _navigationService.navigateTo(Routes.organizationView);
    notifyListeners();
  }

  void _setIsBusy() {
    _isBusy = !_isBusy;
    notifyListeners();
  }

  void setIsSwitched(bool val) {
    _isSwitched = val;
    _isPrivate = val;
    notifyListeners();
  }

  void _setIsCreateChannelSuccessful() {
    _isCreateChannelSuccessful = !isCreateChannelSuccessful;
    notifyListeners();
  }

  void _setIsCreateChannelNotSuccessful() {
    _isCreateChannelNotSuccessful = !isCreateChannelNotSuccessful;
    notifyListeners();
  }

  void setErrorMessage(String msg) {
    _errorMessage = msg;
    notifyListeners();
  }

  String userDisplayName() {
    return _auth.user!.email;
  }

  void goToChannelsView({int index = 0}) {
    selectedChannelIndex = index;
    notifyListeners();
    // _channelsService.setChannel(_channels[index]);
    // _channelsService.createChannels();
    _channelsService.setChannel(_channels[index]);
    
    _navigationService.navigateTo(OrganizationViewRoutes.channelsView, id: 1);
  }

  
  Future<void> performCreateChannel(
      String name, String owner, String description, bool private, String topic, bool defaultChannel) async {

    await _channelsService.createChannels(
        name: name, owner: owner, description: description, private: private, topic: topic, defaultChannel: defaultChannel);

    _showError = true;
    notifyListeners();
  }

  Future<void> createchannels(
    String name,
    String owner,
    String description,
    bool private,
    String topic,
    bool defaultChannel,
    BuildContext context
  ) async {
    bool isChannelNameValid = nameValidator(_channelName);
    bool isChannelDescriptionValid = nameValidator(_channelDescription);

    if (!isChannelNameValid || !isChannelDescriptionValid) {
      if (!isChannelNameValid) {
        _channelNameError = 'Channel Name must be at least 3 characters long';
      } else {
        _channelNameError = null;
      }
      if (!isChannelDescriptionValid) {
        _channelDescriptionError =
            'Channel Description must be at least 3 characters long';
      } else {
        _channelDescriptionError = null;
      }

      notifyListeners();
      return;
    }

    _setIsBusy();
    // if()
    await runBusyFuture(
        performCreateChannel(name, owner, description, private, topic, defaultChannel));

    if (_showError == true) {
      setErrorMessage('An unexpected error occured!');
      _setIsBusy();
      _setIsCreateChannelNotSuccessful();
    } else {
      _setIsCreateChannelSuccessful();
      await Future.delayed(
      Duration(milliseconds: 1500),
      );
      Navigator.of(context).pop();
      // goToChannelsView();
    // _navigationService.pushNamedAndRemoveUntil(Routes.organizationView);
    }

    notifyListeners();
  }


  /// Error should be handled here. It could be displaying a toast of something else
  @override
  void onFutureError(error, Object? key) {
    log.i('Handle Error here');
    super.onFutureError(error, key);
  }
}
