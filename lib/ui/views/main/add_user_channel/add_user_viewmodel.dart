import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';

class AddUserViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _channelService = locator<ChannelsService>();
  final _organizationService = locator<OrganizationService>();
  final _userService = locator<UserService>();
  final log = getLogger('AddUserToChannel');
  bool _isDropped = false;
  bool get isDropped => _isDropped;
  List<Users> _user = [];
  List<Users> _searchList = [];
  List<Users> _usersToBeAdded = [];
  int _selectedUserIndex = -1;

  List<Users> get searchList => _searchList;
  List<Users> get usersToBeAdded => _usersToBeAdded;

  int get selectedUserIndex => _selectedUserIndex;

  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }

  void setIsDropped() {
    _isDropped = !_isDropped;
    notifyListeners();
  }

  void setSelectUserIndex(int index) {
    _selectedUserIndex = index;
    addUsersToBeAdded(_searchList[index]);
    notifyListeners();
  }

  void addUsersToBeAdded(Users user) {
    if (_usersToBeAdded.length < 2) {
      _usersToBeAdded.add(user);
      notifyListeners();
    }
  }

  void removeUsersToBeAdded(int index) {
    _usersToBeAdded.removeAt(index);
    notifyListeners();
  }

  Future<void> performAddUserToChannel(String id) async {
    try {
      await runBusyFuture(_channelService.addUserToChannel(
          id: id,
          role_id: 'mentor',
          is_admin: true,
          prop1: '',
          prop2: '',
          prop3: ''));
    } catch (e) {
      log.i(e);
    }
  }

  Future<void> addUsersToChannel() async {
    _usersToBeAdded.forEach((user) {
      performAddUserToChannel(user.id ?? '');
    });
  }

  Future<void> fetchUsers() async {
    _user = await _organizationService.fetchMemberListUsingOrgId(
        _organizationService.getOrganizationId(),
        _userService.auth.user!.token);
  }

  void search(String query) {
    if (_isDropped) {
      setIsDropped();
    }
    if (query.isNotEmpty) {
      query = query.toLowerCase();
      _searchList = _user
          .where((user) =>
              user.displayName.toLowerCase().contains(query) ||
              user.name.toLowerCase().contains(query))
          .toList();
      notifyListeners();
    }
  }
}
