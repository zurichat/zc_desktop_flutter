import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';

class WindowTitleBarModel extends BaseViewModel {
  final _windowTitleBarService = locator<WindowTitleBarService>();

  WindowTitleBarModel() {
    _windowTitleBarService.addListener(() {
      _isHomeView = _windowTitleBarService.IsHome;
      notifyListeners();
    });
  }

  bool _isHomeView = false;

  bool get isHomeView => _isHomeView;
}
