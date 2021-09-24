import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class ProfileShowViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }
}
