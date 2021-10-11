import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'message_media_preferenceview.dart';

class MessageMediaPreferenceViewModel extends BaseViewModel {
  final _sharedPref = locator<LocalStorageService>();
  var _msgmediapref = MessagesAndMedia();
  PrefTheme _themePref = PrefTheme.Clean;
  PrefTheme _namePref = PrefTheme.JustDisplayNames;
  get themepref => _themePref;
  get namepref => _namePref;

  List<String> _messagespreferencetitles = [
    'Theme',
    'Here is an example',
    'Name',
    'Additional options',
    'Emoji',
    'Default skin Tone',
    'In-line media and links',
    'Bring emails into Zurichat',
  ];

  List<String> get allCcheckBoxText => _allCheckBoxText;

  List<String> get messagepreferencetitles => _messagespreferencetitles;

  List<String> _allCheckBoxText = [
    'Display information about who is currently typing a message',
    'Show times with 24-hour clock',
    'Display color swatches next to hexadecimal values',
    'Display emoji as plain text,',
    'Show JUMBOMOJI',
    'Show images and files uploaded to Zurichat',
    'Show images and files from linked websites',
    'Even if they’re larger than 2 MB',
    'Show text previews of linked websites',
  ];

  List<String> _emojiSkin = [
    'assets/images/raisedhandpink.svg',
    'assets/images/raisedhandblack.svg',
    'assets/images/raisedhandblack2.svg',
    'assets/images/raisedhandblack3.svg',
    'assets/images/raisedhandblack4.svg',
    'assets/images/raisedhandblack5.svg',
  ];
  List<String> get emojiSkin => _emojiSkin;

  int _selectedSkin = 0;
  int get selectedSkin => _selectedSkin;

  set setEmojiSkin(int index) {
    this._selectedSkin = index;
    notifyListeners();
  }

  void setThemePref(Object? value) {
    _themePref = (value) as PrefTheme;
    _msgmediapref = _msgmediapref.copyWith(theme: _themePref);
    notifyListeners();
  }

  void setNamePref(Object? value) {
    _namePref = (value) as PrefTheme;
    _msgmediapref = _msgmediapref.copyWith(name: _namePref);
    notifyListeners();
  }

  bool? _displayCurrentTyping = true;
  bool? _timeWith = false;
  bool? _displayColorSwatches = true;
  bool? _displayEmojiAsText = false;
  bool? _showJumbomji = true;
  bool? _imageFileUploadZuri = true;
  bool? _imageFileLinkedWebsite = true;
  bool? _evenLarger2Mb = false;
  bool? _showTextpreview = false;

  bool? get displaycolorSwatches => _displayColorSwatches;
  bool? get timeWith => _timeWith;
  bool? get displayCurrentTyping => _displayCurrentTyping;
  bool? get displayEmojiAsText => _displayEmojiAsText;
  bool? get showJumbomji => _showJumbomji;

  set setShowJumbomji(bool? val) {
    this._showJumbomji = val;
    _msgmediapref = _msgmediapref.copyWith(showJumbomoji: (_showJumbomji) as bool);
    notifyListeners();
  }

  set setDiplayCurrentTyping(bool? val) {
    this._displayCurrentTyping = val;
    _msgmediapref = _msgmediapref.copyWith(displayInfo: (val) as bool);
    notifyListeners();
  }

  set setTimeWith(bool? val) {
    this._timeWith = val;
    _msgmediapref = _msgmediapref.copyWith(showTime: (val) as bool);
    notifyListeners();
  }

  set setDiplayColorSwatch(bool? val) {
    this._displayColorSwatches = val;
    _msgmediapref = _msgmediapref.copyWith(disPlayColor: (val) as bool);
    notifyListeners();
  }

  //------
  bool? get imageFileUploadZuri => _imageFileUploadZuri;
  bool? get imageFileLinkedWebsite => _imageFileLinkedWebsite;
  bool? get evenLarger2Mb => _evenLarger2Mb;
  bool? get showTextpreview => _showTextpreview;

  set setimageFileUploadZuri(bool? val) {
    _msgmediapref = _msgmediapref.copyWith(showUploadPreview: (val) as bool);
    this._imageFileUploadZuri = val;
    notifyListeners();
  }

  set setimageFileLinkedWebsite(bool? val) {
    _msgmediapref = _msgmediapref.copyWith(showLinkPreview: (val) as bool);
    this._imageFileLinkedWebsite = val;
    notifyListeners();
  }

  set setevenLarger2Mb(bool? val) {
    this._evenLarger2Mb = val;
    _msgmediapref = _msgmediapref.copyWith(largerThan2: (val) as bool);
    notifyListeners();
  }

  set setshowTextpreview(bool? val) {
    this._showTextpreview = val;
    _msgmediapref = _msgmediapref.copyWith(displayInfo: (val) as bool);
    notifyListeners();
  }

  set setDisplayEmojiAsText(bool? val) {
    this._displayEmojiAsText = val;
    _msgmediapref = _msgmediapref.copyWith(displayEmojiAsPlain: (val) as bool);
    notifyListeners();
  }

  List<String> _longText = [
    'You can upload any important email to Slack by forwarding it to a unique email address. Slackbot will deliver the email and you can keep it private or share it with your team.',
    'Choose the default skin tone that will be used whenever you use certain emojis in reactions and messages.'
  ];
  List<String> get longText => _longText;

  void saveToDisk() {
    _sharedPref.setMessagesAndMedia(_msgmediapref);
  }

  void fetchAndSetMsgSetting() async {
    final _msgmediapref = await _sharedPref.messagesAndMedia as MessagesAndMedia;
    _themePref = _msgmediapref.theme;
    _namePref = _msgmediapref.name;
    _displayEmojiAsText = _msgmediapref.displayEmojiAsPlain;
    _showTextpreview = _msgmediapref.showLinkPreviewText;
    _imageFileUploadZuri = _msgmediapref.showUploadPreview;
    _imageFileLinkedWebsite = _msgmediapref.showLinkPreview;
    _timeWith = _msgmediapref.showTime;
    _showJumbomji = _msgmediapref.showJumbomoji;
    _displayColorSwatches = _msgmediapref.disPlayColor;
    _displayCurrentTyping = _msgmediapref.displayInfo;
    _showJumbomji = _msgmediapref.showJumbomoji;
    _evenLarger2Mb = _msgmediapref.largerThan2;
    
    notifyListeners();
    
  }
}