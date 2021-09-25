import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';
import 'package:zc_desktop_flutter/services/channel_service/channels_api_service.dart';
import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';

class ChannelsCreationViewModel extends BaseViewModel with Validator {
  final _navigator = locator<NavigationService>();
  // var _currentPageIndex = 0;

  // get currentPageIndex => _currentPageIndex;

  // void updatePageIndex(int index) {
  //   _currentPageIndex = index;
  //   notifyListeners();
  // }

  final log = getLogger("CreateChannelViewModel");
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<LocalStorageService>();
  final _auth = locator<ChannelsService>();

  String _createChannel = 'Create a channel';
  String _channelTextOne =
      'Channels are where your team communicates. They’re best ';
  String _channelTextTwo =
      'when organized around a topic - #marketing, for example.';
  String _channelTextThree = 'Name';
  String _channelTextFour = 'Description ';
  String _channelTextFive = '(optional)';
  String _channelTextSix = 'Make this channel private';
  String _channelTextSeven = 'When a channel is set to private,';
  String _channelTextEight = 'it can be viewed or joined by invitation.';
  String _channelTextNine = 'Create';
  String _channelTextTen = 'Channel created, You will be redirected shortly';
  double _paddingTop = 10.0;
  double _paddingLeft = 15.0;
  double _paddingRight = 17.0;
  double _paddingBottom = 10.0;
  double _paddingBottom2 = 3.0;
  double _iconPadding = 8.0;
  double _iconSize = 22.0;
  bool _isSwitched = false;
  String _errorMessage = '';
  bool _showError = false;

  //TextController Error
  String? _channelNameError;
  String? _channelDescriptionError;

  bool _isBusy = false;
  bool _isPrivate = false;
  bool _isCreateChannelSuccessful = false;
  bool _isCreateChannelNotSuccessful = false;

  var _channelName = '';
  var _channelDescription = '';

  String get createChannel => _createChannel;
  String get channelTextOne => _channelTextOne;
  String get channelTextTwo => _channelTextTwo;
  String get channelTextThree => _channelTextThree;
  String get channelTextFour => _channelTextFour;
  String get channelTextFive => _channelTextFive;
  String get channelTextSix => _channelTextSix;
  String get channelTextSeven => _channelTextSeven;
  String get channelTextEight => _channelTextEight;
  String get channelTextNine => _channelTextNine;
  String get channelTextTen => _channelTextTen;
  double get paddingTop => _paddingTop;
  double get paddingLeft => _paddingLeft;
  double get paddingRight => _paddingRight;
  double get paddingBottom => _paddingBottom;
  double get paddingBottom2 => _paddingBottom2;
  double get iconPadding => _iconPadding;
  double get iconSize => _iconSize;
  bool get isSwitched => _isSwitched;
  String get errorMessage => _errorMessage;
  bool get showError => _showError;

  //TextController Error getters

  bool get isPrivate => _isPrivate;
  bool get isCreateChannelSuccessful => _isCreateChannelSuccessful;
  bool get isCreateChannelNotSuccessful => _isCreateChannelNotSuccessful;

  get channelNameError => _channelNameError;
  get channelDescriptionError => _channelDescriptionError;

  get channelName => _channelName;
  get channelDescription => _channelDescription;

  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }

  void setchannelName(String value) {
    _channelName = value;
    notifyListeners();
  }

  void setchannelDescription(String value) {
    _channelDescription = value;
    notifyListeners();
  }

  void goToViewChannels() {
    _navigationService.navigateTo(Routes.workspaceView);
    notifyListeners();
  }

  void _setIsBusy() {
    _isBusy = !_isBusy;
    notifyListeners();
  }

  void setIsSwitched(bool val) {
    _isSwitched = val;
    _isPrivate = val;
    notifyListeners();
  }

  void _setIsCreateChannelSuccessful() {
    _isCreateChannelSuccessful = !isCreateChannelSuccessful;
    notifyListeners();
  }

  void _setIsCreateChannelNotSuccessful() {
    _isCreateChannelNotSuccessful = !isCreateChannelNotSuccessful;
    notifyListeners();
  }

  void setErrorMessage(String msg) {
    _errorMessage = msg;
    notifyListeners();
  }

  void goToHome() {
    //_navigationService.navigateTo(Routes.homeView);
    notifyListeners();
  }

  Future<void> createchannels(
    String name,
    String owner,
    String description,
    bool private,
  ) async {
    bool isChannelNameValid = nameValidator(_channelName);
    bool isChannelDescriptionValid = nameValidator(_channelDescription);

    if (!isChannelNameValid ||
        !isChannelDescriptionValid) {
      if (!isChannelNameValid) {
        _channelNameError = 'Channel Name must be at least 3 characters long';
      } else {
        _channelNameError = null;
      }
      if (!isChannelDescriptionValid) {
        _channelDescriptionError = 'Channel Description must be at least 3 characters long';
      } else {
        _channelDescriptionError = null;
      }

      notifyListeners();
      return;
    }

      _setIsBusy();
      // if()
      await runBusyFuture(
          performCreateChannel(name, owner, description, private));

      if(_showError == false){
        setErrorMessage('An unexpected error occured!');
        _setIsBusy();
        _setIsCreateChannelNotSuccessful();
      } else {
        _setIsCreateChannelSuccessful();
      }
   
    notifyListeners();
  }

  Future<void> performCreateChannel(
      String name, String owner, String description, bool private) async {
    await _auth.createChannels(
        name, owner, description, private);
    _showError = true;
    await Future.delayed(
      Duration(milliseconds: 1500),
    );
   _navigationService.popRepeated(1);
    // _navigationService.navigateTo(Routes.checkEmailView, arguments: {
    //   'email': email,
    //   'isReset': false,
    // });
  }

  /// Error should be handled here. It could be displaying a toast of something else
  @override
  void onFutureError(error, Object? key) {
    print('Handle Error here');
    super.onFutureError(error, key);
  }

}
