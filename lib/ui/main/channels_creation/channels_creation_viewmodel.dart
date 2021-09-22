import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';
import 'package:zc_desktop_flutter/ui/auth/login_page/login_viewmodel.dart';

class ChannelsCreationViewModel extends BaseViewModel with Validator{
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
  final _auth = locator<AuthService>();

  String _createChannel = 'Create a channel';
  String _channelTextOne = 'Channels are where your team communicates. They’re best ';
  String _channelTextTwo = 'when organized around a topic - #marketing, for example.';
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

  //TextController Error
  String? _channelNameError;
  String? _channelDescriptionError;

  bool _isBusy = false;
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

  //TextController Error getters

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
    _navigationService.navigateTo(Routes.homeView);
    notifyListeners();
  }

  Future<void> validateAndCreateChannel() async {
    bool isChannelNameValid = nameValidator(_channelName);
    // bool isChannelDescriptionValid = nameValidator(_channelDescription);

    // if (!isChannelNameValid ||
    //     !isChannelDescriptionValid)

    if (!isChannelNameValid) {
      if (!isChannelNameValid) {
        _channelNameError = 'Channel Name must be at least 3 characters long';
      } else {
        _channelNameError = null;
      }
      // if (!isChannelDescriptionValid) {
      //   _channelDescriptionError = 'Channel Description must be at least 3 characters long';
      // } else {
      //   _channelDescriptionError = null;
      // }

      notifyListeners();
      return;
    }
    try {
      _setIsBusy();
      await _auth.signup(
          email: _channelName,
          password: _channelName,);
      _setIsCreateChannelSuccessful();
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        setErrorMessage(
            'Please check your internet and try again!');
      } else {
        setErrorMessage('The Channel is Already In Use');
      }
      _setIsBusy();
      _setIsCreateChannelNotSuccessful();
      return;
    }
    await Future.delayed(
      Duration(milliseconds: 5000),
    );
    goToViewChannels();
    notifyListeners();
  }
}

 // void _goToHome() {
  //   if (emailText.isEmpty) {
  //     _navigationService.navigateTo(Routes.homeView);
  //     return;
  //   }
  //   _storageService.saveToDisk(testLocalKey, emailText);

  //   _navigationService.navigateTo(Routes.homeView);
  // }


  // Future<void> validateAndLogin() async {
  //   notifyListeners();
  //   // if (!(emailValidator(_email)) || _password.length <= 0) {
  //   //   if (!(emailValidator(_email))) {
  //   //     _emailErrorText = 'Invalid Email';
  //   //   } else {
  //   //     _emailErrorText = null;
  //   //   }
  //   //   if (_password.length <= 0) {
  //   //     _passwordErrorText = 'Password cannnot be empty';
  //   //   } else {
  //   //     _passwordErrorText = null;
  //   //   }
  //   //   notifyListeners();
  //   //   return;
  //   // }

  //   try {
  //     _setIsBusy();
  //     _emailErrorText = null;
  //     await _auth.loginWithCred(_email, _password);
  //   } catch (e) {
  //     if (e.toString().contains('SocketException')) {
  //       setErrorMessage(
  //           'Somthing went wrong!!! Please check your internet and try again');
  //     } else {
  //       setErrorMessage('Invalid Email OR Password');
  //     }
  //     _setIsError();
  //     _setIsBusy();
  //     return;
  //   }

  //   _goToHome();
  //   notifyListeners();
  // }

