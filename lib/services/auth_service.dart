import 'dart:convert';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/zuri_api/api.dart';

import 'local_storage_service.dart';


/// Auth Response storage key, to save the auth respone to local storage
const localAuthResponseKey = 'localAuthResponse';

/// Seleted Organization Storage key, 
/// to save/get the selected org list to/from local storage
const selectedOrgKey = 'SelectedOrgKey';


/// This class perform anything related to user authentication like
/// signup, login, request reset password code, 
/// reset password, validate user acount and so on.
class AuthService {
  final log = getLogger('AuthService');
  final _zuriApiService = locator<Api>();
  final _localStorageService = locator<LocalStorageService>();
  String _resetCode = '';
  Auth? auth;

  /// This method authenticate user and save the the response to local storage.
  Future<void> loginUser(
      {required String email, required String password}) async {
    final response =
        await _zuriApiService.login(email: email, password: password);
    log.i(response);
    auth = AuthResponse.fromJson(response).data!;
    _localStorageService.saveToDisk(localAuthResponseKey, jsonEncode(auth));
  }

  /// This function is used to create user account. 
  Future<void> signup({required String password, required String email, String? fName, String? lName}) async {
    await _zuriApiService.signup(email: email, password: password, fName: fName ?? '', lName: lName ?? '');
  }

  /// This function is used to confirm user email address. Hence varifing the user account
  Future<void> confirmEmail(String otpCode) async {
    await _zuriApiService.confirmEmail(otpCode: otpCode);
  }

  /// The function is used to request a password reset code in case user forget
  /// his/her password.
  Future<void> requestPasswordResetCode(String email) async {
    await _zuriApiService.requestPasswordResetCode(email: email);
  }

  /// This function is used to verify the reset password sent to the user to confirm
  /// the account they wish to change it password belongs to them.
  Future<void> verifyPasswordResetCode(String resetCode) async {
    _resetCode = resetCode;
    await _zuriApiService.verifyPasswordResetCode(resetCode: resetCode);
  }

  /// This function is used to update user password on request.
  Future<void> updateUserPassword(String password) async {
    await _zuriApiService.updateUserPassword(password: password, code: _resetCode);
  }

  /// The function is used to perform the logout action and it does so by destroying the user
  /// token and clearing the user auth response and selected organization from local storage
  void logOut(String token) async{
    _zuriApiService.signOut(token);
    _localStorageService.removeFromDisk(localAuthResponseKey);
    _localStorageService.removeFromDisk(selectedOrgKey);
  }
}
