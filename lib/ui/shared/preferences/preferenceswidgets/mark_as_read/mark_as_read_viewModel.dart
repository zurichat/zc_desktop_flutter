import 'package:stacked/stacked.dart';

enum UpButtonsChoice { option1, option2, option3 }

class MarkAsReadViewModel extends BaseViewModel {
  /// message settings
  bool? _animateValue = false;
  bool? get animateValue => _animateValue;
  set setAnimateValue(bool? val) {
    this._animateValue = val;
    notifyListeners();
  }

  String _msg =
      'Zuri marks a channel read as soon as you view it. You can change this if you’d like.';
  String get msg => _msg;

  String _boldMsg = 'When I view a channel:';
  String get boldMsg => _boldMsg;

  //
  bool? _option1 = false;
  bool? get option1 => _option1;
  set setOption1(bool? val) {
    this._option1 = val;
    notifyListeners();
  }

  String _clickoption1 = 'Start me where I left off, and mark the channel read';
  String get clickOption1 => _clickoption1;

  bool? _option2 = false;
  bool? get option2 => _option2;
  set setOption2(bool? val) {
    this._option1 = val;
    notifyListeners();
  }

  String _clickOption2 =
      'Start me at the newest message, and mark the channel read';
  String get clickOption2 => _clickOption2;

  bool? _option3 = false;
  bool? get option3 => _option3;
  set setOption3(bool? val) {
    this._option1 = val;
    notifyListeners();
  }

  String _clickOption3 =
      'Start me at the newest message, but leave unseen messages unread';
  String get clickOption3 => _clickOption3;

  /// Second Section
  String _sBoldMsg = 'When I mark everything as read:';
  String get sBoldMsg => _sBoldMsg;

  bool? _markAll = false;
  bool? get markAll => _markAll;
  set setMarkAll(bool? val) {
    this._markAll = val;
    notifyListeners();
  }

  String _clickMarkAll = 'Prompt to confirm';
  String get clickMarkAll => _clickMarkAll;

  /// keyboard settings

  /// keyboard settings
  String _fShortCutMsg = 'Mark all messages in current channel as read';
  String get fShortCutMsg => _fShortCutMsg;

  String _sShortCutMsg = 'Mark all messages as read';
  String get sShortCutMsg => _sShortCutMsg;

  String _tShortCutMsg = 'Mark all messages as unread';
  String get tShortCutMsg => _tShortCutMsg;

  UpButtonsChoice? _upButtonsChoice = UpButtonsChoice.option1;
  UpButtonsChoice? get upButtonsChoice => _upButtonsChoice;

  set setCheckVal(UpButtonsChoice? val) {
    this._upButtonsChoice = val;
    notifyListeners();
  }
}
