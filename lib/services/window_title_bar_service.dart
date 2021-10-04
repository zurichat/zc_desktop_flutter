import 'package:flutter/material.dart';

class WindowTitleBarService extends ChangeNotifier {
  bool _isHome = false;
  bool get IsHome => _isHome;

  void setHome(bool value) {
    _isHome = value;
    notifyListeners();
  }
}
