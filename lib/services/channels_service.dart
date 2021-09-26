import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/services/api/api_service.dart';


const localAuthResponseKey = 'localAuthResponse';

class ChannelsService {
  final _apiService = locator<ApiService>();

  Future<void> createChannel({
    required String name,
    required String owner,
    required String description,
    required bool private,
  }) async {
    // await _apiService.post(_apiService.apiConstants.createChannelUri, body: {
    //   "name": name,
    //   "owner": owner,
    //   "description": description,
    //   "private": false
    // });
  }
}
