import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/models/auth_response.dart';
import 'package:zc_desktop_flutter/services/api/api_service.dart';
import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';

const localAuthResponseKey = 'localAuthResponse';

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

    _localStorageService.saveToDisk(localAuthResponseKey, response['data']);
  }
}
