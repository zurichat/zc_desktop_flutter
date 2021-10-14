import 'dart:io';

import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/zuri_api/api.dart';

class FakeZuriApiService implements Api {
  @override
  Future<void> addLoggedInUserToOrganization(
      {required String organizationId, required String email, required token}) {
    // TODO: implement addLoggedInUserToOrganization
    throw UnimplementedError();
  }

  @override
  Future<void> addUserToChannel(organizationId, channelId,
      {String? id,
      String? role_id,
      bool? is_admin,
      String? prop1,
      String? prop2,
      String? prop3}) {
    // TODO: implement addUserToChannel
    throw UnimplementedError();
  }

  @override
  Future<void> confirmEmail({required String otpCode}) {
    // TODO: implement confirmEmail
    throw UnimplementedError();
  }

  @override
  Future createChannelsUsingOrgId(
      {required sessionId,
      required insertedOrganization,
      String? name,
      String? owner,
      String? description,
      bool? private}) {
    // TODO: implement createChannelsUsingOrgId
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> createOrganizationUsingEmail(
      {required String email, required token}) {
    // TODO: implement createOrganizationUsingEmail
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> createRoom(
      {User? currentUser, Users? user, String? orgId}) {
    // TODO: implement createRoom
    throw UnimplementedError();
  }

  @override
  Future fetchChannelMessages(
      {required String channelId, required String organizationId}) {
    // TODO: implement fetchChannelMessages
    throw UnimplementedError();
  }

  @override
  Future<String> fetchChannelSocketId(
      {required String channelId,
      required String organizationId,
      required token}) {
    // TODO: implement fetchChannelSocketId
    throw UnimplementedError();
  }

  @override
  Future fetchChannelsListUsingOrgId(
      {required String organizationId, required token}) async {
    await Future.delayed(Duration(seconds: 2));

    return [
      Channel(
          id: '1',
          name: 'team-falcons',
          private: false,
          description: '',
          owner: ''),
      Channel(
          id: '2',
          name: 'team-desktop',
          private: false,
          description: '',
          owner: ''),
      Channel(
          id: '3',
          name: 'test-test',
          private: false,
          description: '',
          owner: ''),
      Channel(
          id: '4',
          name: 'announcements',
          private: false,
          description: '',
          owner: ''),
      Channel(
          id: '5', name: 'general', private: false, description: '', owner: ''),
    ];
  }

  @override
  Future fetchDMs({orgId, userId}) {
    // TODO: implement fetchDMs
    throw UnimplementedError();
  }

  @override
  Future fetchFileListUsingOrgId({required String orgId, required token}) {
    // TODO: implement fetchFileListUsingOrgId
    throw UnimplementedError();
  }

  @override
  Future<List<Users>> fetchMemberListUsingOrgId(
      {required String organizationId, required token}) {
    // TODO: implement fetchMemberListUsingOrgId
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> fetchOrganizationDetails(
      {required String organizationId, required token}) {
    // TODO: implement fetchOrganizationDetails
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> fetchOrganizationsListFromRemote(
      {required String email, required token}) async {
    await Future.delayed(Duration(seconds: 2));

    Map<String, dynamic> orgList = {
      'status': 200,
      'message': 'user organizations retrieved successfully',
      'data': <Organization>[
        Organization(id: '1', name: 'ZuriChat', workspaceUrl: '', logoUrl: ''),
        Organization(id: '2', name: 'HNGi8', workspaceUrl: '', logoUrl: ''),
        Organization(id: '3', name: 'HNGi9', workspaceUrl: '', logoUrl: ''),
        Organization(id: '4', name: 'Tamborin', workspaceUrl: '', logoUrl: ''),
        Organization(id: '5', name: 'ZuriMain', workspaceUrl: '', logoUrl: ''),
        Organization(
            id: '6', name: 'ZuriDesktop', workspaceUrl: '', logoUrl: ''),
      ].map((e) => e.toJson()).toList(),
    };
    return orgList;
  }

  @override
  Future<Map<String, dynamic>> fetchRoomMessages({roomId}) {
    // TODO: implement fetchRoomMessages
    throw UnimplementedError();
  }

  // @override
  // Future<Map<String, dynamic>> fetchUserDetails({String? userId}) {
  //   // TODO: implement fetchUserDetails
  //   throw UnimplementedError();
  // }

  @override
  Future<Map<String, dynamic>> getRoomInfo({roomId}) {
    // TODO: implement getRoomInfo
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserProfile({orgId, memberId}) {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  @override
  Future login({required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Future<Map<String, dynamic>> markMessageAsRead(messageId) {
    // TODO: implement markMessageAsRead
    throw UnimplementedError();
  }

  @override
  Future<void> requestPasswordResetCode({required String email}) {
    // TODO: implement requestPasswordResetCode
    throw UnimplementedError();
  }

  @override
  Future sendMessageToChannel(
      {channel_id, senderId, message, organization_id}) {
    // TODO: implement sendMessageToChannel
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> sendMessageToDM({roomId, senderId, message}) {
    // TODO: implement sendMessageToDM
    throw UnimplementedError();
  }

  @override
  Future<void> signOut(String token) {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signup({required String email, required String password}) {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserPassword(
      {required String password, required String code}) {
    // TODO: implement updateUserPassword
    throw UnimplementedError();
  }

  @override
  Future<void> verifyPasswordResetCode({required String resetCode}) {
    // TODO: implement verifyPasswordResetCode
    throw UnimplementedError();
  }

  @override
  Future<void> createTodo(Todo todo, String token) async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Future<List<Todo>> fetchTodoList() async {
    await Future.delayed(Duration(seconds: 2));
    List<Todo> todoList = [
      Todo(
          userID: '48477b48y7bhn',
          type: 'text',
          title: TodoTitle,
          status: '',
          description: TodoTitle2),
      Todo(
          userID: '48477b48y7bhn',
          type: 'text',
          title: TodoTitle,
          status: '',
          description: TodoTitle2),
      Todo(
          userID: '48477b48y7bhn',
          type: 'text',
          title: TodoTitle,
          status: '',
          description: TodoTitle2),
      Todo(
          userID: '48477b48y7bhn',
          type: 'text',
          title: TodoTitle,
          status: '',
          description: TodoTitle2),
      Todo(
          userID: '48477b48y7bhn',
          type: 'text',
          title: TodoTitle,
          status: '',
          description: TodoTitle2),
      Todo(
          userID: '48477b48y7bhn',
          type: 'text',
          title: TodoTitle,
          status: '',
          description: TodoTitle2),
      Todo(
          userID: '48477b48y7bhn',
          type: 'text',
          title: TodoTitle,
          status: '',
          description: TodoTitle2),
      Todo(
          userID: '48477b48y7bhn',
          type: 'text',
          title: TodoTitle,
          status: '',
          description: TodoTitle2),
      Todo(
          userID: '48477b48y7bhn',
          type: 'text',
          title: TodoTitle,
          status: '',
          description: TodoTitle2),
      Todo(
          userID: '48477b48y7bhn',
          type: 'text',
          title: TodoTitle,
          status: '',
          description: TodoTitle2),
      Todo(
          userID: '48477b48y7bhn',
          type: 'text',
          title: TodoTitle,
          status: '',
          description: TodoTitle2),
    ];
    return todoList;
  }

  @override
  Future<Member> fetchMemberDetail(
      {required String organizationId,
      required String memberId,
      required String token}) {
    // TODO: implement fetchMemberDetail
    throw UnimplementedError();
  }

  @override
  Future<User> fetchUserDetail({required String userId}) {
    // TODO: implement fetchUserDetail
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserDetails({required String userId}) {
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }

  @override
  Future removeUserFromChannel({
    required organizationId,
    required channelId,
    required memberId,
  }) {
    // TODO: implement removeUserFromChannel
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> updateUserDetail({
    required organizationId,
    required memberId,
    required token,
    String? bio,
    String? displayName,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? pronoun,
    String? timeZone,
  }) async {
    return {
      'status': 200,
      'message': 'user updated successfully',
      'bio': '',
      'display_name': '',
      'first_name': '',
      'last_name': '',
      'phone': '',
      'pronouns': '',
      'time_zone': ''
    };
  }

  @override
  Future<Map<String, dynamic>> UpdateUserPicture({
    required organizationId,
    required memberId,
    required token,
    File? img,
  }) async {
    return {
      'status': 200,
      'message': 'user updated successfully',
      'image_url': img,
    };
  }

  @override
  Future<Map<String, dynamic>> getMemberDetails(
      {required String organizationId,
      required String memberId,
      required String token}) async {
    Map<String, dynamic> userDetail = {
      'code': 200,
      'message': 'user details fetched successfully',
      'data': {
        '_id': 1,
        'orgId': 1,
        'name': 'Bernice Quarshie',
        'display_name': 'perp',
        'bio': 'Mobile developer (Flutter)',
        'pronouns': 'her/she',
        'phone': 0264445649,
        'time_zone': 'UTC+ 00',
      }
    };
    return userDetail;
  }
}


