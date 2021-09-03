import 'package:stacked/stacked.dart';

import 'package:zc_desktop_flutter/app/app.logger.dart';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/ui/views/startup/startup_viewmodel.dart';

class MessageViewModel extends BaseViewModel {
  final log = getLogger("MessageViewwModel");

  String _userDefaultImageUrl = 'assets/images/zc_logo.png';
  int _numberOfReplies = 14;
  String _userDisplayName = 'Mark';

  String _emojiIcon = 'assets/images/🤘🏻.png';
  final String _userPost =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  String get userDefaultImageUrl => _userDefaultImageUrl;
  int get numberOfReplies => _numberOfReplies;
  String get userDisplayName => _userDisplayName;
  String get userPost => _userPost;
  String get emojiIcon => _emojiIcon;

  // TODO: 4, Remove after review
  final _storageService = locator<LocalStorageService>();

  // TODO: 5, Remove after review
  String get testString => _storageService.getFromDisk(testLocalKey) as String;
}
