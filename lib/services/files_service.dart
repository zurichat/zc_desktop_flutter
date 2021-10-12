import 'dart:convert';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/api.dart';

class FilesService {
  final log = getLogger('FilesService');
  final _zuriApiService = locator<Api>();
  final _localStorageService = locator<LocalStorageService>();
  final _organizationService = locator<OrganizationService>();

  /// This gets the currently logged in user respose, incase you need token
  Auth get _auth {
    final auth = _localStorageService.getFromDisk(localAuthResponseKey);
    return Auth.fromJson(jsonDecode(auth as String));
  }

  Future<Files> fetchFileListUsingOrgId() async {
    final response = await _zuriApiService.fetchFileListUsingOrgId(
        orgId: _organizationService.getOrganizationId(),
        token: _auth.user!.token);
    log.i(response);
    return Files.fromJson(response);
  }
}
