import 'dart:convert';

import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';

import '../app/app.locator.dart';
import 'api/api_service.dart';
import 'local_storage_service.dart';

const localAuthResponseKey = 'localAuthResponse';

@LazySingleton()
class AuthService {
  final _localStorageService = locator<LocalStorageService>();
  final _apiService = locator<ApiService>();

  AuthResponse? authResponse;

  Future<void> signup({required String password, required String email}) async {
    await _apiService.post(
      _apiService.apiConstants.signupUri,
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  Future<void> confirmEmail(String otp) async {
    await _apiService.post(
      _apiService.apiConstants.confirmEmailUri,
      body: {
        "code": otp,
      },
    );
  }

  Future<void> login(String email, String password) async {
    final response = await _apiService.post(
      _apiService.apiConstants.signinUri,
      body: {
        "email": email,
        "password": password,
      },
    );
    print(response);

    authResponse = AuthResponse.fromJson(response['data']);

    _localStorageService.saveToDisk(
        localAuthResponseKey, jsonEncode(response['data']));
  }

  Future<void> getResetCode(String email) async {
    await _apiService.post(
      _apiService.apiConstants.requestPasswordResetCodeUri,
      body: {"email": email},
    );
  }

  Future<void> confirmResetCode(String code) async {
    await _apiService.post(
      _apiService.apiConstants.verifyResetPasswordUri,
      body: {"code": code},
    );
  }

  Future<void> updatePassword(String password) async {
    await _apiService.post(
      _apiService.apiConstants.verifyResetPasswordUri,
      body: {
        "password": password,
        "confirm_password": password,
      },
    );
  }

  void logOut() {
    _localStorageService.removeFromDisk(localAuthResponseKey);
  }
}
