import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/workspace_model/workspace.dart';
import 'package:zc_desktop_flutter/services/workspace_service/workspace_service.dart';
import 'package:zc_desktop_flutter/ui/main/workspace_page/workspace_view.dart';

class WorkspaceViewModel extends BaseViewModel {
  final log = getLogger("WorkspaceViewModel");
  final _workspaceService = locator<WorkspaceService>();

  String userDefaultImageUrl = 'assets/images/zc_logo.png';
  int numberOfReplies = 14;
  int numberOfReactions = 0;
  String userDisplayName = 'Mark';

  String emojiIconPath = 'assets/images/🤘🏻.png';
  String userPost =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  final DateTime currentMessageTime = DateTime.now();
  final ScrollController controllerOne = ScrollController();
  final ScrollController controller = ScrollController();

  int currentWorkspaceIndex = 0;

  bool _showDMs = false;
  bool _showMenus = false;
  bool _showChannels = false;
  bool isChannel = false;
  bool isDM = false;
  bool isThreads = false;

  List<Workspace> _workspace = [];
  List<Channel> _channels = [];
  List<DM> _directMessages = [];

  List<Workspace> get workspace => _workspace;
  List<Channel> get channels => _channels;
  List<DM> get directMessages => _directMessages;


  bool get showDMs => _showDMs;
  bool get showMenus => _showMenus;
  bool get showChannels => _showChannels;


  void openChannelsDropDownMenu() {
    _showChannels = !_showChannels;
    notifyListeners();
  }

  void openDMsDropDownMenu() {
    _showDMs = !_showDMs;
    notifyListeners();
  }

  void getViewToDisplay(
      {int? index,
      bool isChannel = false,
      bool isDM = false,
      bool isThreads = false}) {
    if (isChannel) {
      this.isChannel = true;
    } else {
      this.isChannel = false;
    }

    if (isDM) {
      this.isDM = true;
    } else {
      this.isDM = false;
    }

    if (isThreads) {
      this.isThreads = true;
    } else {
      this.isThreads = false;
    }
    notifyListeners();
  }

  void setup() async {
    await setupChannelsView();
  }

  void setCurrentWorkspaceIndex(int index) {
    log.i("$index from workspace");
    currentWorkspaceIndex = index;
    setupChannelsView();
    notifyListeners();
  }

  //TODO: ontap workspace, get workspaces
  Future setupChannelsView() async {
    await runBusyFuture(runTask());
  }

  // get workspaces
  Future<void> runTask() async {
    _workspace = await _workspaceService.getWorkspaces();
    getChannels();
    getUsers();
  }

  void getChannels() {
    if (_workspace.isNotEmpty) {
      for (int i = 0;
          i < _workspace[currentWorkspaceIndex].channels!.length;
          i++) {
        _channels = _workspace[currentWorkspaceIndex].channels!;
      }
    }
    notifyListeners();
  }

  void getUsers() {
    if (_workspace.isNotEmpty) {
      for (int i = 0; i < _workspace[currentWorkspaceIndex].dms!.length; i++) {
        _directMessages = _workspace[currentWorkspaceIndex].dms!;
      }
    }
    notifyListeners();
  }

  void increaseReactionNumber() {
    numberOfReactions++;
    notifyListeners();
  }
}
