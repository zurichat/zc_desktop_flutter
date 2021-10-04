import 'dart:convert';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/zuri_api_service.dart';

const userIdKey = 'userIdKey';

class UserService {
  final log = getLogger("UserService");
  final _localStorageService = locator<LocalStorageService>();
  final _api = locator<ZuriApiService>();
  final _organizationService = locator<OrganizationService>();

  // This gets the currently logged in user respose
  Auth get _authResponse {
    final authResponse = _localStorageService.getFromDisk(localAuthResponseKey);
    return Auth.fromJson(jsonDecode(authResponse as String));
  }



  String getUserId() {
    return _localStorageService.getFromDisk(userIdKey) as String;
  }

  Future<User?> fetchUserDetails(String) async {
    final authResponse = Auth.fromJson(json.decode(
        _localStorageService.getFromDisk(localAuthResponseKey).toString()));

    return authResponse.user;
  }


  /// This is used to get a single user_service
  Future<User> getUser(String userId) async {
    final response = await _api.getUserDetails(userId: userId, token: _authResponse.user!.token);
    log.i(response);
    return User.fromJson(response);
  }



  Future<String> getMemeberId() async {
    final orgId = _organizationService.getOrganizationId();
    var response = await _api.addLoggedInUserToOrganization(
      organizationId: orgId,
      email: _authResponse.user!.email,
      token: _authResponse.user!.token,
    );
    log.i(response);
    return response;
  }

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
  }
}
