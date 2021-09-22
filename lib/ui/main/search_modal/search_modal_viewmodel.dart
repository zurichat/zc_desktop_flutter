import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/enums/button_type_enum.dart';
import 'package:zc_desktop_flutter/models/dummy_user_model/user_model.dart';
import 'package:zc_desktop_flutter/services/dm_service/dm_service.dart';
import 'package:zc_desktop_flutter/services/search_workspace/users_loacal_data.dart';

// import 'package:zc_desktop_flutter/models/channels_model/channels_model.dart';
// import 'package:zc_desktop_flutter/services/search_service/channel_service.dart';

class SearchModalViewmodel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dmService = locator<DMService>();
  // final _availableChannels = locator<ChannelService>();

  String? _text;
  String? _hintText;
  String? _textFieldText;
  int? userDataLength;
  //int? availableUserLength;
  bool isClicked = false;
  bool swap = false;
  bool textFieldActivated = false;
  ButtonType buttonType = ButtonType.CHANNELS;
  late List<User> users;
  final userData = usersData;

  String searchQuery = '';

  String get text => _text!;
  String get hintText => _hintText!;
  String get textFieldText => _textFieldText!;
  // List<Channels> _channels = [];
  // List<Channels> get channels => [..._channels];
  List<User> _userNames = [];
  List<User> get userDatas => [..._userNames];
  static const historyLength = 5;
  List<String> searchHistory = [];
  // List<Channels>? filteredChannelList;
  String? selectedTerm;

  copyChannels() {
    // _channels = _availableChannels.channelList;
  }

  toggleButtonClicked() {
    isClicked = !isClicked;
    notifyListeners();
  }

  toggleTextFieldActivated() {
    textFieldActivated = !textFieldActivated;
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
          // availableChannelLength = _availableChannels.channelListLength;
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

  // List<User> getSusggestions(String query) => List.of(userData).where((user) {
  //       final userLower = user.name!.toLowerCase();
  //       final queryLower = query.toLowerCase();

  //       return userLower.contains(queryLower);
  //     }).toList();

  void getSuggestions(String query) {
    _userNames = userData;
    var userList;
    userList = List.of(userData).where((e) {
      final userLower = e.name!.toLowerCase();
      final queryLower = query.toLowerCase();
      return userLower.startsWith(queryLower);
    }).toList();

    userDataLength = userList.length;
    _userNames = userList;

    notifyListeners();
  }

  void onChange(String value) {
    textFieldActivated = true;
    getSuggestions(value);
    notifyListeners();
  }
  // void getSuggestionsForChannels(String query) {
  //   _channels = _availableChannels.channelList;
  //   var chanList;
  //   chanList = List.of(_channels).where((e) {
  //     final channelNameToLower = e.name!.toLowerCase();
  //     final queryLower = query.toLowerCase();
  //     return channelNameToLower.startsWith(queryLower);
  //   }).toList();

  //   availableChannelLength = chanList.length;
  //   _channels = chanList;

  //   notifyListeners();
  // }

  void searchUser(User user) {
    _dmService.setUser(user);
    _navigationService.navigateTo(WorkspaceViewRoutes.dmView, id: 1);
  }
}
