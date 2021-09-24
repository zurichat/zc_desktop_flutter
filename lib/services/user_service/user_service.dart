import 'dart:convert';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/models/auth_response.dart';
import 'package:zc_desktop_flutter/models/user.dart';
import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';


class UserService {
  final _localStorageService = locator<LocalStorageService>();
  User? user;
  AuthResponse? authResponse;

  Future<void> fetchAndSetUserData () async {
    try {
      authResponse = AuthResponse.fromMap(
        json.decode(_localStorageService.getFromDisk('localAuthResponse').toString()));
      user = authResponse!.user;
    } catch (e) {
     throw e;
    }
  }
  
}