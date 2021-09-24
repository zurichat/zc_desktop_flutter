import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class PreferenceViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  var _currentPageIndex = 0;

  get currentPageIndex => _currentPageIndex;

  void updatePageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }
}
