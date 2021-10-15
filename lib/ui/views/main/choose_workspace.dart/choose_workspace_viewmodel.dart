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
  List<String> _selectedListOfOrg = [];
  int? _selectedOrg;
  int get selectOrg => _selectedOrg!;
  bool value = false;
  int _counter = 0;
  int get counter => _counter;

  Future<void> init() async {
    await fetchOrganizationList();
    await check();
    await getSelectedOrganization();
  }

  void getCounter(int index) {
    if (_isChecked![index] == false && _counter != 0) {
      _counter--;
    } else {
      _counter++;
    }

    notifyListeners();
  }

  Future<void> saveSelectedOrganization() async {
    _isChecked!.forEach((selectedOrg) {
      if (selectedOrg == true) {
        _selectedListOfOrg.add(selectedOrg.toString());
      } else {}
    });

    await _localStorageService.saveToDisk(_selectedOrgKey, _selectedListOfOrg);
  }

  Future<void> getSelectedOrganization() async {
    await _localStorageService.getFromDisk(_selectedOrgKey);
  }

  Future<List<bool>> check() async {
    _isChecked = List.generate(orgLength, (index) => false);
    return _isChecked!;
  }

  void onChange(bool newValue, int index) async {
    var trueValue = [];
    //var indexedValue;
    _isChecked![index] = newValue;
    //log.i(_isChecked);
    _isChecked!.forEach((index) {
      if (index == true) {
      //  indexedValue = _isChecked!.indexOf(index);
        trueValue.add(index);
      } else {
        trueValue.remove(index);
      }
    });
    log.i(trueValue);
    //log.i(indexedValue);
    notifyListeners();
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
}
