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
  final log = getLogger('DMService');
  final _zuriApiService = locator<ZuriApiService>();
  Users _user = Users(name: '');
  currentLoggedInUser.User? _currentLoggedInUser;
  final _localStorageService = locator<LocalStorageService>();

  void setUser(Users user) {
    this._user = user;
  }

  Future<Users> getUser() async {
    await Future.delayed(Duration(seconds: 2));
    return this._user;
  }

  currentLoggedInUser.User? getCurrentLoggedInUser() {
    var userJson = _localStorageService.getFromDisk(localAuthResponseKey);
    if (userJson != null) {
      if (userJson is String) {
        log.i(userJson);
        _currentLoggedInUser = Auth.fromJson(json.decode(userJson)).user;
        return _currentLoggedInUser;
      }
      return null;
    }
  }

  Future<SendMessageResponse> sendMessage(
      var roomId, var senderId, var message) async {
    final response = await _zuriApiService.sendMessageToDM(
        roomId: roomId, senderId: senderId, message: message);
    log.i(response);
    return SendMessageResponse.fromJson(response);
  }

  Future<String?> createRoom(
      currentLoggedInUser.User? currentUser, Users? user) async {
    final response = await _zuriApiService.createRoom(
        currentUser: currentUser,
        user: user,
        orgId: getCurrentLoggedInUser()!.id);
    log.i(response);
    return CreateRoomResponse.fromJson(response).roomId;
  }

  Future<void> getRoomInfo(var roomId) async {
    final response = await _zuriApiService.getRoomInfo(roomId: roomId);
    log.i(response);
    var res = RoomInfoResponse.fromJson(response).numberOfUsers;
    log.i(res);
  }

  Future<List<DMRoomsResponse>> getDMs(var orgId) async {
    final response = await _zuriApiService.fetchDMs(
        orgId: orgId, userId: getCurrentLoggedInUser()!.id);
    log.i('dm is back with: ');
    log.i(response);
    return List<DMRoomsResponse>.from(
        response.map((model) => DMRoomsResponse.fromJson(model)));
  }

  Future<List<Results>> fetchRoomMessages(var roomId) async {
    final response = await _zuriApiService.fetchRoomMessages(roomId: roomId);
    log.i(response);
    return MessagesResponse.fromJson(response).results;
  }

  Future<void> markMessageAsRead(var messageId) async {
    final response = await _zuriApiService.markMessageAsRead(messageId);
    log.i(response);
    var res = MarkMessageAsReadResponse.fromJson(response).read;
    log.i(res);
  }
}
