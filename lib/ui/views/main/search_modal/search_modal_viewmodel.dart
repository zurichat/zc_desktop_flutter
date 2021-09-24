import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/enums/button_type_enum.dart';
import 'package:zc_desktop_flutter/models/user_model.dart';
import 'package:zc_desktop_flutter/services/users_loacal_data.dart';

class SearchModalViewmodel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String? _text;
  String? _hintText;
  bool isClicked = false;
  bool swap = false;
  ButtonType buttonType = ButtonType.CHANNELS;
  late List<User> users;
  final userData = usersData;

  String searchQuery = '';

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

  List<User> getSuggestions(String query) => List.of(userData).where((user) {
        final userLower = user.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return userLower.contains(queryLower);
      }).toList();
}
