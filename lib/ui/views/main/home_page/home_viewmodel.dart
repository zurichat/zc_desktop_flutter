import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger("HomeViewwModel");
  String _logoUrl = 'assets/images/zc_logo2.png';
  double _logoWidth = 10.0;
  double _logoHeight = 10.0;
  bool _showThread = false;
  String _title =
      'Welcome to Zuri Chat! An open source, very flexible tool built by Flutter desktop team.';

  String get logoUrl => _logoUrl;
  double get logoWidth => _logoWidth;
  double get logoHeight => _logoHeight;
  String get title => _title;

  final _storageService = locator<LocalStorageService>();

  bool get showThread => _showThread;

  final _navigationService = locator<NavigationService>();

  void goToInputView() {
    _navigationService.navigateTo(Routes.loginView);
    notifyListeners();
  }

  // left side bar related
  double _leftSideBarWidth = 260.w;
  double _pageHeight = double.infinity;

  double get leftSideBarWidth => _leftSideBarWidth;
  double get pageHeight => _pageHeight;

  Map<String, String> _sidebarItems = {
    'Insight': 'assets/images/Insight.png',
    'Threads': 'assets/images/Group1.png',
    'All DMs': 'assets/images/AllDMS.png',
    'Draft': 'assets/images/Group.png',
    'Files': 'assets/images/Vector.png',
    'Integrate': 'assets/images/Group2.png',
    'To-do': 'assets/images/default.png',
  };

  Map<String, String> get sidebarItems => _sidebarItems;

  String? _sideBarItemName;
  String? get sideBarItemName => _sideBarItemName;
  void showSideBarItem(String sideBarItemName) {
    _sideBarItemName = sideBarItemName;
    notifyListeners();
  }

  bool _isChannelsDropDownMenuOpen = false;
  bool _isDMsDropDownMenuOpen = false;

  bool get isChannelsDropDownMenuOpen => _isChannelsDropDownMenuOpen;
  bool get isDMsDropDownMenuOpen => _isDMsDropDownMenuOpen;

  List<Widget?>? channelsDropDown = [];
  List<Widget?>? dMsDropDown = [];

  void openChannelsDropDownMenu() {
    _isChannelsDropDownMenuOpen = !_isChannelsDropDownMenuOpen;
    notifyListeners();
  }

  void openDMsDropDownMenu() {
    _isDMsDropDownMenuOpen = !_isDMsDropDownMenuOpen;
    notifyListeners();
  }

  void iconClicked() {
    getLogger("LeftSideBar Icon Clicked");
    notifyListeners();
  }

  // center area related
  String? _rightSideText;
  String? get rightSideText => _rightSideText;
  void showRightSide(String? centerAreaText) {
    _rightSideText = centerAreaText;
    notifyListeners();
  }

  // right side bar related
  double _rightSideBarWidth = 400.w;
  double get rightSideBarWidth => _rightSideBarWidth;

  // organization bar related
  double _organizationBarWidth = 70.w;
  double get organizationBarWidth => _organizationBarWidth;
}
