import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/model/app_models.dart' as LoggedInUser;
import 'package:zc_desktop_flutter/services/centrifuge_service.dart';
import 'package:zc_desktop_flutter/services/dm_service.dart';

class DmViewModel extends BaseViewModel {
  final log = getLogger('DmViewModel');
  final _dmService = locator<DMService>();
  final _centrifugeService = locator<CentrifugeService>();
  Users _user = Users(name: '');
  late LoggedInUser.User _currentLoggedInUser;
  String? _roomId = '';
  DM? _dmRoomInfo;
  List<Results> _messages = [];

  void setup() {
    runTask();
  }

  void runTask() async {
    setBusy(true);
    _user = await _dmService.getUser();
    _currentLoggedInUser = _dmService.getCurrentLoggedInUser()!;
    _dmRoomInfo = _dmService.getExistingRoomInfo;
    if (_dmRoomInfo == null) {
      //we dont have a conversation yet so create a new room
      await _dmService.createRoom(_currentLoggedInUser, _user);

      ///_dmService.getRoomInfo(_roomId);
    } else {
      _roomId = _dmRoomInfo!.roomInfo.id;
    }
    _messages = (await _dmService.fetchRoomMessages(_roomId));
    //_dmService.markMessageAsRead('614b1e8f44a9bd81cedc0a29');
    setBusy(false);
    log.i(_user.name);
    notifyListeners();

    websocketConnect();
    listenToNewMessages();
  }

  Users get user => _user;
  String get roomId => _roomId!;
  DM get dmRoomInfo => _dmRoomInfo!;
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

  UserProfile getUser(var senderId) {
    if (_dmRoomInfo!.currentUserProfile.userId == senderId) {
      return _dmRoomInfo!.currentUserProfile;
    } else {
      return _dmRoomInfo!.otherUserProfile;
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

  void newReactionToMessage(int messageIndex) {
    var res = _dmService.reactToMessage(
        roomId,
        _messages.elementAt(messageIndex).id,
        ReactToMessage(
            senderId: _currentLoggedInUser.id,
            data: '😃',
            category: 'SMILEYS',
            aliases: [],
            count: 0));
  }

  String formatDate(String createdAt) {
    final dateToCheck = DateTime.parse(createdAt);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    //final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final aDate = DateTime(
        int.parse(DateFormat('yyyy').format(dateToCheck)),
        int.parse(DateFormat('MM').format(dateToCheck)),
        int.parse(DateFormat('dd').format(dateToCheck)));
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
      return DateFormat('EEE ').format(dateToCheck) +
          DateFormat('MMMM ').format(dateToCheck) +
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

  void websocketConnect() async {
    await _centrifugeService.connect();
    await _centrifugeService.subscribe(roomId);
  }

  void listenToNewMessages() {
    _centrifugeService.messageStreamController.stream.listen((event) async {
      // _messages = await _channelService.fetchChannelMessages();
      notifyListeners();
    });
  }
}
