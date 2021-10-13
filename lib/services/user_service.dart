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
    final memId = _organizationService.getMemberId();
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
    final memId = _organizationService.getMemberId();
    final response = await _api.UpdateUserDetails(
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
  Future<User> getUser(String userId) async {
    final response = await _api.getUserDetails(userId: auth.user!.id);
    log.i(response);
    return User.fromJson(response);
  }

  // Future<void> postMemberInfo(String memberId, String parameter) async {
  //   final orgId = _organizationService.getOrganizationId();
  //   final response = await _api.updateUserDetails(
  //     organizationId: orgId,
  //     memberId: memberId,
  //     firstName: '',
  //     lastName: '',
  //     token: null,
  //   );
  //   return response;
  // }

  // Future<String> getMemeberId() async {
  //   final orgId = _organizationService.getOrganizationId();
  //   var response = await _api.addLoggedInUserToOrganization(
  //     organizationId: orgId,
  //     email: _authResponse.user!.email,
  //     token: _authResponse.user!.token,
  //   );
  //   return response(['']);
  // }

  // Future<Member> getMember(String memberId) async {
  //   final orgId = _organizationService.getOrganizationId();
  //   return await _api.fetchUserDetail(
  //       organizationId: orgId,
  //       memberId: memberId,
  //       token: _authResponse.user!.token);
  // }

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
