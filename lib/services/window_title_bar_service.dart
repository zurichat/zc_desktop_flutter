import 'package:flutter/material.dart';

class WindowTitleBarService extends ChangeNotifier {
  bool _isHome = false;
  bool get isHome => _isHome;

  set isHome(bool value) {
    _isHome = value;
    notifyListeners();
  }
}
