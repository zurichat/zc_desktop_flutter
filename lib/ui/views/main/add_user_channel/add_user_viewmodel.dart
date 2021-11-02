import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';

class AddUserViewModel extends BaseViewModel {
  //Declare the services that are dependent upon
  final _navigator = locator<NavigationService>();
  final _channelService = locator<ChannelsService>();
  final _organizationService = locator<OrganizationService>();
  final _userService = locator<UserService>();

  final log = getLogger('AddUserToChannel');

  /// This variable keeps track of the [isDropped] field visibility state. When set to true
  /// trigers a dropdown.
  bool _isDropped = false;
  bool get isDropped => _isDropped;

  /// This variables keep tract of a list of selected [user]
  List<Users> _user = [];

  /// This variable keeps tract of [searchList] depending on users keyword(s).
  List<Users> _searchList = [];
  List<Users> get searchList => _searchList;

  /// This variable keeps tract of selcted [usersToBeAdded] to a channel
  List<Users> _usersToBeAdded = [];
  List<Users> get usersToBeAdded => _usersToBeAdded;

  /// This varialble keep tract of a selected users index
  int _selectedUserIndex = 0;
  int get selectedUserIndex => _selectedUserIndex;

  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }

  /// This function update the state of [_isDropped] when the relative action is
  /// triggered. Act more like the setter for the variable.
  void setIsDropped() {
    _isDropped = !_isDropped;
    notifyListeners();
  }

  /// This function acts as a setter and update state to [_selectedUserIndex], it takes
  /// an index and adds to [_searchList]
  void setSelectUserIndex(int index) {
    _selectedUserIndex = index;
    addUsersToBeAdded(_searchList[index]);
    notifyListeners();
  }

  /// This is the function that accepts users to be added to channel
  void addUsersToBeAdded(Users user) {
    if (_usersToBeAdded.length < 5) {
      _usersToBeAdded.add(user);
      notifyListeners();
    }
  }

  /// This is the function that removes slected users to be added to channel
  void removeUsersToBeAdded(int index) {
    _usersToBeAdded.removeAt(index);
    notifyListeners();
  }

  /// This function validates all the enteries to add a user to a channel
  /// if all fields are validated, user is added to a channel
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

  /// This function adds a group of selected users to a channel.
  Future<void> addUsersToChannel() async {
    _usersToBeAdded.forEach((user) {
      performAddUserToChannel(user.id ?? '');
    });
  }

  /// This function retrives users of a particular organisation
  Future<void> fetchUsers() async {
    _user = await _organizationService.fetchMemberListUsingOrgId(
        _organizationService.getOrganizationId(),
        _userService.auth.user!.token);
  }

  /// [search] functions querries an orgnisation and presents a list
  /// of users depending on the keywords entered

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
