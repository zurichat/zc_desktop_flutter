import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class SearchModalViewmodel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _scrollbarController = ScrollController();
  bool isClicked = false;

  ScrollController get scrollbarController => _scrollbarController;

  popDialog() {
    _navigationService.popRepeated(0);
  }
}
