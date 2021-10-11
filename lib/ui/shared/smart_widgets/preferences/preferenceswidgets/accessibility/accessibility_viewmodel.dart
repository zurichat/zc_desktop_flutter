import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';

enum UpButtonsChoice { option1, option2 }

class AccessibilityViewModel extends BaseViewModel{


  final _localStorage = locator<LocalStorageService>();
  var _accessibility = Accessibility();
  /// message settings
  bool? _animateValue = false;
  bool? get animateValue => _animateValue;
  set setAnimateValue (bool? val){
    this._animateValue = val;
    _accessibility = _accessibility.copyWith(animateValue: (_animateValue) as bool);
    notifyListeners();
  }

  String _msg = 'Choose what sounds and announcements you’d like to receive while using a screen reader';
  String get msg => _msg;

  String _boldMsg = ' inside a direct message';
  String get boldMsg => _boldMsg;


  //
  bool? _msgSound = false;
  bool? get msgSound => _msgSound;
  set setMsgSound(bool? val){
    this._msgSound = val;
    _accessibility = _accessibility.copyWith(msgSound: (_msgSound) as bool);
    notifyListeners();
  }
  String _sentMsgSound = ' Play a sound when a message is sent';
  String get sentMsgSound => _sentMsgSound;

  //
  bool? _receiveSound = false;
  bool? get receiveSound => _receiveSound;
  set setReceiveSound(bool? val){
    this._receiveSound = val;
    _accessibility = _accessibility.copyWith(receiveSound: (_receiveSound) as bool);
    notifyListeners();
  }
  String _receiveMsgSound = ' Play a sound when a message is received';
  String get receiveMsgSound => _receiveMsgSound;

  //
  bool? _readIncoming = false;
  bool? get readIncoming => _readIncoming;
  set setReadIncoming(bool? val){
    this._readIncoming = val;
    _accessibility = _accessibility.copyWith(readIncoming: (_readIncoming) as bool);
    notifyListeners();
  }
  String _readIncomingMsg = ' Read incoming message out loud';
  String get readIncomingMsg => _readIncomingMsg;



  /// keyboard settings
  String _shortCut = 'You can improve the way you use Slack by learning our';
  String get shortCutMsg => _shortCut;

  String _boldShortCutMsg = ' handy keyboard shortcuts';
  String get boldShortCutMsg => _boldShortCutMsg;


  UpButtonsChoice? _upButtonsChoice = UpButtonsChoice.option1;
  UpButtonsChoice? get upButtonsChoice => _upButtonsChoice;

  set setCheckVal(UpButtonsChoice? val){
    this._upButtonsChoice = val;
    _accessibility = Accessibility().copyWith(upButtonsChoice: (_upButtonsChoice) as UpButtonsChoice);
    notifyListeners();
  }

  void saveSettings() =>
      _localStorage.setAccessibility(_accessibility);

  void fetchAndSetSetting() async {
    _accessibility = await (_localStorage.accessibility) as Accessibility;
    _upButtonsChoice = _accessibility.upButtonsChoice;
    _animateValue = _accessibility.animateValue;
    _msgSound = _accessibility.msgSound;
    _readIncoming = _accessibility.readIncoming;
    _receiveSound = _accessibility.receiveSound;
    notifyListeners();
  }


}