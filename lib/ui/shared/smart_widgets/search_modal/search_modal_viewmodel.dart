import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/enums/button_type_enum.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
import 'package:zc_desktop_flutter/services/dm_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/search_modal/users_local_data.dart';

class SearchViewModel extends BaseViewModel {
  static const savedSearchKey = 'savedSearches';
  final _log = getLogger('SearchViewModel');
  final _navigationService = locator<NavigationService>();
  final _dmService = locator<DMService>();
  final _organizationService = locator<OrganizationService>();
  final _channelsService = locator<ChannelsService>();
  final _localStorageService = locator<LocalStorageService>();


  String? _text;
  String? _hintText;
  String? _textFieldText;
  int userDataLength = 0;
  int availableListLength = 0;
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
  List<SearchObject> _searchList = [];
  List<SearchObject> get searchList => [..._searchList];
  List<DummyUser> _userNames = [];
  List<DummyUser> get userDatas => [..._userNames];
  String? selectedTerm;

  int _historyLength = 0;
  int get historyLenth => _historyLength;

  List _searchHistory = [];
  List get searchHistory => _searchHistory;
  List<Channel> channel = [];

  void saveSearch() {
    if (_searchHistory.length < 4) {
      _searchHistory.insert(0, searchQuery);
    } else {
      _searchHistory.removeAt(3);
      _searchHistory.insert(0, searchQuery);
    }

    _localStorageService.saveToDisk(
        savedSearchKey, json.encode(_searchHistory));
  }

  void fetchAndSetSearchHistory() async {
    final search = _localStorageService.getFromDisk(savedSearchKey);
    _searchHistory = json.decode(search.toString()) ?? ['No recent search'];
    _log.i(_searchHistory);
    _historyLength = _searchHistory.length > 4 ? 4 : _searchHistory.length;
    notifyListeners();
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
          _text = ButtonText4;
          _hintText = SearchModal;
        }
        break;
      case ButtonType.MESSAGE:
        {
          _text = ButtonText;
          _hintText = SearchModal1;
          availableListLength = userData.length;
        }
        break;
      case ButtonType.FILE:
        {
          _text = ButtonText2;
          _hintText = SearchModal2;
        }
        break;
      case ButtonType.PEOPLE:
        {
          _text = ButtonText3;
          _hintText = SearchModal3;
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

  void getSuggestionsForDM(String query) async {
    List<DM> dm = _organizationService.dm;
    for (var item in dm) {
      _searchList.add(SearchObject(
          id: item.otherUserProfile.userId,
          name: item.otherUserProfile.displayName,
          object: 'dm'));
    }
      var userList = List.of(_searchList).where((e) {
      final userLower = e.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return userLower.startsWith(queryLower);
    }).toList();

    availableListLength = userList.length;
    _searchList = userList;
    notifyListeners();
  }

  void onChange(String value) {
    textFieldActivated = true;
    searchQuery = value;
    switch (buttonType) {
      case ButtonType.CHANNELS:
        {
          getSuggestionsForChannels(value);
        }
        break;
      case ButtonType.MESSAGE:
        {
          getSuggestionsForDM(value);
        }
        break;
      case ButtonType.FILE:
        {
          //  getSuggestionsForFiles(value);
        }
        break;

      default:
    }
    notifyListeners();
  }

  void getSuggestionsForChannels(String query) async {
    channel = await _channelsService.getChannels(
        organizationId: _organizationService.getOrganizationId());
    for (int x = 0; x < channel.length; x++) {
      _searchList
          .add(SearchObject(id: x.toString(), name: channel[x].name, object: 'channel'));
    }
    var filteredList = List.of(_searchList).where((e) {
      final channelNameToLower = e.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return channelNameToLower.startsWith(queryLower);
    }).toList();

    availableListLength = filteredList.length;
    _searchList = filteredList;
    notifyListeners();
  }

  /* void getSuggestionsForFiles(String query) async {
    final response = await _filesService.fetchFileListUsingOrgId();
    _searchList.addAll(response.channelfiles);
    _searchList.addAll(response.threadfiles);
    var filteredList = List.of(_searchList).where((e) {
      final channelNameToLower = e.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return channelNameToLower.startsWith(queryLower);
    }).toList();

    availableListLength = filteredList.length;
    _searchList = filteredList;
    notifyListeners();
  }*/

  void goToChannelsView() {
    _navigationService.navigateTo(OrganizationViewRoutes.channelsView, id: 1);
  }

  void goToDmView() {
    _navigationService.navigateTo(OrganizationViewRoutes.allDmsView, id: 1);
  }

  void searchNavigate(dynamic data) {
    switch (buttonType) {
      case ButtonType.CHANNELS:
        {

          searchChannels(channel[int.parse(data.id)]);
        }
        break;
      case ButtonType.MESSAGE:
        {
          searchDms(data as Users);
        }
        break;

      default:
    }
  }

  void searchChannels(Channel channel) {
    _channelsService.setChannel(channel);
    _navigationService.navigateTo(OrganizationViewRoutes.channelsView);
  }

  void searchDms(Users user) {
    _dmService.setUser(user);
    _navigationService.navigateTo(OrganizationViewRoutes.dmView);
  }
}

class SearchObject {
  String id;
  String name;
  String object;

  SearchObject({required this.id, required this.name, required this.object});
}
