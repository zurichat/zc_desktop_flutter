
import 'dart:async';
import 'dart:convert';
import 'package:stacked/stacked_annotations.dart';
import '../../app/app.locator.dart';
import '../../models/auth_response.dart';
import '../api/api_service.dart';
import '../local_storage/local_storage_service.dart';

const localAuthResponseKey = 'localAuthResponse';
const localAuthDetailsKey = 'auth';

@LazySingleton()
class AuthService {
  final _localStorageService = locator<LocalStorageService>();
  final _apiService = locator<ApiService>();
  AuthResponse? authResponse;

  Future<void> signup({
    required String password,
    required String email,
  }) async {
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
    
    authResponse = AuthResponse.fromMap(response['data']);

    _localStorageService.saveToDisk(localAuthResponseKey,jsonEncode(response['data']));
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
