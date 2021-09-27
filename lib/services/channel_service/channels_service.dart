import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/channels/channels_datamodel.dart';
import 'package:zc_desktop_flutter/services/organization_service/organization_service.dart';
import '../../app/app.locator.dart';
import '../../models/auth_response.dart';
import '../api/api_service.dart';
import '../local_storage/local_storage_service.dart';
import '../authentication/auth_service.dart';
import 'package:zc_desktop_flutter/models/user.dart' as currentLoggedInUser;

const insertedOrganisationId = 'insertedId';
const insertedOrganisation = '614679ee1a5607b13c00bcb7';
const userChannelId = 'userChannelId';
const insertedChannel = '614679ee1a5607b13c00bcb7';

@LazySingleton()
class ChannelsService {
  final log = getLogger('ChannelsApiService');

  //Declare the services that are dependent upon
  final _localStorageService = locator<LocalStorageService>();
  final _organizationService = locator<OrganizationService>();

  final _apiService = locator<ApiService>();
  List<Channel> channelsList = [];

  currentLoggedInUser.User? getCurrentLoggedInUser() {
    var userJson = _localStorageService.getFromDisk(localAuthResponseKey);
    if (userJson != null) {
      if (userJson is String) {
        print(userJson);
        return AuthResponse.fromMap(json.decode(userJson)).user;
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

    channelsList = List.from(
      response.map((map) => Channel.fromMap(map)).toList(),
    );
    return channelsList;
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
      headers: {'Authorization': 'Bearer ${_authResponse.sessionID}'},
    );

    String insertedId = response['_id'];
    print(insertedId);
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
    var res = await _apiService.post(
      _apiService.apiConstants.getuserChannelUri(
          _organizationService.getOrganizationId(), _currentChannel!.id ?? '0'),
      body: {
        "_id": id,
        "role_id": role_id,
        "is_admin": is_admin,
        "notifications": {
          "additionalProp1": prop1,
          "additionalProp2": prop2,
          "additionalProp3": prop3
        },
      },
      //headers: {'Authorization': 'Bearer ${_authResponse.user.token}'},
    );
    print(res);
  }

  Future<dynamic> sendMessage(
      var channel_id, var senderId, var message, var org_id) async {
    print(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .format(DateTime.now().toUtc())
        .toString());
    final response = await _apiService.post(
        _apiService.apiConstants.channelSendMessage(_currentChannel!.id ?? '0',
            _organizationService.getOrganizationId()),
        body: {
          "user_id": senderId,
          "content": message,
          "files": [],
          "event": {}
        });

    return response;
  }

  Future<List<ChannelMessage>> fetchChannelMessages(
      var org_id, var channel_id) async {
    final response = await _apiService.get(_apiService.apiConstants
        .channelFetchMessages(_currentChannel!.id ?? '0',
            _organizationService.getOrganizationId()));
    print(response);
    try {
      return ChannelMessagesResponse.fromJson(response).data;
    } catch (on, stacktrace) {
      print(stacktrace);
      return [];
    }
  }

  Future<String> getChannelSocketId() async {
    final orgId = _organizationService.getOrganizationId();

    String socketName = '';

    try {
      final response = await _apiService.get(
        _apiService.apiConstants.getChannelSocketId(_currentChannel!.id ?? '0',
            _organizationService.getOrganizationId()),
        headers: {'Authorization': 'Bearer ${_authResponse.user.token}'},
      );
      print(response);
      socketName = response['socket_name'] ?? '';
      log.i(socketName);
    } on Exception catch (e) {
      log.e(e.toString());
      return 'error';
    }
    print('found socket name ');
    print(socketName);

    return socketName;
  }
}
