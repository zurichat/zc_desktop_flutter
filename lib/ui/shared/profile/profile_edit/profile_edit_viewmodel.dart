import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class ProfileEditViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();

  final scrollController = ScrollController();

  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }
}
