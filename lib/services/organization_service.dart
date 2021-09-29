import 'dart:convert';
import 'package:stacked/stacked_annotations.dart';
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
  AuthResponse get _authResponse {
    final authResponse = _localStorageService.getFromDisk(localAuthResponseKey);
    return AuthResponse.fromJson(jsonDecode(authResponse as String));
  }

  /*Future<List<Organization>> getOrganizations() async {
    await Future.delayed(Duration(seconds: 2));
    return _organizations;
  }*/

  Future<void> saveOrganizationId(String orgId) async {
    print('saved orgId ${orgId}');
    await _localStorageService.saveToDisk(organizationIdKey, orgId);
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
    return await _zuriApiService.fetchOrganizationsListFromRemote(
        email: _authResponse.user.email, token: _authResponse.user.token);
  }

  /// This is used to add user to an organization_service
  Future<void> addMemberToOrganization(String organizationId) async {
    await _zuriApiService.addLoggedInUserToOrganization(
        organizationId: organizationId,
        email: _authResponse.user.email,
        token: _authResponse.user.token);
  }

  /// This is used the create an organization_service
  Future<void> createOrganization(String email) async {
    // Getting stored AuthResponse from local storage
    final response = await _zuriApiService.createOrganizationUsingEmail(
        email: email, token: _authResponse.user.token);
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
    return await _zuriApiService.fetchOrganizationDetails(
        organizationId: organizationId, token: _authResponse.user.token);
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
}
