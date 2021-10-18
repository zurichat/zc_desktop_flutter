import 'dart:convert';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/zuri_api/api.dart';

import 'local_storage_service.dart';

const localAuthResponseKey = 'localAuthResponse';
const selectedOrgKey = 'SelectedOrgKey';

class AuthService {
  final log = getLogger('AuthService');
  final _zuriApiService = locator<Api>();
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

  Future<void> signup({required String password, required String email, String? fName, String? lName}) async {
    await _zuriApiService.signup(email: email, password: password, fName: fName ?? '', lName: lName ?? '');
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

  void logOut(String token) async{
    _zuriApiService.signOut(token);
    _localStorageService.removeFromDisk(localAuthResponseKey);
    _localStorageService.removeFromDisk(selectedOrgKey);
  }
}
