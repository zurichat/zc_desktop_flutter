import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/workspace_model/workspace.dart';
import 'package:zc_desktop_flutter/services/channel_service/channel_service.dart';

class ChannelsViewModel extends BaseViewModel {
  final log = getLogger("MessageViewModel");
  final _channelService = locator<ChannelService>();

  Channel _channel = Channel();

  final DateTime currentMessageTime = DateTime.now();
  final ScrollController controllerOne = ScrollController();

  String userDefaultImageUrl = 'assets/images/mark.jpeg';
  int numberOfReplies = 14;
  int numberOfReactions = 0;
  String userDisplayName = 'Mark';

  String emojiIconPath = 'assets/images/🤘🏻.png';
  String userPost =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  void increaseReactionNumber() {
    numberOfReactions++;
    notifyListeners();
  }

  void setup() {
    runTask();
  }

  void runTask() async {
    _channel = await runBusyFuture(_channelService.getChannel());
  }

  String? getChannelName() {
    if (_channel.name!.isNotEmpty) {
      return _channel.name;
    }
    return "No data";
  }
}