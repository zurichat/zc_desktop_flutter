import 'dart:convert';
import 'dart:io';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/api.dart';

const selectedOrganizationKey = 'selectedOrganizationKey';
const userSelectedOrganizationsKey = 'userSelectedOrganizationsKey';
const organizationIdKey = 'organizationIdKey';
const localOrganizationResponseKey = 'localOrganizationResponse';
const memberIdKey = 'memberIdKey';

/// Refactor class to store objects with a proper db

class OrganizationService {
  final log = getLogger('OrganizationService');
  final _localStorageService = locator<LocalStorageService>();
  final _apiService = locator<Api>();
  Organization? organization;
  List<DM> _dms = [];
 

  /// This gets the currently logged in user respose
  Auth get auth {
    final auth = _localStorageService.getFromDisk(localAuthResponseKey);
    return Auth.fromJson(jsonDecode(auth as String));
  }

  void setDms(List<DM> dm) {
    _dms = dm;
  }

  List<DM> get dm {
    return _dms;
  }

  void saveOrganizationId(String orgId) {
    log.i('saved orgId ${orgId}');
    _localStorageService.saveToDisk(organizationIdKey, orgId);
  }

  void saveMemberId(String memId) {
    log.i('saved membId ${memId}');
    _localStorageService.saveToDisk(memberIdKey, memId);
  }

  Future<void> updateOrganizationUrl({required String url, required String token} ) async{
    await _apiService.updateOrganizationUrl(url: url, organizationId: getOrganizationId(), token: token);
  }

  Future<void> updateOrganizationName({required String name, required String token}) async{
    await _apiService.updateOrganizationName(name: name, organizationId: getOrganizationId(), token: token);
  }

  String getOrganizationId() {
    return _localStorageService.getFromDisk(organizationIdKey) as String;
  }

  String getMemberId() {
    return _localStorageService.getFromDisk(memberIdKey) as String;
  }

  /// This gets the selected organization_service from the sidebar
  int get selectedOrganization {
    int orId = 0;
    try {
      orId = _localStorageService.getFromDisk(selectedOrganizationKey) as int;
      log.d('here: $orId');
    } catch (e) {
      log.e('get org error: $e');
    }
    return orId;
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
    final response = await _apiService.fetchOrganizationsListFromRemote(
        email: auth.user!.email, token: auth.user!.token);
    log.i(response);
    return OrganizationResponse.fromJson(response).data;
  }

  /// This is used to add user to an organization_service
  Future<void> addMemberToOrganization(String organizationId,
      {String? email, String? token}) async {
    await _apiService.addLoggedInUserToOrganization(
        organizationId: organizationId,
        email: email ?? auth.user!.email,
        token: token ?? auth.user!.token);
  }

  /// This is used to add user to an organization_service
  Future<dynamic> invitePeopleToOrganization(
      String organizationId, List<String> email) async {
    final response = await _apiService.invitePeopleToOrganization(
        organizationId: organizationId, email: email, token: auth.user!.token);
    log.i(response);
  }

  ///This is used to get the list of users in an organization
  Future<List<Users>> fetchMemberListUsingOrgId(
      String organizationId, String token) async {
    final response = await _apiService.fetchMemberListUsingOrgId(
        organizationId: organizationId, token: token);
    log.i(response);
    return response;
  }

  /// This is used the create an organization_service
  Future<void> createOrganization(String email) async {
    // Getting stored AuthResponse from local storage
    final response = await _apiService.createOrganizationUsingEmail(
        email: email, token: auth.user!.token);
    log.i(response);
    //addMemberToOrganization(response['data']['_id']);
    String insertedId = response['data']['organization_id'];
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
    final response = await _apiService.fetchOrganizationDetails(
        organizationId: organizationId, token: auth.user!.token);
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
     final response = await _apiService.getUserProfile(orgId: organizationId,memberId: memberId);
    log.i(response);
    return UserProfile.fromJson(response);

    /* final response = await _zuriApiService.fetchUserDetails(userId: memberId,token:  auth.user!.token);
    var user = User.fromJson(response); */
  }

  Future<void> updateUser({
    String? bio,
    String? displayName,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? pronoun,
  }) async {
    final orgId = getOrganizationId();
    final memId = getOrganizationId();
    final response = await _apiService.updateUserDetail(
      organizationId: orgId,
      memberId: memId,
      token: auth.user!.token,
      bio: bio,
      displayName: displayName,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      pronoun: pronoun,
    );
    log.i(response);
    organization = OrganizationResponse.fromJson(response).data as Organization?;
    _localStorageService.saveToDisk(localOrganizationResponseKey, jsonEncode(organization));
  }

  Future<void> updateUserImage({
    String? token,
    required File url,
  }) async {
    final orgId = getOrganizationId();
    final memId = getOrganizationId();
    final response = await _apiService.updateUserPicture(
      organizationId: orgId,
      memberId: memId,
      token: token,
      url: url,
    );
    log.i(response);
    organization =
        OrganizationResponse.fromJson(response).data as Organization?;
    _localStorageService.saveToDisk(
        localOrganizationResponseKey, jsonEncode(organization));
  }

  
}
