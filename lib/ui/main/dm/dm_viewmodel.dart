import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';

class DmViewModel extends BaseViewModel {
  final log = getLogger("DmViewModel");
  final DateTime currentMessageTime = DateTime.now();
  List<Message> _messages = [];
  List<Message> get messages => _messages;
  bool _onMessageTileHover = false;
  bool get onMessageTileHover => _onMessageTileHover;
  bool _onHoverActionsHovered = false;
  bool get onHoverActionsHover => _onHoverActionsHovered;

  void onMessageHovered(bool hover) {
    _onMessageTileHover = hover;
    notifyListeners();
  }

  void onHoverActionsHovered(bool hover) {
    _onHoverActionsHovered = hover;
    notifyListeners();
  }

  void sendMessage(String message) {
    _messages.add(Message(
        message: message,
        time: '9.12 PM',
        userDisplayName: 'Dennis',
        userProfileUrl: 'https://gravatar.com/avatar/3cf766c59c42f3bdb00bdc874a5a55e3?s=200&d=retro&r=g'));
    notifyListeners();
  }
}

class Message {
  final String userProfileUrl;
  final String userDisplayName;
  final String message;
  final String time;

  Message(
      {required this.message,
      required this.time,
      required this.userDisplayName,
      required this.userProfileUrl});
}
