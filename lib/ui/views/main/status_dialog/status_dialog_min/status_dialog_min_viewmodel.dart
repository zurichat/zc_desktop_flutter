import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class StatusDialogMinViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();

  String _setAStatus = 'Set a Status';
  String _hintText = 'What is your status?';
  String _clearAfter = "Clear after: Don't clear";
  String _clearBtnText = 'Clear Status';


  String get setAStatus => _setAStatus;
  String get hintText => _hintText;
  String get clearAfter => _clearAfter;
  String get clearBtnText => _clearBtnText;

  void popDialog(){
    _navigationService.popRepeated(0);
  }

  String _statusTag = '';
  String get statusTag => _statusTag;
  void setStatusTag(String value) {
    _statusTag = value.toString();
    notifyListeners();
  }

  
  
}