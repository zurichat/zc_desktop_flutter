import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';

class ProfileDropdownViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final _organizationService = locator<OrganizationService>();
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  // final _organizationId = locator<OrganizationService>();

  String email = '';
  Organization _currentOrganization = Organization();

  Organization get currentOrganization => _currentOrganization;

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
    displayName: profileCurrentName,
    bio: '',
    phone: '',
    img: profileCurrentImg,
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
  Member get member => _organizationService.organization!.member!;

  setIsDropped() {
    _isDropped = !_isDropped;
    notifyListeners();
  }

  onEntered(bool isHover) {
    _isHover = isHover;
    notifyListeners();
  }

  Future<void> getdetails() async {
    await _userService.fetchMemberDetails(
      member.displayName,
    );
  }

  // void goToViewProfile() {
  //   _navigationService.navigateTo(OrganizationViewRoutes.profileShowView, id:0);
  // }

  void signOut() async {
    _authService.logOut(_userService.auth.user!.token.toString());
    await Future.delayed(Duration(milliseconds: 500));
    _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }
}
