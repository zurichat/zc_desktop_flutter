import 'package:stacked/stacked.dart';
import 'message_media_preferenceview.dart';

class MessageMediaPreferenceViewModel extends BaseViewModel {
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
    notifyListeners();
  }

  void setNamePref(Object? value) {
    _namePref = (value) as PrefTheme;
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
    notifyListeners();
  }

  set setDiplayCurrentTyping(bool? val) {
    this._displayCurrentTyping = val;
    notifyListeners();
  }

  set setTimeWith(bool? val) {
    this._timeWith = val;
    notifyListeners();
  }

  set setDiplayColorSwatch(bool? val) {
    this._displayColorSwatches = val;
    notifyListeners();
  }

  //------
  bool? get imageFileUploadZuri => _imageFileUploadZuri;
  bool? get imageFileLinkedWebsite => _imageFileLinkedWebsite;
  bool? get evenLarger2Mb => _evenLarger2Mb;
  bool? get showTextpreview => _showTextpreview;

  set setimageFileUploadZuri(bool? val) {
    this._imageFileUploadZuri = val;
    notifyListeners();
  }

  set setimageFileLinkedWebsite(bool? val) {
    this._imageFileLinkedWebsite = val;
    notifyListeners();
  }

  set setevenLarger2Mb(bool? val) {
    this._evenLarger2Mb = val;
    notifyListeners();
  }

  set setshowTextpreview(bool? val) {
    this._showTextpreview = val;
    notifyListeners();
  }

  set setDisplayEmojiAsText(bool? val) {
    this._displayEmojiAsText = val;
    notifyListeners();
  }

  List<String> _longText = [
    'You can upload any important email to Slack by forwarding it to a unique email address. Slackbot will deliver the email and you can keep it private or share it with your team.',
    'Choose the default skin tone that will be used whenever you use certain emojis in reactions and messages.'
  ];
  List<String> get longText => _longText;
}
