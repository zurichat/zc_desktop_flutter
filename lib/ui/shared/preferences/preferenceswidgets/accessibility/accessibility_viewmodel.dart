import 'package:stacked/stacked.dart';

enum UpButtonsChoice { option1, option2 }

class AccessibilityViewModel extends BaseViewModel{


  /// message settings
  bool? _animateValue = false;
  bool? get animateValue => _animateValue;
  set setAnimateValue (bool? val){
    this._animateValue = val;
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
    notifyListeners();
  }
  String _sentMsgSound = ' Play a sound when a message is sent';
  String get sentMsgSound => _sentMsgSound;

  //
  bool? _receiveSound = false;
  bool? get receiveSound => _receiveSound;
  set setReceiveSound(bool? val){
    this._receiveSound = val;
    notifyListeners();
  }
  String _receiveMsgSound = ' Play a sound when a message is received';
  String get receiveMsgSound => _receiveMsgSound;

  //
  bool? _readIncoming = false;
  bool? get readIncoming => _readIncoming;
  set setReadIncoming(bool? val){
    this._readIncoming = val;
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
    notifyListeners();
  }


}