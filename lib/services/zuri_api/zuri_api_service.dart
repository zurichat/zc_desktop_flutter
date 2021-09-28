import 'package:dio/dio.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/constants/app_api_constants.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/api/api_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/api.dart';

class ZuriApiService implements Api {
  final log = getLogger('ZuriApi');
  final _apiService = locator<ApiService>();
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUri.toString(),
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
    ),
  );

  ZuriApiService() {
    log.i('Zuri Api constructed and DIO setup register');
  }

  Future<dynamic> get(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    log.i('Making request to $uri');
    try {
      final response = await dio.get(uri.toString(),
          queryParameters: queryParameters, options: Options(headers: headers));

      //log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.response!.data['message']);
      throw Failure(error.response!.data['message']);
    } catch (error) {
      log.e(error.toString());
      throw Failure(error.toString());
    }
  }

  Future<dynamic> post(
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
      throw Failure(error.response!.data['message']);
    } catch (error) {
      log.e(error.toString());
      throw Failure(error.toString());
    }
  }

  Future<dynamic> put(
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
      throw Failure(error.message);
    } catch (error) {
      log.e(error.toString());
      throw Failure(error.toString());
    }
  }

  Future<dynamic> delete(Uri uri) async {
    log.i('Making request to $uri');
    try {
      final response = await dio.delete(uri.toString());

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
    await post(
      confirmEmailUri,
      body: {
        "code": otpCode,
      },
    );
  }

  @override
  Future<dynamic> login(
      {required String email, required String password}) async {
    return await post(
      signInUri,
      body: {
        "email": email,
        "password": password,
      },
    );
  }

  @override
  Future<void> requestPasswordResetCode({required String email}) async {
    await post(
      requestPasswordResetCodeUri,
      body: {"email": email},
    );
  }

  @override
  Future<void> signup({required String email, required String password}) async {
    await post(
      signupUri,
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  @override
  Future<void> updateUserPassword({required String password}) async {
    await post(
      verifyResetPasswordUri,
      body: {
        "password": password,
        "confirm_password": password,
      },
    );
  }

  @override
  Future<void> verifyPasswordResetCode({required String resetCode}) async {
    await post(
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
    await post(
      getAddUserToOrganizationUri(organizationId),
      body: {'user_email': email},
      headers: {'Authorization': 'Bearer ${token}'},
    );
  }

  @override
  Future<Map<String, dynamic>> createOrganizationUsingEmail(
      {String? email, token}) async {
    return await post(
      createOrganizationUri,
      body: {
        "creator_email": email,
      },
      headers: {'Authorization': 'Bearer ${token}'},
    );
  }

  @override
  Future<Organization> fetchOrganizationDetails(
      {required String organizationId, token}) async {
    final response = await get(
      getOrganisationUri(organizationId),
      headers: {
        'Authorization': 'Bearer ${token}',
      },
    );
    return Organization.fromJson(response['data']);
  }

  @override
  Future<List<Organization>> fetchOrganizationsListFromRemote(
      String email, token) async {
    final response = await get(
      getOrganizationsUri(email),
      headers: {'Authorization': "Bearer ${token}"},
    );
    return List.from(
      response['data'].map((map) => Organization.fromJson(map)).toList(),
    );
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
      {channel_id, senderId, message, organization_id}) {
    // TODO: implement sendMessageToChannel
    throw UnimplementedError();
  }

  @override
  Future<String> fetchChannelSocketId() {
    // TODO: implement fetchChannelSocketId
    throw UnimplementedError();
  }

  @override
  Future<List<Channel>> fetchChannelsListUsingOrgId({String? organizationId}) {
    // TODO: implement fetchChannelsListUsingOrgId
    throw UnimplementedError();
  }

  @override
  Future<void> addUserToChannel(
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
  Future<void> createChannelsUsingOrgId(
      {String? name, String? owner, String? description, bool? private}) {
    // TODO: implement createChannelsUsingOrgId
    throw UnimplementedError();
  }

  @override
  Future<List<ChannelMessage>> fetchChannelMessages() {
    // TODO: implement fetchChannelMessages
    throw UnimplementedError();
  }

  /* DIRECT MESSAGES SERVICE */

  @override
  Future<SendMessageResponse> sendMessageToDM({roomId, senderId, message}) {
    // TODO: implement sendMessageToDM
    throw UnimplementedError();
  }

  @override
  Future<void> markMessageAsRead(messageId) {
    // TODO: implement markMessageAsRead
    throw UnimplementedError();
  }

  @override
  Future<void> getRoomInfo({roomId}) {
    // TODO: implement getRoomInfo
    throw UnimplementedError();
  }

  @override
  Future<List<Results>> fetchRoomMessages({roomId}) {
    // TODO: implement fetchRoomMessages
    throw UnimplementedError();
  }

  @override
  Future<String?> createRoom({User? currentUser, DummyUser? user}) {
    // TODO: implement createRoom
    throw UnimplementedError();
  }
}
