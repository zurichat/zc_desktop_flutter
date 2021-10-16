import 'package:flutter/material.dart';

class WindowTitleBarService extends ChangeNotifier {
  bool _isHome = false;
  String _title = 'Zuri | Sign In';
  bool get IsHome => _isHome;
  String get Title => _title;

  void setHome(bool value) {
    _isHome = value;
    notifyListeners();
  }

  void setTitle(String value) {
    _title = value;
    notifyListeners();
  }
}
