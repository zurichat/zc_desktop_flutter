import 'dart:convert';
import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/api/api_service.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';

const selectedOrganizationKey = 'selectedOrganizationKey';
const userSelectedOrganizationsKey = 'userSelectedOrganizationsKey';
const organizationIdKey = 'organizationIdKey';

/// Refactor class to store objects with a proper db
@LazySingleton()
class OrganizationService {
  final log = getLogger("OrganizationService");
  final _localStorageService = locator<LocalStorageService>();
  final _apiService = locator<ApiService>();

  List<Organization> _organizations = [
    Organization(
      id: "1",
      name: "Zuri chat",
      logoUrl: "assets/icons/zuri_logo_only.svg",
      workspaceUrl: "",
    ),
    Organization(
      id: "2",
      name: "HNGi8",
      logoUrl: "assets/images/gmail.svg",
      workspaceUrl: "",
    ),
    Organization(
      id: "3",
      name: "Tamborin",
      logoUrl: "assets/images/twitter.svg",
      workspaceUrl: "",
    ),
    Organization(
      id: "4",
      name: "Filledstacks",
      logoUrl: "assets/images/facebook.svg",
      workspaceUrl: "",
    ),
    Organization(
      id: "5",
      name: "GADS 2021",
      logoUrl: "assets/images/google.svg",
      workspaceUrl: "",
    ),
  ];

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

    final response = await _apiService.get(
      _apiService.apiConstants.getOrganizationsUri(_authResponse.user.email),
      headers: {'Authorization': "Bearer ${_authResponse.user.token}"},
    );

    return List.from(
      response['data'].map((map) => Organization.fromJson(map)).toList(),
    );
  }

  /// This is used to add user to an organization_service
  Future<void> addMemberToOrganization(String orgID) async {
    await _apiService.post(
      _apiService.apiConstants.getaddUserToOganization(orgID),
      body: {'user_email': _authResponse.user.email},
      headers: {'Authorization': 'Bearer ${_authResponse.user.token}'},
    );
  }

  /// This is used the create an organization_service
  Future<void> createOrganization(String email) async {
    // Getting stored AuthResponse from local storage
    print('Bearer ${_authResponse.sessionID}');
    final response = await _apiService.post(
      _apiService.apiConstants.createOrganizationUri,
      body: {
        // "creator_email": _authResponse.user.email,
        "creator_email": email,
      },
      headers: {'Authorization': 'Bearer ${_authResponse.user.token}'},
    );
    addMemberToOrganization(response['data']['_id']);
    String insertedId = response['data']['InsertedID'];

    Organization insertedOrganisation = await _getOrganization(insertedId);

    _addOrgToOrganizationsList(insertedOrganisation);
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

  /// Private methods
  /// They should not be used outside this file
  ///

  /// This gets the currently logged in user respose
  AuthResponse get _authResponse {
    final authResponse = _localStorageService.getFromDisk(localAuthResponseKey);
    return AuthResponse.fromJson(jsonDecode(authResponse as String));
  }

  /// This is used to get a single organization_service
  Future<Organization> _getOrganization(String organizationId) async {
    final response = await _apiService.get(
      _apiService.apiConstants.getOrganisationUri(organizationId),
      headers: {
        'Authorization': 'Bearer ${_authResponse.user.token}',
      },
    );

    return Organization.fromJson(response['data']);
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
