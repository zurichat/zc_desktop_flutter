import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/enums/button_type_enum.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/channel_service.dart';
import 'package:zc_desktop_flutter/services/dm_service.dart';
import 'package:zc_desktop_flutter/services/users_loacal_data.dart';

// import 'package:zc_desktop_flutter/models/channels_model/channels_model.dart';
// import 'package:zc_desktop_flutter/services/search_service/channel_service.dart';

class SearchModalViewmodel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dmService = locator<DMService>();
  final _channelService = locator<ChannelService>();

  String? _text;
  String? _hintText;
  String? _textFieldText;
  int? userDataLength;
  int? availableListLength;
  bool isClicked = false;
  bool swap = false;
  bool textFieldActivated = false;
  ButtonType buttonType = ButtonType.CHANNELS;
  late List<DummyUser> users;
  final userData = usersData;

  String searchQuery = '';

  String get text => _text!;
  String get hintText => _hintText!;
  String get textFieldText => _textFieldText!;
  List<dynamic> _searchList = [];
  List<dynamic> get searchList => [..._searchList];
  List<DummyUser> _userNames = [];
  List<DummyUser> get userDatas => [..._userNames];
  static const historyLength = 5;
  List<String> searchHistory = [];
  // List<Channels>? filteredChannelList;
  String? selectedTerm;

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
          availableListLength = _channelService.channelListLength;
        }
        break;
      case ButtonType.MESSAGE:
        {
          _text = 'message';
          _hintText = 'Search in Messages';
          availableListLength = userData.length;
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
      default:
        {}
        break;
    }
  }

  popDialog() {
    _navigationService.popRepeated(0);
  }

  void getSuggestionsForDM(String query) {
    _searchList = userData;
    var userList;
    userList = List.of(_searchList).where((e) {
      final userLower = e.name!.toLowerCase();
      final queryLower = query.toLowerCase();
      return userLower.startsWith(queryLower);
    }).toList();

    availableListLength = userList.length;
    _searchList = userList;

    notifyListeners();
  }

  void onChange(String value) {
    textFieldActivated = true;
    switch (buttonType) {
      case ButtonType.CHANNELS:
        {
          getSuggestionsForChannels(value);
        }
        break;
      case ButtonType.PEOPLE:
        {
          getSuggestionsForDM(value);
        }
        break;
      default:
    }
    notifyListeners();
  }

  void getSuggestionsForChannels(String query) {
    _searchList = _channelService.channelList;
    var filteredList;
    filteredList = List.of(_searchList).where((e) {
      final channelNameToLower = e.name!.toLowerCase();
      final queryLower = query.toLowerCase();
      return channelNameToLower.startsWith(queryLower);
    }).toList();

    availableListLength = filteredList.length;
    _searchList = filteredList;

    notifyListeners();
  }

  void searchNavigate(dynamic data) {
    switch (buttonType) {
      case ButtonType.CHANNELS:
        {
          searchChannels(data as Channel);
        }
        break;
      case ButtonType.PEOPLE:
        {
          searchUser(data as DummyUser);
        }
        break;
      default:
    }
  }

  void searchChannels(Channel channel) {
    _channelService.setChannel(channel);
    _navigationService.navigateTo(WorkspaceViewRoutes.channelsView, id: 1);
  }

  void searchUser(DummyUser user) {
    _dmService.setUser(user);
    _navigationService.navigateTo(WorkspaceViewRoutes.dmView, id: 1);
  }
}
