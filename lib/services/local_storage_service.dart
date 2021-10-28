import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;
  static const String authResponseKey = 'localAuthResponse';
  static const String prefAccessibilityKey = 'accessibilitySettings';
  static const String prefAdvancedKey = 'advancedSetting';
  static const String prefAudioKey = 'audioSetting';
  static const String prefMessageMediaKey = 'messageMediaSetting';
  static const String prefNotificationKey = 'notificationSetting';
  static const String prefSideBarKey = 'sideBarSetting';
  static const String prefThemesKey = 'themesSetting';
  static const String organizationResponseKey = 'localOrganizationResponse';


  //AuthResponse getter
  AuthResponse? get authResponse {
    var authResponseJson = getFromDisk(authResponseKey);
    if (authResponseJson == null) {
      return null;
    }
    return AuthResponse.fromJson(jsonDecode(authResponseJson.toString()));
  }

  //AuthResponse setter
  void setAuthResponse(AuthResponse? authResponseToSave) =>
      saveToDisk(authResponseKey, jsonEncode(authResponseToSave.toString()));
      

  //Remove AuthResponse

  void removeAuthResponse() => removeFromDisk(authResponseKey);

  //Pref Accessibility getter
  Accessibility? get accessibility {
    var accessibilityResponseJson = getFromDisk(prefAccessibilityKey);
    if (accessibilityResponseJson == null) {
      return null;
    }
    return Accessibility.fromJson(
        jsonDecode(accessibilityResponseJson.toString()));
  }

  //Pref Accessibility setter
  void setAccessibility(Accessibility? accessibilityResponseToSave) => saveToDisk(
      prefAccessibilityKey, jsonEncode(accessibilityResponseToSave!.toJson()));

  //Pref Advanced getter
  Advanced? get advanced {
    var advanceResponseJson = getFromDisk(prefAdvancedKey);
    if (advanceResponseJson == null) {
      return null;
    }
    return Advanced.fromJson(jsonDecode(advanceResponseJson.toString()));
  }

  //Pref Advanced setter
  void setAdvanced(Advanced? advanced) =>
      saveToDisk(prefAdvancedKey, jsonEncode(advanced!.toJson()));

  //Pref AudioAndVideo getter
  AudioAndVideo? get audiodAndVideo {
    var audioResponseJson = getFromDisk(prefAudioKey);
    if (audioResponseJson == null) {
      return null;
    }
    return AudioAndVideo.fromJson(jsonDecode(audioResponseJson.toString()));
  }

  //Pref AudioAndVideo setter
  void setAudioAndVideo(AudioAndVideo? audioAndVideo) =>
      saveToDisk(prefAudioKey, jsonEncode(audioAndVideo!.toJson()));

  //Pref MessageAndMedia getter
  MessagesAndMedia? get messagesAndMedia {
    var messageResponseJson = getFromDisk(prefMessageMediaKey);
    if (messageResponseJson == null) {
      return null;
    }
    return MessagesAndMedia.fromJson(
        jsonDecode(messageResponseJson.toString()));
  }

  //Pref MessageAndMedia setter
  void setMessagesAndMedia(MessagesAndMedia? media) =>
      saveToDisk(prefMessageMediaKey, jsonEncode(media!.toJson()));

  //Pref Notification getter

  Notifications? get notification {
    var notificationResponseJson = getFromDisk(prefNotificationKey);
    if (notificationResponseJson == null) {
      return null;
    }
    return Notifications.fromJson(
        jsonDecode(notificationResponseJson.toString()));
  }

  //Prer Notification setter
  void setNotification(Notifications? notification) =>
      saveToDisk(prefNotificationKey, jsonEncode(notification!.toJson()));

  //Pref Sidebar getter
  SideBar? get sideBar {
    var sideBarResponseJson = getFromDisk(prefSideBarKey);
    if (sideBarResponseJson == null) {
      return null;
    }
    return SideBar.fromJson(jsonDecode(sideBarResponseJson.toString()));
  }

  //Pref Sidebar setter
  void setSideBar(SideBar? sideBar) =>
      saveToDisk(prefSideBarKey, jsonEncode(sideBar!.toJson()));

  //Pref Theme getter

  Themes? get themes {
    var themesResponseJson = getFromDisk(prefThemesKey);
    if (themesResponseJson == null) {
      return null;
    }
    return Themes.fromJson(jsonDecode(themesResponseJson.toString()));
  }

  //Pref Theme setter

  void setThemes(Themes? themes) =>
      saveToDisk(prefThemesKey, jsonEncode(themes!.toJson()));

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }

    if (_preferences == null) {
      WidgetsFlutterBinding.ensureInitialized();
      // WidgetsFlutterBinding.ensureInitialized();
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance!;
  }

  Future<void> saveToDisk<T>(String key, T content) async {
    // print('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');
    //print('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');

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

  OrganizationResponse? get organizationResponse {
    var organizationResponseJson = getFromDisk(organizationResponseKey);
    if (organizationResponseJson == null) {
      return null;
    }
    return OrganizationResponse.fromJson(jsonDecode(organizationResponseJson.toString()));
  }

  //OrgResponse setter
  void setOrganizationResponse(OrganizationResponse? organizationResponseToSave) =>
      saveToDisk(organizationResponseKey, jsonEncode(organizationResponseToSave.toString()));
    
}
