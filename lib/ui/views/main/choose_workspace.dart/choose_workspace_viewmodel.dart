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
//updates the none Selected text to the number of workspaces selected by user
  int get counter => _selectedListOfOrg.length;
//This is being called in onModelReady to fetch all the neccessary data needed ONCE
  Future<void> init() async {
    await fetchOrganizationList();
    await check();
    await getSelectedOrg();
  }
//for the CheckBoxes we generate a list of bool, same as the length of workspaces user belongs to
//Then we set it to false which is then toggled based on User interaction with the UI

  Future<List<bool>> check() async {
    _isChecked = List.generate(orgLength, (index) => false);
    return _isChecked!;
  }

//This toggles the value at the index in particular
// and is populated to a new list Which contains only tru values
  void onChange(bool newValue, int index) async {
    _isChecked![index] = newValue;
    updateSelectedOrgList(index);
    notifyListeners();
  }

//We check if the workspace at this index is selected, then we remove it, if not we add,
  void updateSelectedOrgList(int index) {
    if (_selectedListOfOrg.contains(_orgList[index])) {
      final int indexToRemove = _selectedListOfOrg.indexOf(_orgList[index]);
      _selectedListOfOrg.removeAt(indexToRemove);
      log.i(_selectedListOfOrg.length);
      return;
    }
    _selectedListOfOrg.add(_orgList[index]);

    log.i(_selectedListOfOrg.length);
    notifyListeners();
  }

//this saves the selected organization to local Storage and persists the data

  void saveSelectedOrg() {
    _localStorageService.saveToDisk(
        _selectedOrgKey, json.encode(_selectedListOfOrg));
    log.i('$_selectedListOfOrg -------------------------------------------');
  }

//Fetches the selected organization from local storage and restores the data
//ensuring that the workspaces selected by the user remains selected
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

//Returns length of orgnization
  int get orgLength => _orgList.length;
//This fetches the list of organization and stores it in the orgList variable
  Future<void> fetchOrganizationList() async {
    _orgList = await runBusyFuture(_organizationService.getOrganizations());
  }

//navigates User to create the Create a worrkspace screen
  void goToCreateWorkSpace() {
    _navigationService.navigateTo(Routes.createWorkspaceView);
  }

//navigates user to create an account screen
  void goToCreateAccount() {
    _navigationService.navigateTo(Routes.signUpView);
  }

//navigates user to organization view
//where the logo of selected organizations by user is displayed on the left side container
//Onclick of any of these logos the user is navigated to the workspace in question
  void goToOrganizationView() {
    _navigationService.navigateTo(Routes.organizationView);
  }
}
