import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';

class ChooseWorkspaceViewmodel extends BaseViewModel {
  final log = getLogger('ChooseWorkspaceViewmodel');
  final _navigationService = locator<NavigationService>();
  final _organizationService = locator<OrganizationService>();
  final _userService = locator<UserService>();
  final _localStorageService = locator<LocalStorageService>();
  final String _selectedOrgKey = 'SelectedOrgKey';
  User get user => _userService.auth.user!;
  List<Organization> _orgList = [];
  List<Organization> get orgList => [..._orgList];
  List<bool>? _isChecked;
  List<bool>? get isChecked => _isChecked;
  List<Organization> _selectedListOfOrg = [];
  int? _selectedOrg;
  int get selectOrg => _selectedOrg!;
  bool value = false;
  //int _counter = 0;
  int get counter => _selectedListOfOrg.length;

  final _windowsTitleBarService = locator<WindowTitleBarService>();
  

  Future<void> init() async {
    await fetchOrganizationList();
    await check();
    await getSelectedOrg();
    await Future.delayed(Duration(milliseconds: 1));
    _windowsTitleBarService.setHome(false);
    _windowsTitleBarService.setTitle('Zuri | Select WorkSpace');
  }

  Future<List<bool>> check() async {
    _isChecked = List.generate(orgLength, (index) => false);
    return _isChecked!;
  }

  void onChange(bool newValue, int index) async {
    _isChecked![index] = newValue;
    updateSelectedOrgList(index);
    notifyListeners();
  }

  void updateSelectedOrgList(int index) {
    if (_selectedListOfOrg.contains(_orgList[index])) {
      final int indexToRemove = _selectedListOfOrg.indexOf(_orgList[index]);
      _selectedListOfOrg.removeAt(indexToRemove);
      log.i(_selectedListOfOrg.length);
      return;
    }
    _selectedListOfOrg.add(_orgList[index]);

    log.i(_selectedListOfOrg.length);
    // saveSelectedOrg();
    notifyListeners();
  }

  void saveSelectedOrg() {
    _localStorageService.saveToDisk(
        _selectedOrgKey, json.encode(_selectedListOfOrg));
    log.i('$_selectedListOfOrg -------------------------------------------');
  }

  Future<void> getSelectedOrg() async {
    try {
      final result = await json.decode(
          _localStorageService.getFromDisk(_selectedOrgKey).toString()) as List;
      log.i('************* $result');
      result.forEach((element) {
        _selectedListOfOrg.add(Organization.fromJson(element));
      });
      log.i(
          '$_selectedListOfOrg =========================================================');
      _selectedListOfOrg.forEach((element) {
        if (_orgList.contains(element)) {
          final index = _orgList.indexOf(element);
          _isChecked![index] = true;
        }
      });
    } catch (e) {
      log.i(e);
    }
  }

  int get orgLength => _orgList.length;

  Future<void> fetchOrganizationList() async {
    _orgList = await runBusyFuture(_organizationService.getOrganizations());
  }

  void goToCreateWorkSpace() {
    _navigationService.navigateTo(Routes.createWorkspaceView);
  }

  void goToCreateAccount() {
    _navigationService.navigateTo(Routes.signUpView);
  }

  void goToOrganizationView() {
    _navigationService.navigateTo(Routes.organizationView);
  }
}
