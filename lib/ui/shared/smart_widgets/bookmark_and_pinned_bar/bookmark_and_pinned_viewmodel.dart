import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class BookmarkAndPinnedMessagesViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final String urlLink = '';

  bool _isDropped = false;
  bool _isHover = false;
  bool _isMessagePinned = false;
  bool _isBookmarkDecoyVisible = false;
  bool _isOriginalBookmarkVisible = true;
  bool _isDecoyForPinnedMessageVisible = false;
  //---
  bool get isDecoyForPinnedMessageVisible => _isDecoyForPinnedMessageVisible;
  bool get isOriginalBookmarkVisible => _isOriginalBookmarkVisible;
  bool get isBookmarkDecoyVisible => _isBookmarkDecoyVisible;
  bool get isMessagePinned => _isMessagePinned;
  bool get isDropped => _isDropped;
  bool get isHover => _isHover;
  setIsDropped(bool value) {
    _isDropped = value;
    notifyListeners();
  }

  onEntered(bool isHover) {
    _isHover = isHover;
    notifyListeners();
  }

  onPinnedMessage(bool isMessagePinned) {
    _isMessagePinned = isMessagePinned;
    notifyListeners();
  }

  displayDecoyForPinnedMessage(bool isDecoyForPinnedMessageVisible) {
    _isDecoyForPinnedMessageVisible = isDecoyForPinnedMessageVisible;
    notifyListeners();
  }

  displayOriginalBookmark(bool isOriginalBookmarkVisible) {
    _isOriginalBookmarkVisible = isOriginalBookmarkVisible;
    notifyListeners();
  }

  displayDecoyForAddBookmark(bool isBookmarkDecoyVisible) {
    _isBookmarkDecoyVisible = isBookmarkDecoyVisible;
    notifyListeners();
  }

  void popDialog() {
    _navigationService.popRepeated(0);
  }

  void launchBookmarkedUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch the $url';
    }
  }
}
