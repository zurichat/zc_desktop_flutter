import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
import 'package:zc_desktop_flutter/services/dm_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';

class OrganizationViewModel extends BaseViewModel {
  final log = getLogger('OrganizationViewModel');
  final String _selectedOrgKey = 'SelectedOrgKey';
  final _localStorageService = locator<LocalStorageService>();
  final _navigationService = locator<NavigationService>();
  final _organizationService = locator<OrganizationService>();
  final _channelService = locator<ChannelsService>();
  final _dmService = locator<DMService>();
  final _userService = locator<UserService>();
  final _windowTitleBarService = locator<WindowTitleBarService>();

  int _selectedChannelIndex = 0;
  int _selectedMenuIndex = -1;
  int _selectedDMIndex = -1;

  ScrollController controller = ScrollController();

  Organization _currentOrganization = Organization();

  bool _showDMs = false;
  bool _showMenus = false;
  bool _showChannels = false;

  List<Organization> _organization = [];
  List<Channel> _channels = [];
  List<DM> _dms = [];

  //List<DM> _directMessages = [];

  List<Organization> get organization => _organization;

  List<Channel> get channels => _channels;

  List<DM> get dms => _dms;

  Organization get currentOrganization => _currentOrganization;

  bool get showDMs => _showDMs;

  bool get showMenus => _showMenus;

  bool get showChannels => _showChannels;

  int get selectedMenuIndex => _selectedMenuIndex;

  int get selectedChannelIndex => _selectedChannelIndex;

  int get selectedDMIndex => _selectedDMIndex;

  /// This is the first function that is fired when the viewmodel is activated
  void setup() async {
    setSelectedOrganization(getSelectedOrganizationIndex() ?? 0);
    await runBusyFuture(setupOrganization());
    _windowTitleBarService.setHome(true);
    _organizationService.saveOrganizationId(_currentOrganization.id);
    _organizationService.saveMemberId(_currentOrganization.memberId);
    log.d('current organization id ${_currentOrganization.id}');
    log.d('current organization id ${_currentOrganization.memberId}');
    //notifyListeners();
    // log.i(_channels);
  }

