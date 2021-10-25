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

  Future<Member> fetchMemberDetails() async {
    final orgId = _organizationService.getOrganizationId();
    final memId = _organizationService.getOrganizationId();
    final response = await _api.fetchMemberDetail(
      organizationId: orgId,
      memberId: memId,
      token: auth.user!.token,
    );
    log.i(response);
    Member member = Member.fromJson(response['data']);
    return member;
  }
}
