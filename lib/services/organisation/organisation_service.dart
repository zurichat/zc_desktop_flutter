import 'dart:convert';

import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';

import '../../app/app.locator.dart';
import '../../models/auth_response.dart';
import '../../models/organisation/organisation.dart';
import '../api/api_service.dart';

const selectedOrganisationKey = 'selectedOrganisationKey';
const userSelectedOrganisationsKey = 'userSelectedOrganisationsKey';

/// Refactor class to store objects with a proper db
@LazySingleton()
class OrganizationService {
  final _localStorageService = locator<LocalStorageService>();
  final _apiService = locator<ApiService>();

  /// This gets the selected organisation from the sidebar
  int get selectedOrganisation {
    return _localStorageService.getFromDisk(selectedOrganisationKey) as int;
  }

  /// This is the function for changing the selected organisation
  /// Reload the list of channels after changing the organisation
  void changeSelectedOrganisation(int index) {
    _localStorageService.saveToDisk(selectedOrganisationKey, index);
    // TODO: Fetch List of Channels Again using the channels service
  }

  /// This is used to get the list of organisations on the page before ...
  /// ... the actual home view (organisation view)
  Future<List<Organisation>> getOrganisations() async {
    // Getting stored AuthResponse from local storage

    final response = await _apiService.get(
      _apiService.apiConstants.getOrganisationsUri(_authResponse.user.email),
      // headers: {'Authorization': 'Bearer ${_authResponse.user.token}'},
    );

    return List.from(
      response['data'].map((map) => Organisation.fromMap(map)).toList(),
    );
  }

  /// This is used the create an organisation
  Future<void> createOrganisation(String email) async {
    // Getting stored AuthResponse from local storage

    final response = await _apiService.post(
      _apiService.apiConstants.createOrganisationUri,
      body: {
        // "creator_email": _authResponse.user.email,
        "creator_email": email,
      },
      headers: {
        'Authorization': 'Bearer ${_authResponse.user.token}',
      },
    );

    String insertedId = response['data']['InsertedID'];

    Organisation insertedOrganisation = await _getOrganisation(insertedId);

    _addOrgToOrganisationsList(insertedOrganisation);
  }

  Future<void> saveUserSelectedOrganisations(
      List<Organisation> organisations) async {
    final organisationsToMap =
        organisations.map((organisation) => organisation.toMap()).toList();

    await _localStorageService.saveToDisk(
      userSelectedOrganisationsKey,
      jsonEncode(organisationsToMap),
    );
  }

  List<Organisation> getUserSelectedOrganisations() {
    final organisationJson = _localStorageService
        .getFromDisk(userSelectedOrganisationsKey) as String;

    final List<Map<String, dynamic>> organisationMap = jsonDecode(
      organisationJson,
    );

    return List.from(
      organisationMap.map((map) => Organisation.fromMap(map)).toList(),
    );
  }

  /// Private methods
  /// They should not be used outside this file
  ///

  /// This gets the currently logged in user respose
  AuthResponse get _authResponse {
    final authResponse = _localStorageService.getFromDisk(localAuthResponseKey);
    return AuthResponse.fromMap(jsonDecode(authResponse as String));
  }

  /// This is used to get a single organisation
  Future<Organisation> _getOrganisation(String organisationId) async {
    final response = await _apiService.get(
      _apiService.apiConstants.getOrganisationUri(organisationId),
      headers: {
        'Authorization': 'Bearer ${_authResponse.user.token}',
      },
    );

    return Organisation.fromMap(response['data']);
  }

  Future<void> _addOrgToOrganisationsList(Organisation organisation) async {
    final organisationJson = _localStorageService
        .getFromDisk(userSelectedOrganisationsKey) as String;

    final List<Map<String, dynamic>> organisationMap = jsonDecode(
      organisationJson,
    );

    organisationMap.add(organisation.toMap());

    await _localStorageService.saveToDisk(
      userSelectedOrganisationsKey,
      jsonEncode(organisationMap),
    );
  }
}
