import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';

class PeopleUserGroupViewModel extends BaseViewModel with Validator {
  final _organizationService = locator<OrganizationService>();
  final _userService = locator<UserService>();
  final _log = getLogger('PeopleUserGroupViewModel');
  // _pageIndex is used to keep track of the current view.
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  // This varible is used to know if user has start searching through the list of users
  bool _isSearchStarted =  false;

  //This function update the value of [_isSearched] and update listeners
  void _updateIsSearchStarted(bool value) {
    _isSearchStarted = value;
    notifyListeners();
  }

  //An error text to be displayed if the email verification failed.
  String? _errorText;
  get errorText => _errorText;
  //The boolean value is used to keep track of the view state
  // which initial value is set to false
  bool _isLoading = false;
  get isLoading => _isLoading;

  // Creating a list of dummy datas to be used for ui design.
  // This list contains all the users in the workspace.
  // Querys are performed on this list so we don't have to be making api
  // calls each time user want to perform a search
  List<Users> _dataList = [];

  //The function is used to fetch and set the list of organization members.
  void fetchAndSetOrgMembers() async {
    setIsloading();
    final response = await _organizationService.fetchMemberListUsingOrgId(
        _organizationService.getOrganizationId(), _userService.auth.user!.token);
    _dataList = response;
    _log.i(_dataList);
    setIsloading();
  }

  //This function update the view state using the _isLoading boolean value by inverting it's value
  void setIsloading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  // A list to hold the suggestions
  List<Users> _suggestionsList = [];

  //If _suggestionsList is empty
  //i.e the user did not search for any user yet then the data list should be returned
  List<Users> get suggestionList =>
      !_isSearchStarted ? _dataList : _suggestionsList;

  // Change the page index based on what user selected.
  // Assign the parameter value to _pageIndex
  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  /// The function perform a search on the _dataList and save the result of the search
  /// to _suggestionsList.
  void buildSuggestion(String query) {
    if(query.isEmpty) {
      _updateIsSearchStarted(false);
    } else {
      _updateIsSearchStarted(true);
    }
    _suggestionsList = _dataList
        .where((data) =>
            data.display_name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //The function set the list _dataList to an empty list when user leave the view to save memory.
  void setDataListTONull() {
    _dataList = [];
    _suggestionsList = [];
    notifyListeners();
  }

  //This Function is used to add user to an organization using the org id and the user email
  Future<void> peformAddUserToOrg(String email) async {
    try {
      if (!emailValidator(email)) {
        _errorText = EmailErrorText;
        notifyListeners();
        return;
      }
      _errorText = null;
      notifyListeners();
      await _organizationService.addMemberToOrganization(
          _organizationService.getOrganizationId(),
          email: email,
          token: _userService.auth.user!.token);
          fetchAndSetOrgMembers();
    } catch (e) {
      if(e.toString() == '400') {
        throw Failure(UserAdditionErrorMessage);
      }
      throw Failure(AuthErrorMessage);
    }
  }

  ///This function is get called from the view to peform the add user to organization logic
  Future<void> addUserToOrg(String email) async {
    await runBusyFuture(peformAddUserToOrg(email));
  }

  @override
  void onFutureError(error, Object? key) {
    super.onFutureError(error, key);
  }
}
