import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/zuri_api_service.dart';

class ProfileDropdownViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final _organizationId = locator<OrganizationService>();
  final _api = locator<ZuriApiService>();

  String email = '';

  User _currentUser = User(
    id: '',
    firstName: '',
    lastName: '',
    displayName: '',
    email: '',
    phone: '',
    status: 0,
    timeZone: '',
    createdAt: '',
    updatedAt: '',
    token: '',
  );

  User get currentUser => _currentUser;

  bool _isDropped = false;
  bool _isHover = false;

  String get emaill => email;
  bool get isDropped => _isDropped;
  bool get isHover => _isHover;

  setIsDropped(bool value) {
    _isDropped = value;
    notifyListeners();
  }

  onEntered(bool isHover) {
    _isHover = isHover;
    notifyListeners();
  }

  getUserDetail() async {
    var user = await _api.fetchUserDetail(userId: userIdKey);
    email = user.email;
    notifyListeners();
  }

  getUserDetails() async {
    var user = await _userService.getUser(userIdKey);
    email = user.email;
    notifyListeners();
  }

  // getUserDisplayName() async {
  //   var memberId = await _userService.getMemeberId();
  //   // var member = await _userService.getMember(memberId);
  //   _displayName = member.email;
  //   notifyListeners();

  //   print(member);
  //   // _userService.fetchUserDetails().then((value) {
  //   //   _displayName = value.displayName;
  //   //   notifyListeners();
  //   // });
  // }
}
