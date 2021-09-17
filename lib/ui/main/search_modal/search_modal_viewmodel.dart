import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/enums/button_type_enum.dart';
  String? _text;
  String? _hintText;
  bool isClicked = false;
  bool swap = false;
  ButtonType buttonType = ButtonType.CHANNELS;

  ScrollController get scrollbarController => _scrollbarController;

  String get text => _text!;
  String get hintText => _hintText!;

  toggleButtonClicked() {
    isClicked = !isClicked;
    notifyListeners();
  }

  toggleSwap() {
    swap = !swap;
    notifyListeners();
  }

  getTextAndHintText() {
    switch (buttonType) {
      case ButtonType.CHANNELS:
        {
          _text = 'channel';
          _hintText = 'Search in Channels';
        }
        break;
      case ButtonType.MESSAGE:
        {
          _text = 'message';
          _hintText = 'Search in Messages';
        }
        break;
      case ButtonType.FILE:
        {
          _text = 'files';
          _hintText = 'Search in Files';
        }
        break;
      case ButtonType.PEOPLE:
        {
          _text = 'people';
          _hintText = 'Search anyone in workspace';
        }
        break;
    }
  }

  popDialog() {
    _navigationService.popRepeated(0);
  }
}
