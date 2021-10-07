import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart'
    as currentLoggedInUser;
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/zuri_api_service.dart';

const insertedOrganisationId = 'insertedId';
const userChannelId = 'userChannelId';

@LazySingleton()
class ChannelsService with ReactiveServiceMixin {
  final log = getLogger('ChannelsService');

  //Declare the services that are dependent upon
  final _localStorageService = locator<LocalStorageService>();
  final _organizationService = locator<OrganizationService>();
  final _zuriApiService = locator<ZuriApiService>();

  currentLoggedInUser.User? getCurrentLoggedInUser() {
    var userJson = _localStorageService.getFromDisk(localAuthResponseKey);
    if (userJson != null) {
      if (userJson is String) {
        return Auth.fromJson(json.decode(userJson)).user;
      }
      return null;
    }
  }

  Channel _currentChannel = Channel();

  void setChannel(Channel channel) {
    this._currentChannel = channel;
  }

  Channel getChannel() {
    return this._currentChannel;
  }

  // This gets the selected organisation_id
  String get selectedCreatedOrganisationId {
    return _localStorageService.getFromDisk(insertedOrganisationId) as String;
  }

  /// This gets the currently logged in user respose
  Auth get _auth {
    final auth = _localStorageService.getFromDisk(localAuthResponseKey);
    return Auth.fromJson(jsonDecode(auth as String));
  }

  // The function for Channels api calls can go in here
  // https://channels.zuri.chat/api/v1/61459d8e62688da5302acdb1/channels/

  /// This is used to get the list of channels on the page
  Future<List<Channel>> getChannels({String? organizationId}) async {
    log.i('getChannels called');
    final response = await _zuriApiService.fetchChannelsListUsingOrgId(
        organizationId: organizationId, token: _auth.user!.token);
    log.i(response);
    return List.from(response.map((value) => Channel.fromJson(value)));
  }

  /// This is used to create a channel on the page
  Future<void> createChannels({
    String? name,
    String? owner,
    String? description,
    required bool private,
  }) async {
    final response = await _zuriApiService.createChannelsUsingOrgId(
        sessionId: _auth.sessionID,
        insertedOrganization: insertedOrganisationId,
        name: name,
        owner: owner,
        description: description,
        private: private);
    log.i(response);
    // Getting stored AuthResponse from local storage
    String insertedId = response['_id'];
    log.i(insertedId);
    _localStorageService.saveToDisk(
      userChannelId,
      jsonEncode(insertedId),
    );
  }

  /// This is used to create a channel on the page
  Future<void> addUserToChannel({
    required String id,
    required String role_id,
    required bool is_admin,
    String? prop1,
    String? prop2,
    String? prop3,
  }) async {
    await _zuriApiService.addUserToChannel(
        _organizationService.getOrganizationId(), _currentChannel.id,
        id: id,
        role_id: role_id,
        is_admin: is_admin,
        prop1: prop1,
        prop2: prop2,
        prop3: prop3);
  }

  ///[handleRemoveUserFromChannel] takes current channel id and [member_id] or user_id
  Future<void> handleRemoveUserFromChannel({
    required String channel_id,
    required String member_id,
  }) async {
    final org_id = await _organizationService.getOrganizationId();
    await _zuriApiService.removeUserFromChannel(
        organizationId: org_id,
        channelId: channel_id,
        memberId: member_id);
  }

  Future<dynamic> sendMessage(
      {var channel_id, var senderId, var message, var org_id}) async {
    log.i(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .format(DateTime.now().toUtc())
        .toString());
    return await _zuriApiService.sendMessageToChannel(
        channel_id: channel_id,
        message: message,
        senderId: senderId,
        organization_id: org_id);
  }

  Future<List<ChannelMessage>> fetchChannelMessages() async {
    final response = await _zuriApiService.fetchChannelMessages(
        channelId: _currentChannel.id,
        organizationId: _organizationService.getOrganizationId());
    log.i(response);
return List<ChannelMessage>.from(response.map((model)=> ChannelMessage.fromJson(model)));
   
  }

  Future<String> fetchChannelSocketId() async {
    final orgId = _organizationService.getOrganizationId();
    return _zuriApiService.fetchChannelSocketId(
        organizationId: orgId,
        channelId: _currentChannel.id,
        token: _auth.user!.token);
  }
}
