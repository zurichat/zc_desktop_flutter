import 'dart:convert';

import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';

import '../app/app.locator.dart';
import 'api/api_service.dart';

const selectedOrganizationKey = 'selectedOrganizationKey';
const userSelectedOrganizationKey = 'userSelectedOrganizationKey';

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
      response['data'].map((map) => Organization.fromJson(map)).toList(),
    );
  }

  /// This is used the create an organization
  Future<void> createOrganization(String email) async {
    // Getting stored AuthResponse from local storage

    final response = await _apiService.post(
      _apiService.apiConstants.createOrganizationUri,
      body: {
        // "creator_email": _authResponse.user.email,
        "creator_email": email,
      },
      headers: {
        'Authorization': 'Bearer ${_authResponse.user.token}',
      },
    );

    String insertedId = response['data']['InsertedID'];

    Organization insertedOrganisation = await _getOrganisation(insertedId);

    _addOrgToOrganisationsList(insertedOrganisation);
  }

  Future<void> saveUserSelectedOrganisations(
      List<Organization> organisations) async {
    final organisationsToMap =
        organisations.map((organisation) => organisation.toJson()).toList();

    await _localStorageService.saveToDisk(
      userSelectedOrganizationKey,
      jsonEncode(organisationsToMap),
    );
  }

  List<Organization> getUserSelectedOrganisations() {
    final organisationJson = _localStorageService
        .getFromDisk(userSelectedOrganizationKey) as String;

    final List<Map<String, dynamic>> organisationMap = jsonDecode(
      organisationJson,
    );

    return List.from(
      organisationMap.map((map) => Organization.fromJson(map)).toList(),
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

  /// This is used to get a single organisation
  Future<Organization> _getOrganisation(String organisationId) async {
    final response = await _apiService.get(
      _apiService.apiConstants.getOrganizationUri(organisationId),
      headers: {
        'Authorization': 'Bearer ${_authResponse.user.token}',
      },
    );

    return Organization.fromJson(response['data']);
  }

  Future<void> _addOrgToOrganisationsList(Organization organisation) async {
    final organisationJson = _localStorageService
        .getFromDisk(userSelectedOrganizationKey) as String;

    final List<Map<String, dynamic>> organisationMap = jsonDecode(
      organisationJson,
    );

    organisationMap.add(organisation.toJson());

    await _localStorageService.saveToDisk(
      userSelectedOrganizationKey,
      jsonEncode(organisationMap),
    );
  }

  updateOrganizationName(String organizationName) {}
}
