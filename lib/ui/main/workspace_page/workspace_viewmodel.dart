import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/models/workspace_model/workspace.dart';
import 'package:zc_desktop_flutter/services/workspace_service/workspace_service.dart';
import 'package:zc_desktop_flutter/ui/main/workspace_page/workspace_view.dart';

class WorkspaceViewModel extends IndexTrackingViewModel {
  final log = getLogger("WorkspaceViewModel");
  final _workspaceService = locator<WorkspaceService>();

  bool _showDMs = false;
  bool _showMenus = false;
  bool _showChannels = false;

  bool isChannel = false;
  bool isDM = false;
  bool isThreads = false;

  bool loadingWorkspace = false;

  ScrollController controller = ScrollController();

  List<Widget> channels = [];
  List<Widget> dMs = [];
  List<Widget> _workspacesItems = [];
  List<Workspace> _workspace = [];

  int currentWorkspaceIndex = 0;
  int currentChannelIndex = 0;
  int currentUsersIndex = 0;

  late int workspaceListItemCount;
  late int channelsListItemCount;
  late int usersListItemCount;

  final DateTime currentMessageTime = DateTime.now();
  final ScrollController controllerOne = ScrollController();

  String userDefaultImageUrl = 'assets/images/zc_logo.png';
  int numberOfReplies = 14;
  int numberOfReactions = 0;
  String userDisplayName = 'Mark';

  String emojiIconPath = 'assets/images/🤘🏻.png';
  String userPost =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  bool get showDMs => _showDMs;

  List<Widget> get workspacesItems => _workspacesItems;

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
    workspaceListItemCount = _workspace.length.toInt();
    workspaceListItemCount = _workspaceService.workspaces.length.toInt();
    channelsListItemCount = _workspace[currentWorkspaceIndex].channels!.length;
    usersListItemCount = _workspace[currentWorkspaceIndex].dms!.length;

    _workspace.forEach((workspace) {
      _workspacesItems.add(WorkspaceItem(
        workspace: workspace,
      ));
    });

    log.i(
        "workspace list item count $workspaceListItemCount  channels list item count $channelsListItemCount");
  }

  void getData() async {
    await setupChannelsView();
    workspaceListItemCount = _workspace.length.toInt();
    workspaceListItemCount = _workspaceService.workspaces.length.toInt();
    channelsListItemCount = _workspace[currentWorkspaceIndex].channels!.length;
    usersListItemCount = _workspace[currentWorkspaceIndex].dms!.length;
    openChannelsDropDownMenu();
    openDMsDropDownMenu();
  }

  void setCurrentWorkspaceIndex(int index) {
    currentWorkspaceIndex = index;
    log.i("$index from workspace");
    setupChannelsView();
    getData();
    notifyListeners();
  }

  void setCurrentChannelIndex(int index) {
    currentChannelIndex = index;
    notifyListeners();
  }

  void setCurrentUsersIndex(int index) {
    currentUsersIndex = index;
    notifyListeners();
  }

  //TODO: ontap workspace, get workspaces
  Future setupChannelsView() async {
    await runBusyFuture(runTask());
  }

  //TODO: Temporary solution - navigate to create workspace page
  final _navigationService = locator<NavigationService>();
  void goToCreateWorkspace() {
    _navigationService.navigateTo(Routes.createWorkspaceView);
  }

  // get workspaces
  Future<void> runTask() async {
    _workspace = await _workspaceService.getWorkspaces();
  }

  String? getChannelName(int index) {
    if (_workspace.isNotEmpty) {
      for (int i = 0;
          i < _workspace[currentWorkspaceIndex].channels!.length;
          i++) {
        log.i("from getChannelName() $currentWorkspaceIndex");
        notifyListeners();
        return _workspace[currentWorkspaceIndex].channels![index].name;
      }
      notifyListeners();
    }
    notifyListeners();
    return 'No data';
  }

  String? getUsersName(int index) {
    if (_workspace.isNotEmpty) {
      for (int i = 0; i < _workspace[currentWorkspaceIndex].dms!.length; i++) {
        log.i("from getUsersName() $currentWorkspaceIndex $currentUsersIndex");
        notifyListeners();
        return _workspace[currentWorkspaceIndex].dms![index].user!.name;
      }
      notifyListeners();
    }
    notifyListeners();
    return 'No data';
  }

  String? getWorkspaceName() {
    if (_workspace.isNotEmpty) {
      for (int i = 0; i < _workspace.length; i++) {
        return _workspace[currentWorkspaceIndex].name;
      }
    }
    notifyListeners();
    return 'No data';
  }

  void increaseReactionNumber() {
    numberOfReactions++;
    notifyListeners();
  }
}
