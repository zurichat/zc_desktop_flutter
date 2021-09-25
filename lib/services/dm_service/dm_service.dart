import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/model/app_models.dart' as currentLoggedInUser;
import 'package:zc_desktop_flutter/services/api/api_service.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';

class DMService {
  final log = getLogger("DMService");
  DummyUser _user = DummyUser(name: "");
  final _apiService = locator<ApiService>();
  final _localStorageService = locator<LocalStorageService>();

  void setUser(DummyUser user) {
    this._user = user;
  }

  Future<DummyUser> getUser() async {
    await Future.delayed(Duration(seconds: 2));
    log.i(_user.name);
    return _user;
  }

  currentLoggedInUser.User? getCurrentLoggedInUser() {
    var userJson = _localStorageService.getFromDisk(localAuthResponseKey);
    if (userJson != null) {
      if (userJson is String) {
        print(userJson);
        return AuthResponse.fromJson(json.decode(userJson)).user;
      }
      return null;
    }
  }

  Future<SendMessageResponse> sendMessage(
      var roomId, var senderId, var message) async {
    print(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .format(DateTime.now().toUtc())
        .toString());
    final response = await _apiService
        .post(_apiService.apiConstants.dmSendMessage(roomId), body: {
      "sender_id": senderId,
      "room_id": roomId,
      "message": message,
      "media": [],
      "read": false,
      "pinned": false,
      "saved_by": [],
      "threads": [],
      "reactions": [],
      "created_at": DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
          .format(DateTime.now())
          .toString(),
    });

    return SendMessageResponse.fromJson(response);
  }

  Future<String?> createRoom(
      currentLoggedInUser.User currentUser, DummyUser user) async {
    final response = await _apiService.post(
      _apiService.apiConstants.dmCreateRoom,
      body: {
        "org_id": "1",
        "room_user_ids": [currentUser.id, user.id],
        "bookmarks": ["0"],
        "pinned": ["0"]
      },
    );
    //614ae41044a9bd81cedc08be
    return CreateRoomResponse.fromJson(response).roomId;
  }

  Future<void> getRoomInfo(var roomId) async {
    final response = await _apiService.get(
        _apiService.apiConstants.dmGetRoomInfo,
        queryParameters: {'room_id': roomId});
    var res = RoomInfoResponse.fromJson(response).numberOfUsers;
    print("number of users: ${res}");
  }

  Future<List<Results>> fetchRoomMessages(var roomId) async {
    final response = await _apiService
        .get(_apiService.apiConstants.dmFetchRoomMessages(roomId));
    try {
      return MessagesResponse.fromJson(response).results;
    } catch (on, stacktrace) {
      print(stacktrace);
      return [];
    }
  }

  Future<void> markMessageAsRead(var messageId) async {
    final response = await _apiService
        .put(_apiService.apiConstants.dmMarkMessageAsRead(messageId), body: {});
    var res = MarkMessageAsReadResponse.fromJson(response).read;
    print("message has been read: ${res}");
  }
}