  /// function fired when another workspace is tapped on.
  void reloadWithSelectedOrganization(int index) async {
    _channels = [];
    log.i('###################### $_channels');
    log.i(
        'current selected organization ${getSelectedOrganizationIndex()! + 1} and to change to ${index + 1}');
    if (index != getSelectedOrganizationIndex()!) {
      await runBusyFuture(setupOrganization());
      // Save the newly selected org id in preferences when a new organization item is tapped
      _organizationService.saveOrganizationId(_currentOrganization.id);
      _organizationService.saveMemberId(_currentOrganization.memberId);
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
    await getDMs();
    await getChannels();
    
  }

  Future<void> getOrganizations() async {
    // _organization = await _organizationService.getOrganizations();
    _organization = [];
    try {
      final result = await json.decode(
          _localStorageService.getFromDisk(_selectedOrgKey).toString()) as List;
      result.forEach((element) {
        _organization.add(Organization.fromJson(element));
      });
      log.i('************* $_organization');
    } catch (e) {
      log.i(e);
    }
  }

  Future<void> getChannels() async {
    _currentOrganization = organization[getSelectedOrganizationIndex()!];
    _channels = await _channelService.getChannels(
        organizationId: _currentOrganization.id);
    _channelService.setChannel(_channels[0]);
    _channelService.saveChannelList(_channels);
    log.i('${_channels}');
  }

  Future<void> getDMs() async {
    _dms = [];
    Auth auth = _organizationService.auth;
    _currentOrganization = organization[getSelectedOrganizationIndex()!];
    List<DMRoomsResponse> res =
        await _dmService.getDMs(_currentOrganization.id);
    for (var room in res) {
      UserProfile userProfile = await _organizationService.getUserProfile(
          _currentOrganization.id, room.roomUserIds.last);
      DM dm = DM(
          otherUserProfile: userProfile,
          roomInfo: room,
          currentUserProfile: UserProfile(
              firstName: auth.user!.firstName,
              lastName: auth.user!.lastName,
              displayName: auth.user!.displayName,
              imageUrl: auth.user!.displayName,
              userName: auth.user!.displayName,
              userId: auth.user!.id,
              phone: auth.user!.phone,
              pronouns: auth.user!.displayName,
              bio: auth.user!.displayName,
              status: UserStatus()));
      _dms.add(dm);
    }
    log.i('${_dms}');
    _organizationService.setDms(_dms);
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
  void goToChooseWorkspace() {
    _navigationService.navigateTo(Routes.chooseWorkspaceView);
  }

  void goToChannelsView({int index = 0}) {
    _selectedChannelIndex = index;
    _selectedMenuIndex = -1;
    _selectedDMIndex = -1;
    notifyListeners();
    _channelService.setChannel(_channels[index]);
    _navigationService.navigateTo(OrganizationViewRoutes.channelsView, id: 1);
  }

  void goToSavedItems() {
    notifyListeners();
    _navigationService.navigateTo(OrganizationViewRoutes.savedItemsView, id: 1);
  }

  void goToThreadsView() {
    notifyListeners();
    _navigationService.navigateTo(OrganizationViewRoutes.threadsView, id: 1);
  }

  void goToUserPeopleGroup() {
    notifyListeners();
    _navigationService.navigateTo(OrganizationViewRoutes.peopleUserGroupView,
        id: 1);
  }

  void goTodoView() {
    notifyListeners();
    _navigationService.navigateTo(OrganizationViewRoutes.todoView, id: 1);
  }

  void goToDmView(int index) {
    _selectedDMIndex = index;
    _selectedChannelIndex = -1;
    _selectedMenuIndex = -1;
    notifyListeners();
    _dmService.setExistingRoomInfo(_dms[index]);
    _navigationService.navigateTo(OrganizationViewRoutes.dmView, id: 1);
  }

  bool selectedOrg(int index) {
    if (index == getSelectedOrganizationIndex()!) {
      return true;
    }
    return false;
  }

  void goToAllDmView() {
    notifyListeners();
    _navigationService.navigateTo(OrganizationViewRoutes.allDmsView, id: 1);
  }

  void updateSelectedMenuIndex(int index) {
    _selectedMenuIndex = index;
    _selectedChannelIndex = -1;
    _selectedDMIndex = -1;
    notifyListeners();
  }

  bool showSelectedOrg(int index) {
    if (index == getSelectedOrganizationIndex()!) {
      return true;
    }
    return false;
  }

  bool selectedChannel(int index) {
    if (index == _selectedChannelIndex) {
      return true;
    }
    return false;
  }

  bool selectedDM(int index) {
    if (index == _selectedDMIndex) {
      return true;
    }
    return false;
  }


  @override
  void dispose() {
    controller.dispose();
    _windowTitleBarService.setHome(false);
    super.dispose();
  }

  Future<void> updateOrganizationDetails({String? url, String? name}) async {
    if (url!.isNotEmpty) {
      await _organizationService.updateOrganizationUrl(
          url: url, token: _userService.auth.user!.token);
      //organization[_selectedMenuIndex] = organization[_selectedMenuIndex].copyWith(url: url);
    }
    if (name!.isNotEmpty) {
      await _organizationService.updateOrganizationName(
          name: name, token: _userService.auth.user!.token);
      _currentOrganization = _currentOrganization.copyWith(name: name);
      final indexToUpdate = _organization.indexOf(_currentOrganization);
      _organization.insert(indexToUpdate, _currentOrganization);
    }
    _localStorageService.saveToDisk(
        _selectedOrgKey, json.encode(_organization));
    notifyListeners();
  }
}

/*void setup() async {
    await setupWorkspace();
  }

  void setCurrentWorkspaceIndex(int index) {
    log.i('$index from workspace');
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
