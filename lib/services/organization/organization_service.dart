import 'dart:convert';

import 'package:stacked/stacked_annotations.dart';

import '../../app/app.locator.dart';
import '../../models/auth_response.dart';
import '../../models/organization/organization.dart';
import '../api/api_service.dart';
import '../authentication/auth_service.dart';
import '../local_storage/local_storage_service.dart';

const selectedOrganizationKey = 'selectedOrganizationKey';
const userSelectedOrganizationsKey = 'userSelectedOrganizationsKey';

/// Refactor class to store objects with a proper db
@LazySingleton()
class OrganizationService {
  final _localStorageService = locator<LocalStorageService>();
  final _apiService = locator<ApiService>();

  /// This gets the selected organization from the sidebar
  int get selectedOrganization {
    return _localStorageService.getFromDisk(selectedOrganizationKey) as int;
  }

  /// This is the function for changing the selected organization
  /// Reload the list of channels after changing the organization
  void changeSelectedOrganization(int index) {
    _localStorageService.saveToDisk(selectedOrganizationKey, index);
    // TODO: Fetch List of Channels Again using the channels service
  }

  /// This is used to get the list of organizations on the page before ...
  /// ... the actual home view (organization view)
  Future<List<Organization>> getOrganizations() async {
    // Getting stored AuthResponse from local storage

    final response = await _apiService.get(
      _apiService.apiConstants.getOrganizationsUri(_authResponse.user.email),
      // headers: {'Authorization': 'Bearer ${_authResponse.user.token}'},
    );

    return List.from(
      response['data'].map((map) => Organization.fromMap(map)).toList(),
    );
  }

  /// This is used the create an organization
  Future<String> createOrganization() async {
    // Getting stored AuthResponse from local storage

    final response = await _apiService.post(
      _apiService.apiConstants.createOrganizationUri,
      body: {
        "creator_email": _authResponse.user.email,
      },
      headers: {
        'Authorization': 'Bearer ${_authResponse.user.token}',
      },
    );

    String insertedId = response['data']['InsertedID'];
    return insertedId;

    // Organization insertedOrganization = await _getOrganization(insertedId);

    // _addOrgToOrganizationsList(insertedOrganization);
  }

  Future<void> updateOrganizationName(String organizationName) async {
    final insertedId = await createOrganization();
    await _apiService.patch(
      _apiService.apiConstants.updateOrganizationNameUri(insertedId),
      body: {
        "organization_name": organizationName,
      },
      headers: {
        'Authorization': 'Bearer ${_authResponse.user.token}',
      },
    );

    Organization insertedOrganization = await _getOrganization(insertedId);
    print(insertedOrganization);

    await _addOrgToOrganizationsList(insertedOrganization);

    // TODO: create general, random and user initial channels when organization
    // created. Channel service not implemeneted yet.
  }

  Future<void> saveUserSelectedOrganizations(
      List<Organization> organizations) async {
    final organizationsToMap =
        organizations.map((organization) => organization.toMap()).toList();

    await _localStorageService.saveToDisk(
      userSelectedOrganizationsKey,
      jsonEncode(organizationsToMap),
    );
  }

  List<Organization> getUserSelectedOrganizations() {
    final organizationJson = _localStorageService
        .getFromDisk(userSelectedOrganizationsKey) as String;

    final List<Map<String, dynamic>> organizationMap = jsonDecode(
      organizationJson,
    );

    return List.from(
      organizationMap.map((map) => Organization.fromMap(map)).toList(),
    );
  }

  /// Private methods
  /// They should not be used outside this file
  ///

  /// This gets the currently logged in user respose
  AuthResponse get _authResponse {
    final authResponse = _localStorageService.authResponse;
    return AuthResponse.fromMap(jsonDecode(authResponse as String));
  }

  /// This is used to get a single organization
  Future<Organization> _getOrganization(String organizationId) async {
    final response = await _apiService.get(
      _apiService.apiConstants.getOrganizationUri(organizationId),
      headers: {
        'Authorization': 'Bearer ${_authResponse.user.token}',
      },
    );

    return Organization.fromMap(response['data']);
  }

  Future<void> _addOrgToOrganizationsList(Organization organization) async {
    final organizationJson = _localStorageService
        .getFromDisk(userSelectedOrganizationsKey) as String;

    final List<Map<String, dynamic>> organizationMap = jsonDecode(
      organizationJson,
    );

    organizationMap.add(organization.toMap());

    await _localStorageService.saveToDisk(
      userSelectedOrganizationsKey,
      jsonEncode(organizationMap),
    );
  }
}
