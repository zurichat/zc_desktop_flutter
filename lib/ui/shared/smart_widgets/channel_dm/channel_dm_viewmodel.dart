import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart' as LoggedInUser;
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/centrifuge_service.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';

class ChannelDmViewModel extends BaseViewModel {
  final log = getLogger('MessageViewModel');
  final _channelService = locator<ChannelsService>();
  final _centrifugeService = locator<CentrifugeService>();

  late LoggedInUser.User _currentLoggedInUser;
  int currentSelectedChannel = 0;
  String? _channelId = '0';
  String? channelId = '0';
  List<ChannelMessage> _messages = [];

  List<ChannelMessage> get messages => _messages;
  Channel _currentChannel = Channel();

  Channel get currentChannel => _currentChannel;
  bool _onMessageTileHover = false;

  bool get onMessageTileHover => _onMessageTileHover;
  bool _onHoverActionsHovered = false;

  final DateTime currentMessageTime = DateTime.now();
  final ScrollController controllerOne = ScrollController();

  String userDefaultImageUrl = 'assets/images/mark.jpeg';
  int numberOfReplies = 14;
  int numberOfReactions = 0;
  String userDisplayName = 'Mark';

  String emojiIconPath = 'assets/images/🤘🏻.png';
  String userPost =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  String _hoverAction = '';
  String get hoverAction => _hoverAction;
  double _hoverWidth = 0;
  double get hoverWidth => _hoverWidth;
  bool get onHoverActionsHover => _onHoverActionsHovered;
  int _onMessageHoveredIndex = 0;

  int get onMessageHoveredIndex => _onMessageHoveredIndex;
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

  void increaseReactionNumber() {
    numberOfReactions++;
    notifyListeners();
  }

  void setup() {
    runTask();
  }

  void runTask() async {
    _currentChannel = _channelService.getChannel();
    _currentLoggedInUser = _channelService.getCurrentLoggedInUser()!;
    /*_channelService.addUserToChannel(
        id: _currentLoggedInUser.id,
        role_id: '1',
        is_admin: true,
        prop1: 'prop1',
        prop2: 'prop2',
        prop3: 'prop3');
    _messages = await _channelService.fetchChannelMessages();
    getChannelSocketId();
    listenToNewMessages();*/
  }

  void getChannelSocketId() async {
    String channelSockId = await _channelService.fetchChannelSocketId();

    websocketConnect(channelSockId);
  }

  void websocketConnect(String socketId) async {
    await _centrifugeService.subscribe(socketId);
  }

  void listenToNewMessages() {
    _centrifugeService.messageStreamController.stream.listen((event) async {
      _messages = await _channelService.fetchChannelMessages('1');
      notifyListeners();
    });
  }

  bool isSameDate(int index) {
    if (index + 1 < _messages.length) {
      final prevDate = DateTime.parse(_messages.elementAt(index).timestamp);
      final nextDate = DateTime.parse(_messages.elementAt(index + 1).timestamp);
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
    //print(DateFormat('dd').format(dateToCheck));
    //print(aDate);
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

  Future<void> sendMessage(String message) async {
    var mess = ChannelMessage(
      id: '',
      timestamp: DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
          .format(DateTime.now())
          .toString(),
      user_id: _currentLoggedInUser.id,
      content: message,
      channel_id: _channelId!,
    );
    _messages.add(mess);
    notifyListeners();
    //u can get index by getting list length and minus 1
    /* var res = await _channelService.sendMessage(
        channel_id: _channelId,
        senderId: _currentLoggedInUser.id,
        message: message,
        org_id: _orgId); */
    /* var index = _messages.indexWhere((Results) {
      return Results.message == res.data.message;
    });
    _messages.replaceRange(index, index + 1, [
      ChannelMessage(
        id: res.message_id,
        timestamp: res.data.created_at,
        user_id: _currentLoggedInUser.id,
        content: message,
        channel_id: _channelId!,
      )
    ]); */

    notifyListeners();
  }

  LoggedInUser.User getUser(var senderId) {
    if (_currentLoggedInUser.id == senderId) {
      return _currentLoggedInUser;
    } else {
      return LoggedInUser.User(
          id: senderId,
          firstName: 'Zuri Partner',
          lastName: 'Zuri Partner',
          displayName: 'Zuri Partner',
          email: 'email',
          phone: 'phone',
          status: 1,
          timeZone: 'timeZone',
          createdAt: 'createdAt',
          updatedAt: 'updatedAt',
          token: 'token'); //check this functionality
    }
  }
}
