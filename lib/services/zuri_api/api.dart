import 'package:zc_desktop_flutter/model/app_models.dart';

/// Describes the methods and properties required to create an HttpProvider that the application can use
abstract class Api {
  /* AUTH SERVICE */

  /// returns [Future]<[dynamic]>, log in user.
  ///
  /// post request;
  ///
  ///
  /// parameters; [String] email and [String] password
  Future<dynamic> login({required String email, required String password});

  /// returns [Future]<[void]>, Sign up user.
  ///
  /// post request;
  ///
  ///
  /// parameters; [String] email and [String] password
  Future<void> signup({required String email, required String password});

  /// returns [Future]<[void]>, confirm user email.
  ///
  /// post request;
  ///
  ///
  /// parameters; [String] otpCode
  Future<void> confirmEmail({required String otpCode});

  /// returns [Future]<[void]>, Request code to perform password reset.
  ///
  /// post request;
  ///
  ///
  /// parameters; [String] email
  Future<void> requestPasswordResetCode({required String email});

  /// returns [Future]<[void]>, Verify requested password reset code.
  ///
  /// post request;
  ///
  ///
  /// parameters; [String] resetCode
  Future<void> verifyPasswordResetCode({required String resetCode});

  /// returns [Future]<[void]>, Update user password.
  ///
  /// post request;
  ///
  ///
  /// parameters; [String] password
  Future<void> updateUserPassword({required String password});

  /* ORGANIZATION SERVICE */

  /// returns [Future]<[List]<[Organization]>>, fetch a list of organizations from remote source,
  ///
  /// get request;
  ///
  /// function parameters; [String] email, token.
  Future<List<Organization>> fetchOrganizationsListFromRemote(
      {required String email, required token});

  /// returns [Future]<[void]>, add logged in user to organization.
  ///
  /// post request;
  /// * body: {logged in user email, headers: logged in user token}.
  ///
  /// function parameters; [String] organizationId, [String] email, token
  Future<void> addLoggedInUserToOrganization(
      {required String organizationId, required String email, required token});

  /// returns [Future]<[Map]<[String]>>, dynamic>>, create an organization using email.
  ///
  /// post request;
  /// * body: {creator email: [email]}
  ///
  /// function parameters; [String] email, token.
  Future<Map<String, dynamic>> createOrganizationUsingEmail(
      {required String email, required token});

  /// returns [Future]<[Organization]>, private function to get a single organization details from remote
  /// source using organization id.
  ///
  /// post request;
  /// * headers: {"Authorization": logged in user token}
  ///
  /// function parameters; [String] organizationId, token
  Future<Organization> fetchOrganizationDetails(
      {required String organizationId, required token});

  /* CHANNEL SERVICE */

  /// returns [Future]<[List]<[Channel]>>, get list of channels associated with an organization
  /// from remote source using the organizations id.
  ///
  /// get request;
  /// * headers: {"Authorization": logged in user token}
  ///
  /// function parameters; [String] organizationId, token
  Future<List<Channel>> fetchChannelsListUsingOrgId(
      {required String organizationId, required token});

  /// returns [Future]<[dynamic]>, create channel in current organization using organization id.
  ///
  /// post request;
  /// * body: {"name": [name], "owner": [owner], "description": [description], "private": [private]}
  /// * headers: {"Authorization" : logged in user token}.
  ///
  /// function parameters; [String] name, [String] owner, [String] description, [String] private. sessionId,
  /// insertedOrganization.
  Future<dynamic> createChannelsUsingOrgId(
      {required sessionId,
      required insertedOrganization,
      String? name,
      String? owner,
      String? description,
      bool? private});

  /// returns [Future]<[void]>, adds a user to channel using current organization id and current channel id.
  ///
  /// post request;
  /// * body: {"id": [id], "role_id": [role_id], "is_admin": [is_admin],
  /// "prop1": [prop1], "prop2": [prop2], "prop3": [prop3]}
  ///
  /// function parameters; [String] id, [String] role_id, [String] is_admin, [String] prop1, [String] prop2, [String] prop3.
  Future<void> addUserToChannel(organizationId, channelId,
      {String id,
      String role_id,
      bool is_admin,
      String prop1,
      String prop2,
      String prop3});

  /// returns [Future]<[dynamic]>, send message to channel using channel id, sender id and org id.
  ///
  /// post request;
  /// * body: {"user_id": [senderId], "content": [message], "files": [], "event": {}}.
  ///
  /// function parameters: [var] channel_id, [var] senderId, [var] message, [var] organization_id
  Future<dynamic> sendMessageToChannel(
      {var channel_id, var senderId, var message, var organization_id});

  /// returns [Future]<[List]<[ChannelMessage]>>, fetch messages in channel from remote source using organization id
  /// and channel id.
  ///
  /// get request;
  ///
  /// query parameters; organization id, channel id
  ///
  /// function parameters; [String] channelId, [String] organizationId
  Future<List<ChannelMessage>> fetchChannelMessages(
      {required String channelId, required String organizationId});

  /// returns [Future]<[String]>, to get socket id of a channel using channel id and organization id associated with it.
  ///
  /// get request;
  /// * headers: {"Authorization": logged in user token}.
  ///
  /// function parameters; [String] channelId, [String] organization id, token.
  Future<String> fetchChannelSocketId(
      {required String channelId,
      required String organizationId,
      required token});

  /* USER SERVICE */

  /// returns [Future]<[User]>, get a single user details using the users id from remote source.
  ///
  /// get request;
  ///
  /// function parameters; none.
  Future<User> fetchUserDetails({String? userId});

  /* DIRECT MESSAGES SERVICE */

  /// returns [Future]<[SendMessageResponse]>, send message to DM using room id and logged in user id or senderId.
  ///
  /// post request;
  /// * body: {}
  ///
  /// query parameters; roomid
  ///
  /// function parameters;
  Future<SendMessageResponse> sendMessageToDM(
      {var roomId, var senderId, var message});

  /// returns [Future]<[String]>, create a room using organization id.
  ///
  /// post request;
  /// * body: {}
  ///
  /// parameters;
  Future<String> createRoom({User currentUser, DummyUser user});

  /// returns [Future]<[void]>, get a particular room info using room id.
  ///
  /// get request;
  ///
  /// parameters;
  Future<void> getRoomInfo({var roomId});

  /// returns [Future]<[List]<[Results]>>, fetch messages in a room from remote source using room id.
  Future<List<Results>> fetchRoomMessages({var roomId});

  /// returns [Future]<[void]>, mark a message as read and reflect those changes in remote source.
  ///
  /// put request;
  ///
  /// parameters;
  Future<void> markMessageAsRead(var messageId);

/* CENTRIFUGE SERVICE */

}
