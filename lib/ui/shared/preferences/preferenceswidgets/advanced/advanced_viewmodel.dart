import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';


enum EnterButtonsChoice { sendMsg, newLine }

class AdvancedViewModel extends BaseViewModel{

  // input option
  /// what happens when enter is clicked on msg inputs
  bool? _onEnter = false;
  bool? get onEnter => _onEnter;
  set setOnEnter(bool? val){
    this._onEnter = val;
    notifyListeners();
  }

  /// format messages
  bool? _allowMsgFormat = false;
  bool? get allowMsgFormat => _allowMsgFormat;
  set setAllowMsgFormat(bool? val){
    this._allowMsgFormat = val;
    notifyListeners();
  }


  ///start chart with ctrl + F keys
  bool? _ctrlF = false;
  bool? get ctrlF => _ctrlF;
  set setCtrlF(bool? val){
    this._ctrlF = val;
    notifyListeners();
  }

  ///start quick switcher with ctrl + K keys
  bool? _ctrlK = false;
  bool? get ctrlK => _ctrlK;
  set setCtrlK(bool? val){
    this._ctrlK = val;
    notifyListeners();
  }

///other options
  bool? _option1= false;
  bool? get option1 => _option1;
  set setOption1(bool? val){
    this._option1 = val;
    notifyListeners();
  }

  bool? _option2= false;
  bool? get option2 => _option2;
  set setOption2(bool? val){
    this._option2 = val;
    notifyListeners();
  }

  bool? _option3= false;
  bool? get option3 => _option3;
  set setOption3(bool? val){
    this._option3 = val;
    notifyListeners();
  }

  bool? _option4= false;
  bool? get option4 => _option4;
  set setOption4(bool? val){
    this._option4 = val;
    notifyListeners();
  }


/// radio button choice options
  EnterButtonsChoice? _enterButtonsChoice = EnterButtonsChoice.sendMsg;
  EnterButtonsChoice? get enterButtonsChoice => _enterButtonsChoice;

  set setCheckVal(EnterButtonsChoice? val){
    this._enterButtonsChoice = val;
    notifyListeners();
  }

// checkbox color
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.focused
    };
    if (states.any(interactiveStates.contains)) {
      return kcBackgroundColor1;
    }
    return kcPrimaryColor;
  }

}