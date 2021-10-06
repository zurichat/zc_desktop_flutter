import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class StatusDialogMinTwoViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();

  String _setAStatus = 'Set A Status';
  String _hintText = 'What is your status?';
  String _clearAfter = "Clear after: Don't clear";
  String _saveBtnText = 'Save';
  String _cancelBtnText = 'Cancel';



  String get setAStatus => _setAStatus;
  String get hintText => _hintText;
  String get clearAfter => _clearAfter;
  String get saveBtnText => _saveBtnText;
  String get cancelBtnText => _cancelBtnText;

  void popDialog(){
    _navigationService.popRepeated(0);
  }
}