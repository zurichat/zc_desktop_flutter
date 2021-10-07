import 'dart:convert';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';

import 'auth_service.dart';
import 'local_storage_service.dart';

class UserService {
  final log = getLogger('UserService');
  final _localStorageService = locator<LocalStorageService>();
  /*Future<User> getUserDetails(String? id) async {
    final response =
        await _apiService.get(Uri.parse('https://api.zuri.chat/users/$id}'));
    return User.fromJson(response);
  }*/
  Auth get auth {
    final auth = _localStorageService.getFromDisk(localAuthResponseKey);
    return Auth.fromJson(jsonDecode(auth as String));
  }
}
