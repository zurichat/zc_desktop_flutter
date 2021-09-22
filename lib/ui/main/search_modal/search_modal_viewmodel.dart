import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

import 'package:zc_desktop_flutter/core/enums/button_type_enum.dart';
import 'package:zc_desktop_flutter/models/channels_model/channels_model.dart';
import 'package:zc_desktop_flutter/services/search_service/channel_service.dart';

class SearchModalViewmodel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _availableChannels = locator<ChannelService>();
  
  String? _text;
  String? _hintText;
  String? _textFieldText;
  int? availableChannelLength;
  bool isClicked = false;
  bool swap = false;
  bool textFieldActivated = false;
  ButtonType buttonType = ButtonType.CHANNELS;

  String get text => _text!;
  String get hintText => _hintText!;
  String get textFieldText => _textFieldText!;
  List<Channels> _channels = [];
  List<Channels> get channels => [..._channels];

  static const historyLength = 5;
  List<String> searchHistory = [];
  List<Channels>? filteredChannelList;
  String? selectedTerm;

  copyChannels() {
    _channels = _availableChannels.channelList;
  }

  toggleButtonClicked() {
    isClicked = !isClicked;
    notifyListeners();
  }

  toggleSwap() {
    swap = !swap;
    notifyListeners();
  }

  toggleTextFieldActivated() {
    textFieldActivated = !textFieldActivated;
    notifyListeners();
  }

  getTextAndHintText() {
    switch (buttonType) {
      case ButtonType.CHANNELS:
        {
          _text = 'channel';
          _hintText = 'Search in Channels';
          availableChannelLength = _availableChannels.channelListLength;
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


  void onChange(String value) {
    textFieldActivated = true;
    getSuggestions(value);
    notifyListeners();
  }

  void getSuggestions(String query) {
    _channels = _availableChannels.channelList;
    var chanList;

    chanList = List.of(_channels).where((e) {
      final channelNameToLower = e.name!.toLowerCase();
      final queryLower = query.toLowerCase();
      return channelNameToLower.startsWith(queryLower);
    }).toList();

    availableChannelLength = chanList.length;
    _channels = chanList;

    notifyListeners();

  }
}
