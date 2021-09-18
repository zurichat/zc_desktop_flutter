import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';

import 'package:stacked_services/stacked_services.dart';

import 'package:zc_desktop_flutter/app/app.router.dart';

import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';
import 'package:zc_desktop_flutter/ui/auth/login_page/login_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger("HomeViewwModel");
  String _logoUrl = 'assets/images/zc_logo2.png';
  double _logoWidth = 10.0;
  int _indexToDisplay = 0;
  double _logoHeight = 10.0;
  // bool _showThread = false;
  // bool _isChannel = true;
  // bool _isDraft = false;
  // bool _isDm = false;

  String _title =
      'Welcome to Zuri Chat! An open source, very flexible tool built by Flutter desktop team.';
  String _updatePress = '';

  String get logoUrl => _logoUrl;
  double get logoWidth => _logoWidth;
  double get logoHeight => _logoHeight;
  String get title => _title;
  // bool get isChannel => _isChannel;
  // bool get isDm => _isDm;
  // bool get isDraft => _isDraft;
  int get indexToDisplay => _indexToDisplay;

  final _storageService = locator<LocalStorageService>();

  String get testString => _storageService.getFromDisk(testLocalKey) as String;

  //bool get showThread => _showThread;
  String get updatePress => _updatePress;

  final _navigationService = locator<NavigationService>();

  void goToInputView() {
    _navigationService.navigateTo(Routes.loginView);
    notifyListeners();
  }

  void setIndexToDisplay(int index) {
    _indexToDisplay = index;
    notifyListeners();
  }

  // void setUpdatePress(String value) {
  //   _updatePress = '${_isChannel ? "Channel Id " : "DM Id " } $value';
  //   notifyListeners();  
  // }

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

  // void setIsChannel(bool value) {
  //   _isChannel = value;
  //   _isDm = !value;
  //   _isDraft = !value;
  //   notifyListeners();
  // }

  // void setIsDraft(bool value) {
  //   _isDraft = value;
  //   _isChannel = !value;
  //   _isDm = !value;
  //   notifyListeners();
  // }

  // void setIsDm(bool value) {
  //   _isDm = value;
  //   _isChannel = !value;
  //   _isDraft = !value;
  //   notifyListeners();
  // }

  // void updateWhatToShow(int index) {
  //   switch(index) {
  //     case 2:
  //       setIsDm(true);
  //       break;
  //     case 3:
  //       setIsDraft(true);
  //       break;
  //     default:
  //       setIsChannel(true);
  //   }
  //   notifyListeners();
  // }
}
