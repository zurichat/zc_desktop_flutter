import 'dart:convert';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/api.dart';

const userIdKey = 'userIdKey';
const orgResponseKey = 'localOrganizationResponse';

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

  Organization get organization {
    final organization = _localStorageService.getFromDisk(localAuthResponseKey);
    return Organization.fromJson(jsonDecode(organization as String));
  }

  String getUserId() {
    return _localStorageService.getFromDisk(userIdKey) as String;
  }

  // Future<void> updateUserImage({
  //   String? token,
  //   required String url,
  // }) async {
  //   final orgId = _organizationService.getOrganizationId();
  //   final memId = _organizationService.getOrganizationId();
  //   final response = await _api.updateUserPicture(
  //     organizationId: orgId,
  //     memberId: memId,
  //     token: token,
  //     url: url,
  //   );
  //   log.i(response);
  //   organization =
  //       OrganizationResponse.fromJson(response).data as Organization?;
  //   _localStorageService.saveToDisk(
  //       localOrganizationResponseKey, jsonEncode(organization));
  // }

  // Future<void> updateUser({
  //   String? bio,
  //   String? displayName,
  //   String? firstName,
  //   String? lastName,
  //   String? phoneNumber,
  //   String? pronoun,
  //   String? timeZone,
  // }) async {
  //   final orgId = _organizationService.getOrganizationId();
  //   final memId = _organizationService.getOrganizationId();
  //   final response = await _api.updateUserDetail(
  //     organizationId: orgId,
  //     memberId: memId,
  //     token: auth.user!.token,
  //     bio: bio,
  //     displayName: displayName,
  //     firstName: firstName,
  //     lastName: lastName,
  //     phoneNumber: phoneNumber,
  //     pronoun: pronoun,
  //     timeZone: timeZone,
  //   );
  //   log.i(response);
  //   organization = OrganizationResponse.fromJson(response).data as Organization?;
  //   _localStorageService.saveToDisk(localOrganizationResponseKey, jsonEncode(organization));
  // }

  Future<void> fetchMemberDetails(String displayName) async {
    final orgId = _organizationService.getOrganizationId();
    final memId = _organizationService.getOrganizationId();
    final response = await _api.fetchMemberDetail(
        organizationId: orgId, memberId: memId, token: auth.user!.token);
    return response;
  }

  /// This is used to get a single user_service
  Future<void> getmember() async {
    final orgId = _organizationService.getOrganizationId();
    final memId = _organizationService.getMemberId();
    final response = await _api.fetchMemberDetail(
        organizationId: orgId, memberId: memId, token: auth.user!.token);
    return response;
  }
}
