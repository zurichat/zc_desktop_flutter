import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';


enum EnterButtonsChoice { sendMsg, newLine }

class AdvancedViewModel extends BaseViewModel{
  var _advanced = Advanced();
  final _advanceStorageKey = 'Advanced';
  final _sharedPref = locator<LocalStorageService>();
  // input option
  /// what happens when enter is clicked on msg inputs
  bool? _onEnter = false;
  bool? get onEnter => _onEnter;
  set setOnEnter(bool? val){
    this._onEnter = val;
    _advanced = _advanced.copyWith(whenTypyingCode: (val) as bool);
    notifyListeners();
  }

  /// format messages
  bool? _allowMsgFormat = false;
  bool? get allowMsgFormat => _allowMsgFormat;
  set setAllowMsgFormat(bool? val){
    this._allowMsgFormat = val;
    _advanced = _advanced.copyWith(formatMessage: (val) as bool);
    notifyListeners();
  }


  ///start chart with ctrl + F keys
  bool? _ctrlF = false;
  bool? get ctrlF => _ctrlF;
  set setCtrlF(bool? val){
    this._ctrlF = val;
    _advanced = _advanced.copyWith(startZuriChat: (val) as bool);
    notifyListeners();
  }

  ///start quick switcher with ctrl + K keys
  bool? _ctrlK = false;
  bool? get ctrlK => _ctrlK;
  set setCtrlK(bool? val){
    this._ctrlK = val;
    _advanced = _advanced.copyWith(quickSwitcher: (val) as bool);
    notifyListeners();
  }

///other options
  bool? _option1= false;
  bool? get option1 => _option1;
  set setOption1(bool? val){
    this._option1 = val;
    _advanced = _advanced.copyWith(alwaysScrollMessage: (val) as bool);
    notifyListeners();
  }

  bool? _option2= false;
  bool? get option2 => _option2;
  set setOption2(bool? val){
    this._option2 = val;
    _advanced = _advanced.copyWith(toggleAwayStatus: (val) as bool);
    notifyListeners();
  }

  bool? _option3= false;
  bool? get option3 => _option3;
  set setOption3(bool? val){
    this._option3 = val;
    _advanced = _advanced.copyWith(sendOccasionalSurvey: (val) as bool);
    notifyListeners();
  }

  bool? _option4= false;
  bool? get option4 => _option4;
  set setOption4(bool? val){
    this._option4 = val;
    _advanced = _advanced.copyWith(meliciousLinkWarning: (val) as bool);
    notifyListeners();
  }


/// radio button choice options
  EnterButtonsChoice? _enterButtonsChoice = EnterButtonsChoice.sendMsg;
  EnterButtonsChoice? get enterButtonsChoice => _enterButtonsChoice;

  set setCheckVal(EnterButtonsChoice? val){
    this._enterButtonsChoice = val;
    _advanced = _advanced.copyWith(writingMessage: (val) as EnterButtonsChoice);
    notifyListeners();
  }

  void saveToStorage() {
    _sharedPref.saveToDisk(_advanceStorageKey, jsonEncode(_advanced));
  }

  Future<void> fetchAndSetFromDisk() async {
    var result = await _sharedPref.getFromDisk(_advanceStorageKey);
    _advanced = Advanced.fromJson(jsonDecode(result.toString()));
    _onEnter = _advanced.whenTypyingCode;
    _allowMsgFormat = _advanced.formatMessage;
    _ctrlF = _advanced.startZuriChat;
    _ctrlK = _advanced.quickSwitcher;
    _option1 = _advanced.alwaysScrollMessage;
    _option2 = _advanced.toggleAwayStatus;
    _option3 = _advanced.sendOccasionalSurvey;
    _option4 = _advanced.meliciousLinkWarning;
    _enterButtonsChoice = _advanced.writingMessage;
    notifyListeners();
  }

}