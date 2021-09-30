import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/constants/app_api_constants.dart';
import 'package:zc_desktop_flutter/core/exceptions/http_exception.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/zuri_api/api.dart';

class ZuriApiService implements Api {
  final log = getLogger('ZuriApiService');
  final dio = Dio();

  ZuriApiService() {
    dio.options.baseUrl = baseUri.toString();
    dio.options.sendTimeout = sendTimeout;
    dio.options.receiveTimeout = receiveTimeout;
    log.i('Zuri Api constructed and DIO setup register');
  }

  Future<dynamic> _get(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    log.i('Making request to $uri');
    try {
      final response = await dio.get(uri.toString(),
          queryParameters: queryParameters, options: Options(headers: headers));

      log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.response!.data['message']);
      throw HttpException(error.response!.data['message']);
    } catch (error) {
      log.e(error.toString());
      throw HttpException(error.toString());
    }
  }

  Future<dynamic> _post(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    log.i('Making request to $uri');
    try {
      final response = await dio.post(uri.toString(),
          data: body, options: Options(headers: headers));

      log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.response!.statusCode);
      log.e(error.response!.data['message']);
      throw HttpException(error.response!.data['message']);
    } catch (error) {
      log.e(error.toString());
      throw HttpException(error.toString());
    }
  }

  Future<dynamic> _put(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    log.i('Making request to $uri');
    try {
      final response = await dio.put(uri.toString(),
          data: body, options: Options(headers: headers));

      log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.message);
      throw HttpException(error.message);
    } catch (error) {
      log.e(error.toString());
      throw HttpException(error.toString());
    }
  }

  Future<dynamic> _delete(Uri uri) async {
    log.i('Making request to $uri');
    try {
      final response = await dio.delete(uri.toString());

      log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.message);
      throw HttpException(error.message);
    } catch (error) {
      log.e(error.toString());
      throw HttpException(error.toString());
    }
  }

  Future<dynamic> _patch(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    log.i('Making request to $uri');
    try {
      final response = await dio.patch(
        uri.toString(),
        data: body,
        options: Options(headers: headers),
      );
      log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.message);
      throw Failure(error.message);
    } catch (error) {
      log.e(error.toString());
      throw Failure(error.toString());
    }
  }

  /* AUTH SERVICE */

  @override
  Future<void> confirmEmail({required String otpCode}) async {
    await _post(
      confirmEmailUri,
      body: {
        "code": otpCode,
      },
    );
  }

  @override
  Future<dynamic> login(
      {required String email, required String password}) async {
    return await _post(
      signInUri,
      body: {
        "email": email,
        "password": password,
      },
    );
  }

  @override
  Future<void> requestPasswordResetCode({required String email}) async {
    await _post(
      requestPasswordResetCodeUri,
      body: {"email": email},
    );
  }

  @override
  Future<void> signup({required String email, required String password}) async {
    await _post(
      signupUri,
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  @override
  Future<void> updateUserPassword({required String password}) async {
    await _post(
      verifyResetPasswordUri,
      body: {
        "password": password,
        "confirm_password": password,
      },
    );
  }

  @override
  Future<void> verifyPasswordResetCode({required String resetCode}) async {
    await _post(
      verifyResetPasswordUri,
      body: {"code": resetCode},
    );
  }

  /* ORGANIZATION SERVICE */

  @override
  Future<void> addLoggedInUserToOrganization(
      {required String organizationId,
      required String email,
      required token}) async {
    await _post(
      getAddUserToOrganizationUri(organizationId),
      body: {'user_email': email},
      headers: {'Authorization': 'Bearer ${token}'},
    );
  }

  @override
  Future<Map<String, dynamic>> createOrganizationUsingEmail(
      {required String email, required token}) async {
    return await _post(
      createOrganizationUri,
      body: {
        "creator_email": email,
      },
      headers: {'Authorization': 'Bearer ${token}'},
    );
  }

  @override
  Future<Organization> fetchOrganizationDetails(
      {required String organizationId, required token}) async {
    final response = await _get(
      getOrganisationUri(organizationId),
      headers: {
        'Authorization': 'Bearer ${token}',
      },
    );
    return Organization.fromJson(response);
  }

  @override
  Future<List<Organization>> fetchOrganizationsListFromRemote(
      {required String email, required token}) async {
    final response = await _get(
      getOrganizationsUri(email),
      headers: {'Authorization': "Bearer ${token}"},
    );

    log.i(response['data']);
    //return Organization.fromJson(json).
    return OrganizationResponse.fromJson(response).data!;
  }

  /* USER SERVICE */

  @override
  Future<User> fetchUserDetails({String? userId}) {
    // TODO: implement fetchUserDetails
    throw UnimplementedError();
  }

  /* CHANNEL SERVICE */

  @override
  Future sendMessageToChannel(
      {channel_id, senderId, message, organization_id}) async {
    return await _post(channelSendMessage(channel_id, organization_id), body: {
      "user_id": senderId,
      "content": message,
      "files": [],
      "event": {}
    });
  }

  @override
  Future<String> fetchChannelSocketId(
      {required String channelId,
      required String organizationId,
      required token}) async {
    String socketName = '';
    final response = await _get(
      getChannelSocketId(channelId, organizationId),
      headers: {'Authorization': 'Bearer ${token}'},
    );
    socketName = response['socket_name'] ?? '';
    return socketName;
  }

  @override
  Future<List<Channel>> fetchChannelsListUsingOrgId(
      {String? organizationId, required token}) async {
    final response = await _get(
      getCreateChannelUri(organizationId!),
      headers: {'Authorization': 'Bearer ${token}'},
    );
    log.i(response);
    return ChannelResponse.fromJson(response).data!;
  }

  @override
  Future<dynamic> addUserToChannel(organizationId, channelId,
      {String? id,
      String? role_id,
      bool? is_admin,
      String? prop1,
      String? prop2,
      String? prop3}) async {
    return await _post(
      getUserChannelUri(organizationId, channelId),
      body: {
        "_id": id,
        "role_id": role_id,
        "is_admin": is_admin,
        "notifications": {
          "additionalProp1": prop1,
          "additionalProp2": prop2,
          "additionalProp3": prop3
        },
      },
    );
  }

  @override
  Future<dynamic> createChannelsUsingOrgId(
      {required sessionId,
      required insertedOrganization,
      String? name,
      String? owner,
      String? description,
      bool? private}) async {
    return await _post(
      getCreateChannelUri(insertedOrganization),
      body: {
        "name": name,
        "owner": owner,
        "description": description,
        "private": private,
      },
      headers: {'Authorization': 'Bearer ${sessionId}'},
    );
  }

  @override
  Future<List<ChannelMessage>> fetchChannelMessages(
      {required String channelId, required String organizationId}) async {
    final response =
        await _get(channelFetchMessages(channelId, organizationId));
    return ChannelMessagesResponse.fromJson(response).data;
  }

  /* DIRECT MESSAGES SERVICE */

  @override
  Future<SendMessageResponse> sendMessageToDM(
      {roomId, senderId, message}) async {
    final response = await _post(dmSendMessage(roomId), body: {
      "sender_id": senderId,
      "room_id": roomId,
      "message": message,
      "media": [],
      "read": false,
      "pinned": false,
      "saved_by": [],
      "threads": [],
      "reactions": [],
      "created_at": DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
          .format(DateTime.now())
          .toString(),
    });

    return SendMessageResponse.fromJson(response);
  }

  @override
  Future<void> markMessageAsRead(messageId) async {
    final response = await _put(dmMarkMessageAsRead(messageId), body: {});
    var res = MarkMessageAsReadResponse.fromJson(response).read;
  }

  @override
  Future<void> getRoomInfo({roomId}) async {
    final response =
        await _get(dmGetRoomInfo, queryParameters: {'room_id': roomId});
    var res = RoomInfoResponse.fromJson(response).numberOfUsers;
    print("number of users: ${res}");
  }

  @override
  Future<List<Results>> fetchRoomMessages({roomId}) async {
    final response = await _get(dmFetchRoomMessages(roomId));
    return MessagesResponse.fromJson(response).results;
  }

  @override
  Future<String> createRoom({User? currentUser, DummyUser? user}) async {
    final response = await _post(
      dmCreateRoom,
      body: {
        "org_id": "1",
        "room_user_ids": [currentUser!.id, user!.id],
        "bookmarks": ["0"],
        "pinned": ["0"]
      },
    );
    return CreateRoomResponse.fromJson(response).roomId;
  }
}
