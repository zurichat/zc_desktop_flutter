import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:intl/intl.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/constants/app_api_constants.dart';
import 'package:zc_desktop_flutter/core/exceptions/http_exception.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/zuri_api/api.dart';

class ZuriApiService implements Api {
  final log = getLogger('ZuriApiService');
  final dio = Dio();

  /// [Cache Options]
  /// At first, Return data from cache directly.
  /// Then In the next 24 hours
  /// - Get data from network first.
  /// - If getting data from network succeeds, refresh cache.
  /// - If getting data from network fails or no network avaliable, try get data from cache instead of an error
  /// Set this to true when you forcefully want cache to refresh, for example
  /// ... in the pull to refresh scenerio
  final cacheOptions = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.request,
    hitCacheOnErrorExcept: [401, 403],
    maxStale: const Duration(days: 1),
    priority: CachePriority.normal,
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    allowPostMethod: false,
  );

  ZuriApiService() {
    dio.options.baseUrl = baseUri.toString();
    dio.options.sendTimeout = sendTimeout;
    dio.options.receiveTimeout = receiveTimeout;

    /// This is used to effectively cache http response
    /// Find usage below in the get request

    dio
      ..interceptors.add(DioCacheInterceptor(
        options: cacheOptions,
      ));

    log.i('Zuri Api constructed and DIO setup register');
  }

  Future<dynamic> _get(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    log.i('Making request to $uri');
    try {
      final response = await dio.get(
        uri.toString(),
        queryParameters: queryParameters,
        options: cacheOptions.toOptions()..headers = headers,
      );

      //log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.response!.data);
      throw HttpException(error.response!.statusCode.toString());
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

      //log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.response!.statusCode);
      log.e(error.response!.data);
      throw HttpException(error.response!.statusCode.toString());
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

      //log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.message);
      throw HttpException(error.response!.statusCode.toString());
    } catch (error) {
      log.e(error.toString());
      throw HttpException(error.toString());
    }
  }

  // ignore: unused_element
  Future<dynamic> _delete(Uri uri) async {
    log.i('Making request to $uri');
    try {
      final response = await dio.delete(uri.toString());

      //log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.message);
      throw HttpException(error.response!.statusCode.toString());
    } catch (error) {
      log.e(error.toString());
      throw HttpException(error.toString());
    }
  }

  Future<dynamic> _patch(
    Uri uri, {
    required body,
    Map<String, String>? headers,
  }) async {
    log.i('Making request to $uri');
    try {
      final response = await dio.patch(
        uri.toString(),
        data: body,
        options: Options(headers: headers),
      );
      //log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.message);
      throw HttpException(error.response!.statusCode.toString());
    } catch (error) {
      log.e(error.toString());
      throw HttpException(error.toString());
    }
  }


  /* AUTH SERVICE */

  @override
  Future<void> confirmEmail({required String otpCode}) async {
    await _post(
      confirmEmailUri,
      body: {
        'code': otpCode,
      },
    );
  }

  @override
  Future<dynamic> login(
      {required String email, required String password}) async {
    return await _post(
      signInUri,
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  @override
  Future<void> requestPasswordResetCode({required String email}) async {
    await _post(
      requestPasswordResetCodeUri,
      body: {'email': email},
    );
  }

  @override
  Future<void> signup(
      {required String password,
      required String email,
      required String fName,
      required String lName}) async {
    await _post(
      signupUri,
      body: {
        'email': email,
        'password': password,
        'last_name': lName,
        'first_name': fName
      },
    );
  }

  @override
  Future<void> updateUserPassword(
      {required String password, required String code}) async {
    await _post(
      updatePasswordUri(code),
      body: {
        'password': password,
        'confirm_password': password,
      },
    );
  }

  @override
  Future<void> verifyPasswordResetCode({required String resetCode}) async {
    await _post(
      verifyResetPasswordUri,
      body: {'code': resetCode},
    );
  }

  /* ORGANIZATION SERVICE */

  @override
  Future<Map<String, dynamic>> addLoggedInUserToOrganization(
      {required String organizationId,
      required String email,
      required token}) async {
    await _post(
      getAddUserToOrganizationUri(organizationId),
      body: {'user_email': email},
      headers: {'Authorization': 'Bearer ${token}'},
    );
    throw UnimplementedError();
  }

  @override
  Future<dynamic> invitePeopleToOrganization(
      {required String organizationId,
      required List<String> email,
      required token}) async {
    return await _post(
      getInvitePeopleToOrganization(organizationId),
      body: {'emails': email},
      headers: {'Authorization': 'Bearer ${token}'},
    );
  }

  @override
  Future<Map<String, dynamic>> createOrganizationUsingEmail(
      {required String email, required token}) async {
    return await _post(
      createOrganizationUri,
      body: {
        'creator_email': email,
      },
      headers: {'Authorization': 'Bearer ${token}'},
    );
  }

  @override
  Future<Map<String, dynamic>> fetchOrganizationDetails(
      {required String organizationId, required token}) async {
    return await _get(
      getOrganisationUri(organizationId),
      headers: {
        'Authorization': 'Bearer ${token}',
      },
    );
  }

  @override
  Future<Map<String, dynamic>> fetchOrganizationsListFromRemote(
      {required String email, required token}) async {
    return await _get(
      getOrganizationsUri(email),
      headers: {'Authorization': 'Bearer ${token}'},
    );
  }



  /* CHANNEL SERVICE */

  @override
  Future sendMessageToChannel(
      {channel_id, senderId, message, organization_id}) async {
    return await _post(channelSendMessage(channel_id, organization_id), body: {
      'user_id': senderId,
      'content': message,
      'files': [],
      'event': {}
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
  Future<dynamic> fetchChannelsListUsingOrgId(
      {String? organizationId, required token}) async {
    return await _get(
      getCreateChannelUri(organizationId!),
      headers: {'Authorization': 'Bearer ${token}'},
    );
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
        '_id': id,
        'role_id': role_id,
        'is_admin': is_admin,
        'notifications': {
          'additionalProp1': prop1,
          'additionalProp2': prop2,
          'additionalProp3': prop3
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
      bool? private,
      String? topic,
      bool? defaultChannel}) async {
    return await _post(
      getCreateChannelUri(insertedOrganization),
      body: {
        'name': name,
        'owner': owner,
        'description': description,
        'private': private,
        'topic': topic,
        'default': defaultChannel
      },
      headers: {'Authorization': 'Bearer ${sessionId}'},
    );
  }

  @override
  Future<dynamic> fetchChannelMessages(
      {required String channelId, required String organizationId}) async {
    return await _get(channelFetchMessages(channelId, organizationId));
  }

  /* DIRECT MESSAGES SERVICE */

  @override
  Future<Map<String, dynamic>> sendMessageToDM(
      {roomId, senderId, message, orgId}) async {
    return await _post(dmSendMessage(roomId, orgId), body: {
      'sender_id': senderId,
      'room_id': roomId,
      'message': message,
      'media': [],
      'read': false,
      'pinned': false,
      'saved_by': [],
      'threads': [],
      'reactions': [],
      'created_at': DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
          .format(DateTime.now())
          .toString(),
    });
  }

  @override
  Future<Map<String, dynamic>> markMessageAsRead(messageId) async {
    return await _put(dmMarkMessageAsRead(messageId), body: {});
  }

  @override
  Future<Map<String, dynamic>> getRoomInfo({roomId}) async {
    return await _get(dmGetRoomInfo, queryParameters: {'room_id': roomId});
  }

  @override
  Future<Map<String, dynamic>> fetchRoomMessages({roomId, orgId}) async {
    var res = await _get(dmFetchRoomMessages(roomId, orgId));
    return res;
  }

  @override
  Future<Map<String, dynamic>> createRoom(
      {User? currentUser, Users? user, String? orgId}) async {
    return await _post(
      dmCreateRoom(orgId!, currentUser!.id),
      body: {
        'org_id': orgId,
        'room_member_ids': [currentUser.id, user!.id],
        'room_name': user.name,
      },
    );
  }

  @override
  Future<Map<String, dynamic>> updateOrganizationName({required String name, required String organizationId, required String token}) async {
    final response = await _patch( updateOrganizationNameUrl(organizationId),body: {
      'organization_name': name
    }, headers: {'Authorization': 'Bearer ${token}'},);
    log.i(response);
    return response;
  }

  @override
  Future<Map<String, dynamic>> updateOrganizationUrl({ required String url, required String organizationId, required String token}) async {
    final response = await _patch( getUpdateOrganizationUrl(organizationId),body: {
      'ur': url
    }, headers: {'Authorization': 'Bearer ${token}'},);
    log.i(response);
    return response;
  }

  @override
  Future<Map<String, dynamic>> reactToMessage(
      {orgId, roomId, messageId, required reactToMessage}) async {
    return await _post(
      dmReactToMessage(orgId, roomId, messageId),
      body: {
        'message_id': messageId,
        'sender_id': reactToMessage.senderId,
        'data': reactToMessage.data,
        'category': reactToMessage.category,
        'aliases': reactToMessage.aliases,
        'count': reactToMessage.count,
        'created_at': DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
            .format(DateTime.now())
            .toString()
      },
    );
  }

  @override
  Future fetchFileListUsingOrgId(
      {required String orgId, required token}) async {
    return await _get(
      getMemberUri(orgId),
      headers: {'Authorization': 'Bearer ${token}'},
    );
  }

  @override
  Future<List<Users>> fetchMemberListUsingOrgId(
      {required String organizationId, required token}) async {
    final response = await _get(
      getMemberUri(organizationId),
      headers: {'Authorization': 'Bearer ${token}'},
    );
    log.i('$response --------------------');
    return List.from(response['data'].map((value) => Users.fromJson(value)));
  }

  @override
  Future<dynamic> fetchDMs({orgId, userId}) async {
    return await _get(dmFetchDMs(orgId, userId));
  }

  @override
  Future<Map<String, dynamic>> getUserProfile({orgId, memberId}) async {
    return await _get(dmUserProfile(orgId, memberId));
  }

  Future<List<Todo>> fetchTodoList() async {
    final response = await _get(getAllTodoUri);
    log.i(response);
    return List.from(response.map((value) => Todo.fromJson(value)));
  }

  @override
  Future<void> createTodo(Todo todo, String token) async {
    final response = await _post(createTodoUri, body: todo.toJson());
    log.i(response);
  }

  Future<void> signOut(String token) async {
    final response = await _post(
      signOutUri,
      body: {},
      headers: {'Authorization': 'Bearer $token'},
    );
    log.i(response);
  }

  @override
  Future removeUserFromChannel(
      {required organizationId, required channelId, required memberId}) {
    // TODO: implement removeUserFromChannel
    throw UnimplementedError();
  }

  @override
  Future<void> fetchMemberDetail(
      {required String organizationId,
      required String memberId,
      required String token}) async {
    final uri = getMemberIdUri(organizationId, memberId);
    final response =
        await _get(uri, headers: {'Authorization': 'Bearer $token'});

    Member member = Member.fromJson(response['data']);
    log.i(member);
  }

  @override
  Future<Map<String, dynamic>> updateUserDetail(
      {required organizationId,
      required memberId,
      required token,
      String? bio,
      String? displayName,
      String? firstName,
      String? lastName,
      String? phoneNumber,
      String? pronoun}) async {
    final uri = updateUserProfile(organizationId, memberId);
    Map<String, dynamic> data = {
      'bio': bio,
      'display_name': displayName,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phoneNumber,
      'pronouns': pronoun,
    };
    final response = await _patch(
      uri,
      body: data,
      headers: {
        // ignore: prefer_single_quotes
        "Content-Type": "application/json",
        // ignore: prefer_single_quotes
        "Accept": "application/json",
        'Authorization': 'Bearer ${token}',
      },
    );
    return response;
  }

  @override
  Future<void> updateUserPicture({
    required organizationId,
    required memberId,
    required token,
    required File url,
  }) async {
    final uri = updateUserProfilePicture(organizationId, memberId);
    // String fileName = url.path.split('/').last;
    FormData formData = FormData.fromMap({'file': await MultipartFile.fromFile(url.path)});
    final response = await _patch(
      uri,
      body: formData,
      headers: {
        'Content-Type': 'image',
        'Authorization': 'Bearer ${token}',
      },
    );
    return response.data['id'];
  }

  @override
  Future<Map<String, dynamic>> deleteOrganization(
      {required String organizationId, required token}) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> updateOrganizationDetails(
      {required String organizationId,
      required token,
      String? url,
      String? name}) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> pinMessage(messageId, orgId) async {
    final uri = pinMessageUrl(messageId, orgId);

    return await _put(
      uri,
      body: {},
    );
  }

  @override
  Future<Map<String, dynamic>> fetchPinnedMessgaes(roomId, orgId) async {
    final uri = fetchPinnedMessagesUrl(roomId, orgId);

    return await _get(uri);
  }
  
}
