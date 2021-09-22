import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/dummy_user_model/user_model.dart';
import 'package:zc_desktop_flutter/services/dm_service/dm_service.dart';

class DmViewModel extends BaseViewModel {
  final log = getLogger("DmViewModel");
  final _dmService = locator<DMService>();
  User _user = User(name: "");

  void setup() {
    runTask();
  }

  void runTask() async {
    _user = await runBusyFuture(_dmService.getUser());
    log.i(_user.name);
  }

  String? getChatUserName() {
    if (_user.name!.isNotEmpty) {
      return _user.name;
    }

    return 'No data';
  }

  User get user => _user;
  final DateTime currentMessageTime = DateTime.now();
  List<Message> _messages = [];

  List<Message> get messages => _messages;
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

  void sendMessage(String message) {
    _messages.add(Message(
        reactions: [
          Reaction(count: 3, id: 1, reaction: '😂'),
          Reaction(count: 4, id: 2, reaction: '😍'),
          Reaction(count: 20, id: 1, reaction: '👌'),
        ],
        message: message,
        time: DateFormat('hh:mm a').format(DateTime.now()).toString(),
        userDisplayName: 'Dennis',
        userProfileUrl:
            'https://gravatar.com/avatar/3cf766c59c42f3bdb00bdc874a5a55e3?s=200&d=retro&r=g'));
    notifyListeners();
  }

  void reactToMessage(int messageIndex, int reactionIndex) {
    if (_messages
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
    }
    notifyListeners();
  }

  String formatDate(DateTime dateToCheck) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    final aDate =
        DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
    if (aDate == today) {
      return 'Today ' +
          today.day.toString() +
          ' ' +
          DateFormat('MMMM').format(today).toString();
    } else if (aDate == yesterday) {
      return 'Yesterday ' + yesterday.day.toString();
    } else {
      return dateToCheck.month.toString() + dateToCheck.day.toString();
    }
  }
}

class Message {
  final String userProfileUrl;
  final String userDisplayName;
  final String message;
  final String time;
  final List<Reaction> reactions;

  Message(
      {required this.message,
      required this.time,
      required this.userDisplayName,
      required this.userProfileUrl,
      required this.reactions});
}

class Reaction {
  int count;
  final String reaction;
  final int id;
  bool isReacted;

  Reaction(
      {required this.count,
      required this.id,
      required this.reaction,
      this.isReacted = false});
}
