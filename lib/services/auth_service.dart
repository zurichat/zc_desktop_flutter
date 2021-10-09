import 'dart:convert';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/zuri_api/zuri_api_service.dart';


import 'local_storage_service.dart';

const localAuthResponseKey = 'localAuthResponse';

class AuthService {
  final log = getLogger('AuthService');
  final _zuriApiService = locator<ZuriApiService>();
  final _localStorageService = locator<LocalStorageService>();
  String _resetCode = '';
  Auth? auth;

  Future<void> loginUser(
      {required String email, required String password}) async {
    final response =
        await _zuriApiService.login(email: email, password: password);
    log.i(response);
    auth = AuthResponse.fromJson(response).data!;
    _localStorageService.saveToDisk(localAuthResponseKey, jsonEncode(auth));
  }

  Future<void> signup({required String password, required String email}) async {
    await _zuriApiService.signup(email: email, password: password);
  }

  Future<void> confirmEmail(String otpCode) async {
    await _zuriApiService.confirmEmail(otpCode: otpCode);
  }

  Future<void> requestPasswordResetCode(String email) async {
    await _zuriApiService.requestPasswordResetCode(email: email);
  }

  Future<void> verifyPasswordResetCode(String resetCode) async {
    _resetCode = resetCode;
    await _zuriApiService.verifyPasswordResetCode(resetCode: resetCode);
  }

  Future<void> updateUserPassword(String password) async {
    await _zuriApiService.updateUserPassword(password: password, code: _resetCode);
  }

  void logOut() {
    _localStorageService.removeFromDisk(localAuthResponseKey);
  }
}
