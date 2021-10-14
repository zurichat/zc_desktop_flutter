import 'dart:convert';
import 'dart:io';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/api.dart';

const userIdKey = 'userIdKey';

class UserService {
  final log = getLogger('UserService');
  final _localStorageService = locator<LocalStorageService>();
  final _api = locator<Api>();
  final _organizationService = locator<OrganizationService>();

  // This gets the currently logged in user respose
  Auth get auth {
    final auth = _localStorageService.getFromDisk(localAuthResponseKey);
    return Auth.fromJson(jsonDecode(auth as String));
  }

  String getUserId() {
    return _localStorageService.getFromDisk(userIdKey) as String;
  }

  Future<void> updateUserImage({
    String? token,
    File? img,
  }) async {
    final orgId = _organizationService.getOrganizationId();
    final memId = auth.user!.id;
    final response = await _api.UpdateUserPicture(
      organizationId: orgId,
      memberId: memId,
      token: token,
      img: img,
    );
    log.i(response);
  }

  Future<void> updateUser({
    String? token,
    String? bio,
    String? displayName,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? pronoun,
    String? timeZone,
  }) async {
    final orgId = _organizationService.getOrganizationId();
    final memId = auth.user!.id;
    final response = await _api.updateUserDetail(
      organizationId: orgId,
      memberId: memId,
      token: token ?? auth.user!.token,
      bio: bio,
      displayName: displayName,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      pronoun: pronoun,
      timeZone: timeZone,
    );
    log.i(response);
    // return response;
  }

  /// This is used to get a single user_service
  Future<Member> getmember() async {
    final orgId = _organizationService.getOrganizationId();
    final memId = auth.user!.id;
    final response = await _api.getMemberDetails(
        organizationId: orgId, memberId: memId, token: auth.user!.token);
    log.i(response);
    return Member.fromJson(response);
  }

  void saveOrganizationId(String orgId) {
    log.i('saved orgId ${orgId}');
    _localStorageService.saveToDisk(organizationIdKey, orgId);
    /*Future<User> getUserDetails(String? id) async {
    final response =
        await _apiService.get(Uri.parse('https://api.zuri.chat/users/$id}'));
    return User.fromJson(response);
  }*/
  }
}
