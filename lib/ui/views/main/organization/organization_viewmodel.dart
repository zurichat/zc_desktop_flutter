import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
import 'package:zc_desktop_flutter/services/dm_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';

class OrganizationViewModel extends BaseViewModel {
  final log = getLogger("OrganizationViewModel");
  final _navigationService = locator<NavigationService>();
  final _organizationService = locator<OrganizationService>();
  final _channelService = locator<ChannelsService>();
  final _dmService = locator<DMService>();

  ScrollController controller = ScrollController();

  Organization _currentOrganization = Organization();

  bool _showDMs = false;
  bool _showMenus = false;
  bool _showChannels = false;

  List<Organization> _organization = [];
  List<Channel> _channels = [];

  //List<DM> _directMessages = [];

  List<Organization> get organization => _organization;

  List<Channel> get channels => _channels;

  //List<DM> get directMessages => _directMessages;

  Organization get currentOrganization => _currentOrganization;

  bool get showDMs => _showDMs;

  bool get showMenus => _showMenus;

  bool get showChannels => _showChannels;

  /// This is the first function that is fired when the viewmodel is activated
  void setup() async {
    setSelectedOrganization(getSelectedOrganizationIndex() ?? 0);
    await runBusyFuture(setupOrganization());
    _organizationService.saveOrganizationId(_currentOrganization.id);
    log.d(" current organization id ${_currentOrganization.id}");
    // log.i(_channels);
  }

  /// function fired when another workspace is tapped on.
  void reloadWithSelectedOrganization(int index) async {
    _channels = [];
    log.i("###################### $_channels");
    log.i(
        "current selected organization ${getSelectedOrganizationIndex()! + 1} and to change to ${index + 1}");
    if (index != getSelectedOrganizationIndex()!) {
      await runBusyFuture(setupOrganization());
      // Save the newly selected org id in preferences when a new organization item is tapped
      _organizationService.saveOrganizationId(_currentOrganization.id);
      setSelectedOrganization(index);
      _currentOrganization = organization[getSelectedOrganizationIndex()!];
    }
    return;
  }

  /// called in the view on organization tapped
  void setSelectedOrganization(int index) {
    _organizationService.changeSelectedOrganization(index);
  }

  int? getSelectedOrganizationIndex() {
    return _organizationService.selectedOrganization;
  }

  Future<void> setupOrganization() async {
    await getOrganizations();
    await getChannels();
  }

  Future<void> getOrganizations() async {
    _organization = await _organizationService.getOrganizations();
  }

  Future<void> getChannels() async {
    _currentOrganization = organization[getSelectedOrganizationIndex()!];
    _channels = await _channelService.getChannels(
        organizationId: _currentOrganization.id);
    _channelService.setChannel(_channels[0]);
    log.i("${_channels}");
  }

  void openChannelsList() {
    _navigationService.navigateTo(OrganizationViewRoutes.channelsListView,
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

  // TODO: go to workspace creation page
  void goToCreateWorkspace() {
    _navigationService.navigateTo(Routes.createWorkspaceView);
  }

  void goToChannelsView({int index = 0}) {
    _channelService.setChannel(_channels[index]);
    _navigationService.navigateTo(OrganizationViewRoutes.channelsView, id: 1);
  }

  void goTOSavedItems() {
    _navigationService.navigateTo(OrganizationViewRoutes.savedItemsView, id: 1);
  }

  void goToDmView(int index) {
    ///_dmService.setUser();
    _navigationService.navigateTo(OrganizationViewRoutes.dmView, id: 1);
  }

  bool selectedOrg(int index) {
    log.d(
        "new selected index $index currently seletected channel index ${getSelectedOrganizationIndex()!}");
    if (index == getSelectedOrganizationIndex()!) {
      return true;
    }
    return false;
  }

  void goToAllDmView() {
    _navigationService.navigateTo(OrganizationViewRoutes.allDmsView, id: 1);
  }

  bool showSelectedOrg(int index) {
    if (index == getSelectedOrganizationIndex()!) {
      return true;
    }
    return false;
  }

  /*bool selectedChannel(int index) {
    log.d("new selected index $index currently seletected channel index $selectedChannelIndex");
    if (index == selectedChannelIndex) {
      return true;
    }
    return false;
  }*/

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

/*void setup() async {
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



  void goToChannelsView(int index) {
    _channelService.setChannel(_channels[index]);
    _navigationService.navigateTo(WorkspaceViewRoutes.channelsView, id: 1);
  }

  String? getWorkspaceName() {
    if (_workspace.isNotEmpty) {
      return _workspace[currentWorkspaceIndex].name!;
    }
    notifyListeners();
  }*/
