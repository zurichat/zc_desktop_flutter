import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final rightSideBarController = ScrollController();
  Users _user = Users(name: '');
  late LoggedInUser.User _currentLoggedInUser;
  String? _roomId = '';
  DM? _dmRoomInfo;
  List<Results> _messages = [];
  List<PinnedMessageContent> _pinnedItems = [];

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
    fetchPinnedMessages();
    //_dmService.markMessageAsRead('614b1e8f44a9bd81cedc0a29');
    setBusy(false);
    scrollToBottom();
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
    scrollToBottom();
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
    _dmService.reactToMessage(
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
    await _centrifugeService.subscribe(roomId);
  }

  void listenToNewMessages() {
    _centrifugeService.listen(
      socketId: roomId,
      channelId: roomId,
      onData: (message) async {
        log.i('listened to meso $message');
        _messages = (await _dmService.fetchRoomMessages(_roomId));
        scrollToBottom();
        notifyListeners();
      },
    );
  }

  void scrollToBottom() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      rightSideBarController.animateTo(
        rightSideBarController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 10),
        curve: Curves.easeOut,
      );
    });
  }

  //Pinned and bookmarks
  final String urlLink = '';

  bool _isDropped = false;
  bool _isHover = false;
  bool _isMessagePinned = false;
  bool _isBookmarkDecoyVisible = false;
  bool _isOriginalBookmarkVisible = true;
  bool _isDecoyForPinnedMessageVisible = false;

  final String profileImageUrl = '';
  final String userName = '';

  //---
  bool get isDecoyForPinnedMessageVisible => _isDecoyForPinnedMessageVisible;
  bool get isOriginalBookmarkVisible => _isOriginalBookmarkVisible;
  bool get isBookmarkDecoyVisible => _isBookmarkDecoyVisible;
  bool get isMessagePinned => _isMessagePinned;
  bool get isDropped => _isDropped;
  bool get isHover => _isHover;
  List<PinnedMessageContent> get pinnedMessages => _pinnedItems;
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

    // if (_pinnedItems.length <= 1) {
    //   _isMessagePinned = false;
    // }
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

  void getUserPinnedMessage() {
    // _dmService.
  }

  void pinMessage(String messageId) {
    _dmService.pinMessage(messageId);
    for (var message in messages) {
      if (message.id == messageId) {
        _pinnedItems.add(PinnedMessageContent(
          displayName:
              message.sender_id == _dmRoomInfo!.currentUserProfile.userId
                  ? _dmRoomInfo!.currentUserProfile.displayName
                  : _dmRoomInfo!.otherUserProfile.displayName,
          displayImage:
              message.sender_id == _dmRoomInfo!.currentUserProfile.userId
                  ? _dmRoomInfo!.currentUserProfile.imageUrl
                  : _dmRoomInfo!.otherUserProfile.imageUrl,
          message: message.message,
          createdAt: formatTime(message.created_at),
        ));
      }
    }
    notifyListeners();
  }

  Future<void> fetchPinnedMessages() async {
    var pinned = await _dmService.fetchPinnedMessages(_roomId!);
    for (var message in messages) {
      for (var pin in pinned) {
        if (message.id == pin) {
          _pinnedItems.add(PinnedMessageContent(
            displayName:
                message.sender_id == _dmRoomInfo!.currentUserProfile.userId
                    ? _dmRoomInfo!.currentUserProfile.displayName
                    : _dmRoomInfo!.otherUserProfile.displayName,
            displayImage:
                message.sender_id == _dmRoomInfo!.currentUserProfile.userId
                    ? _dmRoomInfo!.currentUserProfile.imageUrl
                    : _dmRoomInfo!.otherUserProfile.imageUrl,
            message: message.message,
            createdAt: formatTime(message.created_at),
          ));
        }
      }
    }
    notifyListeners();
  }
}
