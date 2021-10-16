import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';

class ProfileDropdownViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
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
  
  Member _currentMember = Member(
    id: '',
    orgId: '',
    firstName: '',
    lastName: '',
    displayName: 'perpKate',
    bio: '',
    phone: '',
    pronouns: '',
    timeZone: '',
    createdAt: '',
    updatedAt: '',
  );

  

  User get currentUser => _currentUser;
  Member get currentMember => _currentMember;

  bool _isDropped = false;
  bool _isHover = false;

  

  String get emaill => email;
  bool get isDropped => _isDropped;
  bool get isHover => _isHover;
  User get user => _userService.auth.user!;
  Member get member => _userService.organization!.member!;


  setIsDropped() {
    _isDropped = !_isDropped;
    notifyListeners();
  }

  onEntered(bool isHover) {
    _isHover = isHover;
    notifyListeners();
  }

  // void signOut() async {
  
  void signOut() {
    _authService.logOut(_userService.auth.user!.token.toString());
    _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }
}
