import 'dart:convert';

import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/channels/channels_datamodel.dart';
import 'package:zc_desktop_flutter/models/user.dart';
import '../../app/app.locator.dart';
import '../../models/auth_response.dart';
import '../api/api_service.dart';
import '../local_storage/local_storage_service.dart';

const localAuthResponseKey = 'localAuthResponse';

@LazySingleton()
class ChannelsService {
  final log = getLogger('ChannelsApiService');

  //Declare the services that are dependent upon
  final _localStorageService = locator<LocalStorageService>();
  final _apiService = locator<ApiService>();
  User? user;
  AuthResponse? userdata;
  
  // final storageService = locator<SharedPreferenceLocalStorage>();
  // final _userService = locator<UserService>();

  // The function for Channels api calls can go in here
  // https://channels.zuri.chat/api/v1/61459d8e62688da5302acdb1/channels/

  
  //final _api = HttpApiService(channelsBaseUrl);

  Future<List<ChannelsDataModel>> getChannelsList() async {
    // final userId = _userService.userId;
    // final orgId = _userService.currentOrgId;

    // final authResponse = _localStorageService.getFromDisk(localAuthResponseKey);
    // final res = AuthResponse.fromMap(jsonDecode(authResponse as String));


    userdata = AuthResponse.fromMap(json.decode(_localStorageService.getFromDisk('localAuthResponse').toString()));
    user = userdata!.user;
    List<ChannelsDataModel> joinedChannels = [];

    try {
      final res = await _apiService.get(
        _apiService.apiConstants.createChannelUri,
        headers: {'Authorization': 'Bearer ${user!.token}'},
      );
      joinedChannels = res?.data ?? [];
      log.i(joinedChannels);
    } on Exception catch (e) {
      log.e(e.toString());
      return [];
    }

    return joinedChannels;
  }


  Future<void> createChannels({
    required String name,
    required String owner,
    required String description,
    required bool private,
  }) async {
      await _apiService.post(
        _apiService.apiConstants.createChannelUri,
        body: {
          "name": name,
          "owner": owner,
          "description": description,
          "private": private,
        },
        // headers: {'Authorization': 'Bearer ${resUser.user.token}'},
      );

    //   log.i(res?.data.toString());

    //   if (res?.statusCode == 201 || res?.statusCode == 200) {
    //     // onChange.sink.add('created channel');
    //     print('success');
    //     return true;
    //   }
    // } on Exception catch (e) {
    //   print('failure');
    //   log.e(e.toString());
    // }

    // return false;
  }


  // String? get token =>
  //     storageService.getString(StorageKeys.currentSessionToken);

  // Future<void>createChannel({
  //   required String name,
  //   required String owner,
  //   required String description,
  //   required bool private,
  // }) async {
  //   await _apiService.post(
  //     _apiService.apiConstants.createChannelUri,
  //     body: {
  //       "name": name,
  //       "owner": owner,
  //       "description": description,
  //       "private": false
  //       }
  //   );
  // }

// final authResponse = _localStorageService.getFromDisk(localAuthResponseKey);
// fnal res = AuthResponse.fromMap(jsonDecode(authResponse as String));

  // Future<void> login(String email, String password) async {
  //   final response = await _apiService.post(
  //     _apiService.apiConstants.signinUri,
  //     body: {
  //       "email": email,
  //       "password": password,
  //     },
  //   );

  //   authResponse = AuthResponse.fromMap(response['data']);

  //   _localStorageService.saveToDisk(localAuthResponseKey, response['data']);
  // }



}
