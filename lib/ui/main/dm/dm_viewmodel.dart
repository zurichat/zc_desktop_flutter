import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/dm_model/messages_response.dart';
import 'package:zc_desktop_flutter/models/dummy_user_model/user_model.dart';
import 'package:zc_desktop_flutter/models/user.dart' as LoggedInUser;
import 'package:zc_desktop_flutter/services/dm_service/dm_service.dart';

class DmViewModel extends BaseViewModel {
  final log = getLogger("DmViewModel");
  final _dmService = locator<DMService>();
  User _user = User(name: "");
  late LoggedInUser.User _currentLoggedInUser;
  String? _roomId = '';
  List<Results> _messages = [];

  void setup() {
    runTask();
  }

  void runTask() async {
    _user = await runBusyFuture(_dmService.getUser());
    _currentLoggedInUser = _dmService.getCurrentLoggedInUser()!;
    _roomId = await _dmService.createRoom();
    _dmService.getRoomInfo(_roomId);
    _messages = await _dmService.fetchRoomMessages(_roomId);
    //_dmService.markMessageAsRead('614b1e8f44a9bd81cedc0a29');
    log.i(_user.name);
    notifyListeners();
  }

  String? getChatUserName() {
    if (_user.name!.isNotEmpty) {
      return _user.name;
    }

    return 'No data';
  }

  User get user => _user;
  String get roomId => _roomId!;
  LoggedInUser.User get currentLoggedInUser => _currentLoggedInUser;
  final DateTime currentMessageTime = DateTime.now();

  List<Results> get messages => _messages;
  bool _onMessageTileHover = false;

  bool get onMessageTileHover => _onMessageTileHover;
  bool _onHoverActionsHovered = false;

  bool get onHoverActionsHover => _onHoverActionsHovered;
  int _onMessageHoveredIndex = 0;

  int get onMessageHoveredIndex => _onMessageHoveredIndex;

  String _hoverAction = '';
  String get hoverAction => _hoverAction;
  double _hoverWidth = 0;
  double get hoverWidth => _hoverWidth;

  void onMessageHovered(bool hover, int index) {
    _onMessageTileHover = hover;
    _onMessageHoveredIndex = index;
    notifyListeners();
  }

  void onHoverActionsHovered(bool hover, String action, double width) {
    _onHoverActionsHovered = hover;
    _hoverAction = action;
    _hoverWidth = width;
    notifyListeners();
  }

  Future<void> sendMessage(String message) async {
    _messages.add(Results(
      reactions: [],
      id: '',
      createdAt: '',
      threads: [],
      media: [],
      pinned: false,
      senderId: '1',
      message: message,
      savedBy: [],
      read: true,
      roomId: _roomId!,
    ));
    await _dmService.sendMessage(_roomId, '1', message);

    notifyListeners();
  }

  LoggedInUser.User getUser(var senderId) {
    if (_currentLoggedInUser.id == senderId) {
      return _currentLoggedInUser;
    } else {
      return _currentLoggedInUser; //check this functionality
    }
  }

  void reactToMessage(int messageIndex, int reactionIndex) {
    /* if (_messages
        .elementAt(messageIndex)
        .reactions
        .elementAt(reactionIndex)
        .isReacted) {
      _messages
          .elementAt(messageIndex)
          .reactions
          .elementAt(reactionIndex)
          .count = _messages
              .elementAt(messageIndex)
              .reactions
              .elementAt(reactionIndex)
              .count -
          1;
      _messages
              .elementAt(messageIndex)
              .reactions
              .elementAt(reactionIndex)
              .isReacted =
          !_messages
              .elementAt(messageIndex)
              .reactions
              .elementAt(reactionIndex)
              .isReacted;
    } else {
      _messages
          .elementAt(messageIndex)
          .reactions
          .elementAt(reactionIndex)
          .count = _messages
              .elementAt(messageIndex)
              .reactions
              .elementAt(reactionIndex)
              .count +
          1;
      _messages
              .elementAt(messageIndex)
              .reactions
              .elementAt(reactionIndex)
              .isReacted =
          !_messages
              .elementAt(messageIndex)
              .reactions
              .elementAt(reactionIndex)
              .isReacted;
    } */
    notifyListeners();
  }

  String formatDate(String dateToCheck) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final aDate = DateTime(
        int.parse(DateFormat('yyyy').format(today)),
        int.parse(DateFormat('MM').format(today)),
        int.parse(DateFormat('dd').format(today)));
    if (aDate == today) {
      return 'Today ' +
          today.day.toString() +
          ' ' +
          DateFormat('MMMM').format(today).toString();
    } else if (aDate == yesterday) {
      return 'Yesterday ' + yesterday.day.toString();
    } else {
      return DateFormat('MM').format(today) + DateFormat('dd').format(today);
    }
  }
}
