import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';

class ProfileDropdownViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _windowTitleBarService = locator<WindowTitleBarService>();
  // final _organizationId = locator<OrganizationService>();

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
  User get user => _userService.auth.user!;

  setIsDropped() {
    _isDropped = !_isDropped;
    notifyListeners();
  }

  onEntered(bool isHover) {
    _isHover = isHover;
    notifyListeners();
  }

  // getUserDetail() async {
  //   var user = await _api.fetchUserDetail(userId: userIdKey);
  //   email = user.email;
  //   notifyListeners();
  // }

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
  void signOut() {
    _windowTitleBarService.setHome(false);
    _authService.logOut(_userService.auth.user!.token.toString());
    _navigationService.pushNamedAndRemoveUntil(Routes.loginView);

  }
}
