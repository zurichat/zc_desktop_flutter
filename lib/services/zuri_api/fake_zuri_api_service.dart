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
  Future<Map<String, dynamic>> fetchUserDetails({String? userId}) {
    // TODO: implement fetchUserDetails
    throw UnimplementedError();
  }

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
  Future removeUserFromChannel(
      {required organizationId, required channelId, required memberId}) {
    // TODO: implement removeUserFromChannel
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
  Future<void> createTodo(Todo todo) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> fetchTodoList() {
    // TODO: implement fetchTodoList
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> fetchRoomMessages({roomId, orgId}) {
    // TODO: implement fetchRoomMessages
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> reactToMessage({orgId, roomId, messageId, required ReactToMessage reactToMessage}) {
    // TODO: implement reactToMessage
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> sendMessageToDM({roomId, senderId, message, orgId}) {
    // TODO: implement sendMessageToDM
    throw UnimplementedError();
  }
}
