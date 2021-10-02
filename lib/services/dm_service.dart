import 'dart:convert';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/model/app_models.dart'
    as currentLoggedInUser;
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/zuri_api_service.dart';

class DMService {
  final log = getLogger("DMService");
  final _zuriApiService = locator<ZuriApiService>();
  DummyUser _user = DummyUser(name: "");
  final _localStorageService = locator<LocalStorageService>();

  void setUser(DummyUser user) {
    this._user = user;
  }

  Future<DummyUser> getUser() async {
    await Future.delayed(Duration(seconds: 2));
    return this._user;
  }

  currentLoggedInUser.User? getCurrentLoggedInUser() {
    var userJson = _localStorageService.getFromDisk(localAuthResponseKey);
    if (userJson != null) {
      if (userJson is String) {
        print(userJson);
        return Auth.fromJson(json.decode(userJson)).user;
      }
      return null;
    }
  }

  Future<SendMessageResponse> sendMessage(
      var roomId, var senderId, var message) async {
    /*print(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .format(DateTime.now().toUtc())
        .toString());*/
    return await _zuriApiService.sendMessageToDM(
        roomId: roomId, senderId: senderId, message: message);
  }

  Future<String?> createRoom(
      currentLoggedInUser.User currentUser, DummyUser user) async {
    return await _zuriApiService.createRoom(
        currentUser: currentUser, user: user);
  }

  Future<void> getRoomInfo(var roomId) async {
    await _zuriApiService.getRoomInfo(roomId: roomId);
  }

  Future<SendMessageResponse> fetchRoomMessages(var roomId) async {
    return await _zuriApiService.fetchRoomMessages(roomId: roomId);
  }

  Future<void> markMessageAsRead(var messageId) async {
    await _zuriApiService.markMessageAsRead(messageId);
  }
}
