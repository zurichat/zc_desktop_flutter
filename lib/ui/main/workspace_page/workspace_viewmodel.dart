import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/models/workspace_model/workspace.dart';
import 'package:zc_desktop_flutter/services/channel_service/channel_service.dart';
import 'package:zc_desktop_flutter/services/dm_service/dm_service.dart';
import 'package:zc_desktop_flutter/services/workspace_service/workspace_service.dart';

class WorkspaceViewModel extends BaseViewModel {
  final log = getLogger("WorkspaceViewModel");
  final _workspaceService = locator<WorkspaceService>();
  final _navigationService = locator<NavigationService>();
  final _channelService = locator<ChannelService>();
  final _dmService = locator<DMService>();

  ScrollController controller = ScrollController();

  int currentWorkspaceIndex = 0;

  bool _displayChannels = false;
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

  bool get displayChannels => _displayChannels;

  void openChannelsList() {
    _navigationService.navigateTo(WorkspaceViewRoutes.channelsDisplayView,
        id: 1);
  }

  void openChannelsDropDownMenu() {
    _showChannels = !_showChannels;
    notifyListeners();
  }

  void openDMsDropDownMenu() {
    _showDMs = !_showDMs;
    notifyListeners();
  }

  void setup() async {
    await setupWorkspace();
  }

  void setCurrentWorkspaceIndex(int index) {
    log.i("$index from workspace");
    currentWorkspaceIndex = index;
    setupWorkspace();
    notifyListeners();
  }

  //TODO: ontap workspace, get workspaces
  Future setupWorkspace() async {
    await runBusyFuture(runTask());
  }

  // TODO: go to workspace creation page
  void goToCreateWorkspace() {
    _navigationService.navigateTo(Routes.createWorkspaceView);
  }

  // get workspaces
  Future<void> runTask() async {
    _workspace = await _workspaceService.getWorkspaces();
    getChannels();
    getUsers();
  }

  void getChannels() {
    if (_workspace.isNotEmpty) {
      _channels = _workspace[currentWorkspaceIndex].channels!;
    }
    notifyListeners();
  }

  void getUsers() {
    if (_workspace.isNotEmpty) {
      _directMessages = _workspace[currentWorkspaceIndex].dms!;
    }
    notifyListeners();
  }

  void goToDmView(int index) {
    _dmService.setUser(_directMessages[index].user!);
    _navigationService.navigateTo(WorkspaceViewRoutes.dmView, id: 1);
  }

  void goToChannelsView(int index) {
    _channelService.setChannel(_channels[index]);
    _navigationService.navigateTo(WorkspaceViewRoutes.channelsView, id: 1);
  }

  String? getWorkspaceName() {
    if (_workspace.isNotEmpty) {
      return _workspace[currentWorkspaceIndex].name!;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
