import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftSideBarViewModel extends BaseViewModel{

  double _pageWidth = double.infinity;
  double _pageHeightOne = 80.h;
  double _pageHeightTwo = 100.h;
  double _leftSideBarWidth = 350.w;
  double _leftSideBarHeight = 1024.h;
  double _leftSideBarPadding = 45.w;

  double get pageWidth => _pageWidth;
  double get pageHeightOne => _pageHeightOne;
  double get pageHeightTwo => _pageHeightTwo;
  double get leftSideBarWidth => _leftSideBarWidth;
  double get leftSideBarHeight => _leftSideBarHeight;
  double get leftSideBarPadding => _leftSideBarPadding;

  String _insight = "Insight";
  String _threads = "Threads";
  String _allDms = "All DMs";
  String _draft = "Draft";
  String _files = "Files";
  String _integrate = "Integrate";
  String _toDo = "To-do";

  String get insight => _insight;
  String get threads => _threads;
  String get allDms => _allDms;
  String get draft =>  _draft;
  String get files => _files;
  String get integrate => _integrate;
  String get toDo => _toDo;

  String _insightUrl = 'assets/images/Insight.png';
  String _threadsUrl = 'assets/images/Group1.png';
  String _allDmsUrl = 'assets/images/AllDMS.png';
  String _draftUrl = 'assets/images/Group.png';
  String _filesUrl = 'assets/images/Vector.png';
  String _integrateUrl = 'assets/images/Group2.png';
  String _toDoUrl = 'assets/images/default.png';

  String get insightUrl => _insightUrl;
  String get threadsUrl => _threadsUrl;
  String get allDmsUrl => _allDmsUrl;
  String get draftUrl =>  _draftUrl;
  String get filesUrl => _filesUrl;
  String get integrateUrl => _integrateUrl;
  String get toDoUrl => _toDoUrl;
  

  void iconClicked(){
    getLogger("LeftSideBar Icon Clicked");
    notifyListeners();
  }
}
