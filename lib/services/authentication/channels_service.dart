import 'package:stacked/stacked_annotations.dart';

import '../../app/app.locator.dart';
import '../../models/auth_response.dart';
import '../api/api_service.dart';
import '../local_storage/local_storage_service.dart';

const localAuthResponseKey = 'localAuthResponse';

@LazySingleton()
class ChannelsService {
  // final _localStorageService = locator<LocalStorageService>();
  final _apiService = locator<ApiService>();

  // AuthResponse? authResponse;

  Future<void>createChannel({
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
        "private": false
        }
    );
  }


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
