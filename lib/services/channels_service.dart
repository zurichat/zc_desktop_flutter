import 'dart:convert';

import 'package:intl/intl.dart';
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
class ChannelsService {
  final log = getLogger('ChannelsApiService');

  //Declare the services that are dependent upon
  final _localStorageService = locator<LocalStorageService>();
  final _organizationService = locator<OrganizationService>();
  final _zuriApiService = locator<ZuriApiService>();
  List<Channel> channelsList = [];

  currentLoggedInUser.User? getCurrentLoggedInUser() {
    var userJson = _localStorageService.getFromDisk(localAuthResponseKey);
    if (userJson != null) {
      if (userJson is String) {
        return Auth.fromJson(json.decode(userJson)).user;
      }
      return null;
    }
  }

  Channel? _currentChannel =
      Channel(id: "", private: false, name: "", description: "", owner: "");

  List<Channel> _channels = [
    Channel(
        id: "1",
        name: "General",
        owner: "Mark",
        description: "",
        private: false),
    Channel(
        id: "2",
        name: "Announcements",
        owner: "Mark",
        description: "",
        private: false),
    Channel(
        id: "3",
        name: "team-zuri-desktop-client",
        owner: "Mark",
        description: "",
        private: false),
    Channel(
        id: "4",
        name: "stage 9",
        owner: "Mark",
        description: "",
        private: false),
    Channel(
        id: "5", name: "games", owner: "Mark", description: "", private: false),
  ];

  void setChannel(Channel channel) {
    this._currentChannel = channel;
  }

  void setSelectedChannel(int? index) {
    _currentChannel = channelsList.elementAt(index ?? 0);
  }

  Channel getChannel() {
    return this._currentChannel!;
  }

  // This gets the selected organisation_id
  String get selectedOrganisationId {
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
  Future<List<Channel>> getChannelsList({String? organizationId}) async {
    return await _zuriApiService.fetchChannelsListUsingOrgId(
        organizationId: organizationId, token: _auth.user!.token);
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
    // Getting stored AuthResponse from local storage
    String insertedId = response['_id'];
    print(insertedId);
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
    final orgId = await _organizationService.getOrganizationId();
    await _zuriApiService.addUserToChannel(orgId, _currentChannel!.id,
        id: id,
        role_id: role_id,
        is_admin: is_admin,
        prop1: prop1,
        prop2: prop2,
        prop3: prop3);
    log.i(orgId);
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
    print(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .format(DateTime.now().toUtc())
        .toString());
    return await _zuriApiService.sendMessageToChannel(
        channel_id: channel_id,
        message: message,
        senderId: senderId,
        organization_id: org_id);
  }

  Future<List<ChannelMessage>> fetchChannelMessages(
      {var org_id, var channel_id}) async {
    return await _zuriApiService.fetchChannelMessages(
        channelId: channel_id, organizationId: org_id);
  }

  Future<String> fetchChannelSocketId() async {
    final orgId = _organizationService.getOrganizationId();
    return _zuriApiService.fetchChannelSocketId(
        organizationId: orgId,
        channelId: _currentChannel!.id!,
        token: _auth.user!.token);
  }
}
