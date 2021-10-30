import 'package:intl/intl.dart';

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
  Future invitePeopleToOrganization(
      {required String organizationId,
      required List<String> email,
      required token}) async {
    await Future.delayed(Duration(seconds: 3));
    return {
      'status': 200,
      'message': 'Organization invite operation result',
      'data': {
        'InvalidEmails': null,
        'InviteIDs': [
          null,
          null,
          '6167068467dc381fc3b4db88',
          '6167068667dc381fc3b4db89'
        ]
      }
    };
  }

  @override
  Future addUserToChannel(organizationId, channelId,
      {String? id,
      String? role_id,
      bool? is_admin,
      String? prop1,
      String? prop2,
      String? prop3}) async {
    await Future.delayed(Duration(seconds: 2));
    return {'status': 200, 'message': 'Invite successful'};
  }

  @override
  Future confirmEmail({required String otpCode}) async {
    await Future.delayed(Duration(seconds: 2));
    return {'code': '200', 'message': ''};
  }

  @override
  Future createChannelsUsingOrgId(
      {required sessionId,
      required insertedOrganization,
      String? name,
      String? owner,
      String? description,
      bool? private,
      String? topic,
      bool? defaultChannel}) async {
    // TODO: implement createChannelsUsingOrgId
    //  await Future.delayed(Duration(seconds: 2));
    return Channel(
      name: 'zuri main channel',
      owner: 'CalebJ',
      description: 'zuri main description',
      private: false,
      memberinput: true,
      member: 10,
    ).toJson();
    // throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> createOrganizationUsingEmail(
      {required String email, required token}) {
    // TODO: implement createOrganizationUsingEmail
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> createRoom(
      {User? currentUser, Users? user, String? orgId}) async {
    await Future.delayed(Duration(seconds: 2));
    return {'room_id': '6165848888888294bffc7a0d'};
  }

  @override
  Future<Map<String, dynamic>> updateOrganizationName({ required String name, required String organizationId, required String token}) async {
    await Future.delayed(Duration(seconds: 2));
    return {
      'status' : 200,
      'message' : 'Url update successfully'
    };
  }

  @override
  Future<Map<String, dynamic>> updateOrganizationUrl({ required String url, required String organizationId, required String token}) async {
    await Future.delayed(Duration(seconds: 2));
    return {
      'status' : 200,
      'message' : 'Url update successfully'
    };
  }
  @override
  Future fetchChannelMessages(
      {required String channelId, required String organizationId}) async {
    // TODO: implement fetchChannelMessages
    await Future.delayed(Duration(seconds: 4));
    // List<ChannelMessage> channelMessage = [

    //   '_id': "string",
    //   'user_id': "string",
    //   "channel_id": "string",
    //   "can_reply": true,
    //   "type": "message",
    //   "edited": true,
    //   "files": [
    //     "string"
    //   ],
    //   "timestamp": "2021-10-12T07:25:47.597Z",
    //   "replies": 0,
    //   "has_files": true,
    //   "pinned": true,
    //   "content": "string",
    //   "emojis": [
    //     "string"
    //   ],
    //   "event": {
    //     "additionalProp1": "string",
    //     "additionalProp2": "string",
    //     "additionalProp3": "string"
    //   }
    //   ];

    // return channelMessage;
    List<ChannelMessage> channelMessage = [
      ChannelMessage(
          id: '1',
          content: 'Hello Ademola',
          channel_id: '12',
          timestamp: DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
              .format(DateTime.now())
              .toString(),
          user_id: '012'),
      ChannelMessage(
          id: '2',
          content: 'Hello Dedan',
          channel_id: '23',
          timestamp: DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
              .format(DateTime.now())
              .toString(),
          user_id: '023'),
    ];

    return channelMessage;
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

    List<Channel> channelList = [
      Channel(
          id: '1',
          name: 'team-falcons',
          private: false,
          description: '',
          owner: '',
          memberinput: true,
          member: 10),
      Channel(
          id: '2',
          name: 'team-desktop',
          private: false,
          description: '',
          owner: '',
          memberinput: true,
          member: 43),
      Channel(
          id: '3',
          name: 'test-test',
          private: false,
          description: '',
          owner: '',
          memberinput: true,
          member: 75),
      Channel(
          id: '4',
          name: 'announcements',
          private: false,
          description: '',
          owner: '',
          memberinput: true,
          member: 101),
      Channel(
          id: '5',
          name: 'general',
          private: false,
          description: '',
          owner: '',
          memberinput: true,
          member: 99),
    ];

    return channelList;
  }

  @override
  Future fetchDMs({orgId, userId}) async {
    await Future.delayed(Duration(seconds: 2));
    return [
      {
        '_id': '6165848888888294bffc7a0d',
        'status': 0,
        'private': true,
        'bookmark': [],
        'starred': [],
        'created_at': DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
            .format(DateTime.now())
            .toString(),
        'org_id': '6165856e40029bb67e90deec',
        'pinned': [],
        'room_user_ids': [
          '616584e9f214f294bffc7a0d',
          '6165856e40029bb67e90deed'
        ]
      },
      {
        '_id': '6165899559598294bffc7a0d',
        'status': 0,
        'private': true,
        'bookmark': [],
        'starred': [],
        'created_at': DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
            .format(DateTime.now())
            .toString(),
        'org_id': '6165856e40029bb67e90deec',
        'pinned': [],
        'room_user_ids': [
          '616584e9f214f294bffc7a0d',
          '6165856e40029bb67e90deed'
        ]
      },
    ];
  }

  @override
  Future fetchFileListUsingOrgId({required String orgId, required token}) {
    // TODO: implement fetchFileListUsingOrgId
    throw UnimplementedError();
  }

  @override
  Future<List<Users>> fetchMemberListUsingOrgId(
      {required String organizationId, required token}) async {
    await Future.delayed(Duration(seconds: 2));

    List<Users> userList = [
      Users(
        id: '1',
        profileImage: '',
        displayName: 'Eternity',
        name: 'Issac',
        bio: 'Mentor',
      ),
      Users(
        id: '2',
        profileImage: '',
        displayName: 'Kat',
        name: 'Katherine',
        bio: 'Intern',
      ),
      Users(
        id: '3',
        profileImage: '',
        displayName: 'Bernice',
        name: 'Bernice',
        bio: 'Intern',
      ),
      Users(
        id: '4',
        profileImage: '',
        displayName: 'Demmss',
        name: 'Ademola',
        bio: 'Intern',
      ),
      Users(
        id: '5',
        profileImage: '',
        displayName: 'protector',
        name: 'Damilare',
        bio: 'Intern',
      ),
    ];
    return userList;
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
    await Future.delayed(Duration(seconds: 1));

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
  Future<Map<String, dynamic>> getUserProfile({orgId, memberId}) async {
    await Future.delayed(Duration(seconds: 4));
    return {
      'first_name': 'Borris Mejja',
      'last_name': 'Coco Melon',
      'display_name': 'Sweet Coco',
      'image_url':
          'https://api.zuri.chat/files/profile_image/614679ee1a5607b13c00bcb7/61467e671a5607b13c00bcc9/20210928144813_0.jpg',
      'user_name': 'Sweet Chocolate',
      'phone': 'phone',
      'pronouns': 'pronouns',
      'bio': 'Welcome to Zuri',
      'status': 'status'
    };
  }

  @override
  Future login({required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 3));
    return {
      'code': 200,
      'data': {
        'session_id': 'string',
        'user': User(
                id: '79hdhuisksj',
                firstName: 'John',
                lastName: 'Doe',
                displayName: 'Protector',
                email: email,
                phone: '',
                status: 0,
                timeZone: '',
                createdAt: '',
                updatedAt: '',
                token: 'hkjsliy07oihslkhor7sihlks7')
            .toJson()
      },
      'message': 'string'
    };
  }

  @override
  Future<Map<String, dynamic>> markMessageAsRead(messageId) {
    // TODO: implement markMessageAsRead
    throw UnimplementedError();
  }

  @override
  Future requestPasswordResetCode({required String email}) async {
    await Future.delayed(Duration(seconds: 2));
    return {
      'status': '200',
      'message': 'Password reset code sent',
      'data': null
    };
  }

  @override
  Future sendMessageToChannel(
      {channel_id, senderId, message, organization_id}) async {
    // TODO: implement sendMessageToChannel
    await Future.delayed(Duration(seconds: 2));
    return ChannelMessage(
            id: '15',
            content: 'I am fine',
            channel_id: '15',
            timestamp: DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
                .format(DateTime.now())
                .toString(),
            user_id: '015')
        .toJson();
  }

  @override
  Future signOut(String token) async {
    await Future.delayed(Duration(milliseconds: 500));
    return {
      'status':'200',
      'message': 'token destroyed successfully'
    };
  }

  @override
  Future signup(
      {required String password,
      required String email,
      required String fName,
      required String lName}) async {
    await Future.delayed(Duration(seconds: 2));
    return {
      'created_at': '2021-09-07 11:22:06.932180',
      'deleted_at': '0001-01-01 00:00:00',
      'email': '$email',
      'email_verification': {
        'expired_at': '0001-01-01 00:00:00',
        'id': '61374b5e7ccea12370c5adec',
        'token': null,
        'verified': false
      },
      'first_name': '$fName',
      'id': '61374b5e7ccea12370c5adec',
      'last_name': '$lName',
      'password': '$password',
      'password_resets': null,
      'phone': '0123456789',
      'settings': null,
      'time_zone': '',
      'updated_at': '0001-01-01 00:00:00',
      'workspace_profiles': null,
      'workspaces': null
    };
  }

  @override
  Future updateUserPassword(
      {required String password, required String code}) async {
    await Future.delayed(Duration(seconds: 2));
    return {
      'code': '200',
      'data': null,
      'message': 'password confirm successful'
    };
  }

  @override
  Future verifyPasswordResetCode({required String resetCode}) async {
    await Future.delayed(Duration(seconds: 2));
    return {'code': '200', 'message': 'Password confirm successful'};
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
  Future updateUserDetail({
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
      'code': 200,
      'data': Member(
        id: 'ttwyrwetufdutef',
        orgId: 'efgyuefuyety',
        bio: 'Mobile Developer(Flutter/Kotlin) /n Data Analyst /n Artist',
        displayName: 'Perpety',
        firstName: 'Perpetua',
        lastName: 'Quarshie',
        phone: '+233 264445649',
        pronouns: 'Her/She',
        timeZone: 'UTC +01:00',
        createdAt: '',
        updatedAt: '',
      ).toJson()
    };
  }

  Future<Map<String, dynamic>> fetchRoomMessages({roomId, orgId}) async {
    await Future.delayed(Duration(seconds: 4));
    return {
      'count': 3,
      'next': '0',
      'previous': '0',
      'results': [
        {
          'id': 'j3nj359885j35n0009nu5',
          'created_at': DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
              .format(DateTime.now())
              .toString(),
          'media': [],
          'message': 'We have a meeting today',
          'pinned': false,
          'reactions': [],
          'read': false,
          'room_id': '6165848888888294bffc7a0d',
          'saved_by': [],
          'sender_id': '616584e9f214f294bffc7a0d',
          'threads': []
        },
        {
          'id': 'j3nj35590n35n0009nu5',
          'created_at': DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
              .format(DateTime.now())
              .toString(),
          'media': [],
          'message': 'Hey Good Morning',
          'pinned': false,
          'reactions': [],
          'read': false,
          'room_id': '6165848888888294bffc7a0d',
          'saved_by': [],
          'sender_id': '616584e9f214f294bffc7a0d',
          'threads': []
        },
      ]
    };
  }

  @override
  Future<dynamic> updateUserPicture({
    required organizationId,
    required memberId,
    required token,
    File? url,
  }) async {
    return {
      'status': 200,
      'message': 'user updated successfully',
      'image_url': url,
    };
  }

  @override
  Future<Map<String, dynamic>> reactToMessage(
      {orgId, roomId, messageId, required ReactToMessage reactToMessage}) {
    // TODO: implement reactToMessage
    throw UnimplementedError();
  }

  @override
  Future removeUserFromChannel(
      {required organizationId, required channelId, required memberId}) {
    // TODO: implement removeUserFromChannel
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> sendMessageToDM(
      {roomId, senderId, message, orgId}) {
    // TODO: implement sendMessageToDM
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> deleteOrganization(
      {required String organizationId, required token}) async {
    await Future.delayed(Duration(seconds: 4));

    return {
      'code': 200,
      'message': 'no data',
    };
  }

  @override
  Future<Map<String, dynamic>> pinMessage(messageId, orgId) async {
    await Future.delayed(Duration(seconds: 1));
    return {
      'message_id': messageId,
      'pinned': [messageId],
      'Event': 'pin_message'
    };
  }

  @override
  Future<Map<String, dynamic>> updateOrganizationDetails({
    required String organizationId,
    required token,
    String? url,
    String? name,
  }) async {
    await Future.delayed(Duration(seconds: 4));

    return {
      'code': 200,
      'message': 'no data',
    };
  }

  @override
  Future<Map<String, dynamic>> fetchPinnedMessgaes(roomId, orgId) async {
    await Future.delayed(Duration(seconds: 1));
    return {
      'links': ['6165848888888294bffc7a0d', '6165899559598294bffc7a0d'],
      'room_id': roomId
    };
  }
}
