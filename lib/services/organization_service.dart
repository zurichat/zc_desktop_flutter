import 'dart:convert';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/zuri_api_service.dart';

const selectedOrganizationKey = 'selectedOrganizationKey';
const userSelectedOrganizationsKey = 'userSelectedOrganizationsKey';
const organizationIdKey = 'organizationIdKey';

/// Refactor class to store objects with a proper db

class OrganizationService {
  final log = getLogger("OrganizationService");
  final _localStorageService = locator<LocalStorageService>();
  final _zuriApiService = locator<ZuriApiService>();

  /// This gets the currently logged in user respose
  Auth get _auth {
    final auth = _localStorageService.getFromDisk(localAuthResponseKey);
    return Auth.fromJson(jsonDecode(auth as String));
  }

  void saveOrganizationId(String orgId) {
    log.i('saved orgId ${orgId}');
    _localStorageService.saveToDisk(organizationIdKey, orgId);
  }

  String getOrganizationId() {
    return _localStorageService.getFromDisk(organizationIdKey) as String;
  }

  /// This gets the selected organization_service from the sidebar
  int get selectedOrganization {
    return _localStorageService.getFromDisk(selectedOrganizationKey) as int;
  }

  /// This is the function for changing the selected organization_service
  /// Reload the list of channels after changing the organization_service
  void changeSelectedOrganization(int index) {
    _localStorageService.saveToDisk(selectedOrganizationKey, index);
    // TODO: Fetch List of Channels Again using the channels service
  }

  /// This is used to get the list of organisations on the page before ...
  /// ... the actual home view (organization_service view)
  Future<List<Organization>> getOrganizations() async {
    // Getting stored AuthResponse from local storage
    final response = await _zuriApiService.fetchOrganizationsListFromRemote(
        email: _auth.user!.email, token: _auth.user!.token);
    log.i(response);
    return OrganizationResponse.fromJson(response).data;
  }

  /// This is used to add user to an organization_service
  Future<void> addMemberToOrganization(String organizationId,
      {String? email, String? token}) async {
    await _zuriApiService.addLoggedInUserToOrganization(
        organizationId: organizationId,
        email: email ?? _auth.user!.email,
        token:token ?? _auth.user!.token);
  }

  /// This is used the create an organization_service
  Future<void> createOrganization(String email) async {
    // Getting stored AuthResponse from local storage
    final response = await _zuriApiService.createOrganizationUsingEmail(
        email: email, token: _auth.user!.token);
    log.i(response);
    addMemberToOrganization(response['data']['_id']);
    String insertedId = response['data']['InsertedID'];
    Organization insertedOrganisation = await _getOrganization(insertedId);
    _addOrgToOrganizationsList(insertedOrganisation);
  }

  List<Organization> getUserSelectedOrganisations() {
    final organizationJson = _localStorageService
        .getFromDisk(userSelectedOrganizationsKey) as String;

    final List<Map<String, dynamic>> organizationMap = jsonDecode(
      organizationJson,
    );

    return List.from(
      organizationMap.map((map) => Organization.fromJson(map)).toList(),
    );
  }

  Future<void> saveUserSelectedOrganizations(
      List<Organization> organizations) async {
    final organizationsToMap =
        organizations.map((organization) => organization.toJson()).toList();

    await _localStorageService.saveToDisk(
      userSelectedOrganizationsKey,
      jsonEncode(organizationsToMap),
    );
  }

  /// Private methods
  /// They should not be used outside this file
  ///

  /// This is used to get a single organization_service
  Future<Organization> _getOrganization(String organizationId) async {
    final response = await _zuriApiService.fetchOrganizationDetails(
        organizationId: organizationId, token: _auth.user!.token);
    log.i(response);
    return Organization.fromJson(response);
  }

  Future<void> _addOrgToOrganizationsList(Organization organization) async {
    final organizationJson =
        _localStorageService.getFromDisk(userSelectedOrganizationsKey);

    final List<dynamic> organizationMap;

    if (organizationJson != null) {
      organizationMap = jsonDecode(
        organizationJson as String,
      );
    } else {
      organizationMap = <dynamic>[];
    }

    organizationMap.add(organization.toJson());

    await _localStorageService.saveToDisk(
      userSelectedOrganizationsKey,
      jsonEncode(organizationMap),
    );
  }

  /// This is used to get a single user profile
  Future<UserProfile> getUserProfile(
      String organizationId, String memberId) async {
    /* final response = await _zuriApiService.getUserProfile(orgId: organizationId,memberId: memberId);
    log.i(response);
    return UserProfile.fromJson(response); */

    return UserProfile(
        firstName: 'Lucy',
        lastName: 'CocoMelon',
        displayName: 'sweetcoco',
        imageUrl: 'https://api.zuri.chat/files/profile_image/614679ee1a5607b13c00bcb7/61467e671a5607b13c00bcc9/20210928144813_0.jpg',
        userName: 'sweetcoco',
        phone: 'phone',
        pronouns: 'pronouns',
        bio: 'bio',
        status: 'status');
  }
}
