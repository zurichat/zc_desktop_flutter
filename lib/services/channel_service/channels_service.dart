import 'dart:convert';

import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/channels/channels_datamodel.dart';
import 'package:zc_desktop_flutter/models/user.dart';
import '../../app/app.locator.dart';
import '../../models/auth_response.dart';
import '../api/api_service.dart';
import '../local_storage/local_storage_service.dart';
import '../authentication/auth_service.dart';

const insertedOrganisationId = 'insertedId';
const insertedOrganisation = '614679ee1a5607b13c00bcb7';
const userChannelId = 'userChannelId';
const insertedChannel = '614679ee1a5607b13c00bcb7';

@LazySingleton()
class ChannelsService {
  final log = getLogger('ChannelsApiService');

  //Declare the services that are dependent upon
  final _localStorageService = locator<LocalStorageService>();
  final _apiService = locator<ApiService>();

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

  Future<Channel?> getChannel() async {
    await Future.delayed(Duration(seconds: 2));
    return this._currentChannel;
  }

  // This gets the selected organisation_id
  String get selectedOrganisationId {
    return _localStorageService.getFromDisk(insertedOrganisationId) as String;
  }

  /*Future<List<Channel>> getChannelsList() async {
    await Future.delayed(Duration(seconds: 2));
    return _channels;
  }*/

  /// This gets the currently logged in user respose
  AuthResponse get _authResponse {
    final authResponse = _localStorageService.getFromDisk(localAuthResponseKey);
    return AuthResponse.fromMap(jsonDecode(authResponse as String));
  }

  // The function for Channels api calls can go in here
  // https://channels.zuri.chat/api/v1/61459d8e62688da5302acdb1/channels/

  /// This is used to get the list of channels on the page
  Future<List<Channel>> getChannelsList(String? organizationId) async {
    final response = await _apiService.get(
      _apiService.apiConstants.getcreateChannelUri(organizationId!),
      headers: {'Authorization': 'Bearer ${_authResponse.user.token}'},
    );

    //log.d(response);

    return List.from(
      response.map((map) => Channel.fromMap(map)).toList(),
    );
  }

/// This is used to create a channel on the page
  Future<void> createChannels(
    String name,
    String owner,
    String description,
    bool private,
  ) async {
      // Getting stored AuthResponse from local storage
      final response = await _apiService.post(
        _apiService.apiConstants.getcreateChannelUri(insertedOrganisation),
        body: {
          "name": name,
          "owner": owner,
          "description": description,
          "private": private,
        },
        headers: {'Authorization': 'Bearer ${_authResponse.user.token}'},
      );

      String insertedId = response['data']['_id'];

      _localStorageService.saveToDisk(
      userChannelId,
      jsonEncode(insertedId),
    );

  }

  /// This is used to create a channel on the page
  Future<void> addUserChannel(
    String id,
    String role_id,
    bool is_admin,
    String prop1,
    String prop2,
    String prop3,
  ) async {
      // Getting stored AuthResponse from local storage
      await _apiService.post(
        _apiService.apiConstants.getuserChannelUri(insertedOrganisation, insertedChannel),
        body: {
          "_id": id,
          "owner": role_id,
          "description": is_admin,
          "notifications": {
            "additionalProp1": prop1,
            "additionalProp2": prop2,
            "additionalProp3": prop3
          },
        },
        headers: {'Authorization': 'Bearer ${_authResponse.user.token}'},
      );

  }

}