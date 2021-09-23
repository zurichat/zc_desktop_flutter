import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/dm_model/messages_response.dart';
import 'package:zc_desktop_flutter/models/dm_model/room_response.dart';
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
    _roomId = await _dmService.createRoom(_currentLoggedInUser, _user);
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

  bool get showingNewMessageIn => _showingNewMessageIn;
  bool _showingNewMessageIn = false;

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
    var mess = Results(
      reactions: [],
      id: '',
      created_at: DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
          .format(DateTime.now())
          .toString(),
      threads: [],
      media: [],
      pinned: false,
      sender_id: _currentLoggedInUser.id,
      message: message,
      saved_by: [],
      read: true,
      room_id: _roomId!,
    );
    _messages.add(mess);
    notifyListeners();
    //u can get index by getting list length and minus 1
    SendMessageResponse res =
        await _dmService.sendMessage(_roomId, _currentLoggedInUser.id, message);
    var index = _messages.indexWhere((Results) {
      return Results.message == res.data.message;
    });
    _messages.replaceRange(index, index + 1, [
      Results(
        reactions: [],
        id: res.message_id,
        created_at: res.data.created_at,
        threads: [],
        media: [],
        pinned: false,
        sender_id: _currentLoggedInUser.id,
        message: message,
        saved_by: [],
        read: true,
        room_id: _roomId!,
      )
    ]);

    notifyListeners();
  }

  LoggedInUser.User getUser(var senderId) {
    print("player "+senderId);
    if (_currentLoggedInUser.id == senderId) {
      return _currentLoggedInUser;
    } else {
      return LoggedInUser.User(
          id: _user.id!.toString(),
          firstName: 'firstName',
          lastName: 'lastName',
          displayName: _user.name!,
          email: 'email',
          phone: 'phone',
          status: 1,
          timeZone: 'timeZone',
          createdAt: 'createdAt',
          updatedAt: 'updatedAt',
          token: 'token'); //check this functionality
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

  String formatDate(String createdAt) {
    final dateToCheck = DateTime.parse(createdAt);
    print(dateToCheck);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final aDate = DateTime(
        int.parse(DateFormat('yyyy').format(dateToCheck)),
        int.parse(DateFormat('MM').format(dateToCheck)),
        int.parse(DateFormat('dd').format(dateToCheck)));
    print(DateFormat('dd').format(dateToCheck));
    print(aDate);
    if (aDate == today) {
      return 'Today ' +
          today.day.toString() +
          ' ' +
          DateFormat('MMMM').format(today).toString();
    } else if (aDate == yesterday) {
      return 'Yesterday ' +
          yesterday.day.toString() +
          ' ' +
          DateFormat('MMMM').format(dateToCheck).toString();
    } else {
      return DateFormat('MM').format(dateToCheck) +
          DateFormat('dd').format(dateToCheck);
    }
  }

  String formatTime(String createdAt) {
    final dateToCheck = DateTime.parse(createdAt);
    return DateFormat('HH:mm a').format(dateToCheck);
  }

  bool isSameDate(int index) {
    if (index + 1 < _messages.length) {
      final prevDate = DateTime.parse(_messages.elementAt(index).created_at);
      final nextDate =
          DateTime.parse(_messages.elementAt(index + 1).created_at);
      if (DateTime(
              int.parse(DateFormat('yyyy').format(prevDate)),
              int.parse(DateFormat('MM').format(prevDate)),
              int.parse(DateFormat('dd').format(prevDate))) ==
          DateTime(
              int.parse(DateFormat('yyyy').format(nextDate)),
              int.parse(DateFormat('MM').format(nextDate)),
              int.parse(DateFormat('dd').format(nextDate)))) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  void onDispose() {
    markMessageAsRead();
  }

  void markMessageAsRead() {
    Iterable<Results> nonReadMessages = _messages.where((element) {
      if (!element.read && element.sender_id != currentLoggedInUser.id) {
        return true;
      } else {
        return false;
      }
    });
    nonReadMessages.forEach((element) {
      _dmService.markMessageAsRead(element.id);
    });
    toggleShowingNewMessageIn(false);
  }

  void toggleShowingNewMessageIn(bool showing) {
    _showingNewMessageIn = showing;
  }
}
