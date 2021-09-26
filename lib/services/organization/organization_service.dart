import 'dart:convert';

import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';

import 'package:zc_desktop_flutter/services/channel_service/channels_service.dart';

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
  final _channelService = locator<ChannelsService>();
  final log = getLogger('OrganizationService');

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

  // Future<List<Organization>> getOrganizations() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   return _organizations;
  // }

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
    log.i('Getting user organizations');
    log.i(_authResponse.user.email);
    final response = await _apiService.get(
      _apiService.apiConstants
          .getUserOrganizationsByEmailUri(_authResponse.user.email),
      headers: {
        'Cookie':
            'f6822af94e29ba112be310d3af45d5c7=MTYzMjY1OTUxMnxHd3dBR0RZeE5UQTJPRE00Tm1Sak16Tm1OalZoWWpReU5UVTBZdz09fFuQUNebZiiYyadcGkyltamz1UhLZyfwKoIHnv8nEYXt'
      },
    );
    // final response = null;
    log.i(response['data']);
    // List<Organization> organizations = [];
    if (response != null) {
      List<Organization> organizations = List.from(
        response['data'].map((map) => Organization.fromMap(map)).toList(),
      );
      return organizations;
    } else {
      return _organizations;
    }
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

    // // TODO: create general, random and user initial channels when organization
    // // created. Channel service not implemeneted yet.
    // List<String> listOfChannels = ['general', 'random'];
    // // add user channel to list.
    // // iterate over the list and create channels
    // _channelService.createChannel("general")

    Organization insertedOrganization = await _getOrganization(insertedId);
    print(insertedOrganization);

    await _addOrgToOrganizationsList(insertedOrganization);
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
    final authResponse = _localStorageService.getFromDisk(localAuthResponseKey);
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

    organizationMap.add(organization.toMap());

    await _localStorageService.saveToDisk(
      userSelectedOrganizationsKey,
      jsonEncode(organizationMap),
    );
  }
}
