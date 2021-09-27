import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/user.dart';
import 'package:zc_desktop_flutter/services/api/api_service.dart';

class UserService {
  final log = getLogger("UserService");
  final _apiService = locator<ApiService>();

  Future<User> getUserDetails(String? id) async {
    final response =
        await _apiService.get(Uri.parse("https://api.zuri.chat/users/$id}"));
    return User.fromMap(response);
  }
}
