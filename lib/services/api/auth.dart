import 'dart:convert';
import 'package:zc_desktop_flutter/services/api/api_service.dart';
import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';

class Auth {
  LocalStorageService _localStorageService = LocalStorageService();
  String _token = '';
  String _userId = '';
  ApiService _apiService = ApiService();
  String get token => _token;
  String get userId => _userId;

  Future<void> signUpWithCred(
      {required String fname,
      required String lname,
      required String username,
      required String password,
      required String tel,
      required String email}) async {

        try {
          await _apiService.post('/users', {
            'first_name': fname,
            'last_name': lname,
            'display_name': username,
            'email': email,
            'password': password,
            'phone': tel
          });
        } catch(e) {
          print(e);
        }
  }

  Future<void> loginWithCred(String email, String password) async {
    final responseData = await _apiService.post('/auth/login', {"email": email, "password": password});
    
    try {
      _token = responseData['data']['token'];
     _userId = responseData['data']['user']['id'];
     final userData = json.encode({
       'token': _token,
        'userId': _userId,
        'password': password,
        'email': email,
      });
      _localStorageService.saveToDisk('userData', userData);
    } catch(e) {
      print(e);
    }
  }
}
