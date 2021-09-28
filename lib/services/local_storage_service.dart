import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }

    if (_preferences == null) {
      WidgetsFlutterBinding.ensureInitialized();
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance!;
  }

  Future<void> saveToDisk<T>(String key, T content) async {
    // print('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');

    if (content is String) {
      await _preferences!.setString(key, content);
    }
    if (content is bool) {
      await _preferences!.setBool(key, content);
    }
    if (content is int) {
      await _preferences!.setInt(key, content);
    }
    if (content is double) {
      await _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      await _preferences!.setStringList(key, content);
    }
  }

  Object? getFromDisk(String key) {
    final value = _preferences!.get(key);
    //print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  Future<bool> removeFromDisk(String key) async {
    final value = await _preferences!.remove(key);
    //print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }
}
