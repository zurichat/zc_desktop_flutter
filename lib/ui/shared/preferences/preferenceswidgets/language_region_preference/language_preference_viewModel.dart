import 'package:stacked/stacked.dart';

class LanguagePreferenceViewModel extends BaseViewModel {
  String _selectedLanguage = 'Englis (US)';

  String get selectedLanguage => _selectedLanguage;

  List<String> _preferencetitles = [
    'Language',
    'Time Zone',
    'Keyboard Layout',
    'Spellcheck'
  ];

  String _dropDownLanguage = 'Englis (US)';
  String _dropDownTimeZone = 'UTC+01:00 West Central Africa';
  String _dropDownKeyboard = 'Englis (US)';

  String get dropDownLanguage => _dropDownLanguage;

  String get dropDownTimeZone => _dropDownTimeZone;

  String get dropDownKeyboard => _dropDownKeyboard;

  List<String> get preferencetitles => _preferencetitles;

  void setSelectedLanguage(String lang) {
    _selectedLanguage = lang;
    notifyListeners();
  }

  List<String> _timeZone = [
    'UTC+01:00 West Central Africa',
    'UTC-01:00 Cabo Verde Islands',
    '(UTC) Dublin, Edinburgh, Lisbon, London',
    '(UTC) Dublin, Edinburgh,',
    '(UTC+1:00) Asterdam, Berlin, Bern, Rome, Viena',
    '(UTC+1:00) Asterdam, Berlin, Bern, Rome, Berlin, Vienna'
  ];
  List<String> get timeZone => _timeZone;

  String _selectedTimeZone = 'UTC+01:00 West Central Africa';
  String get selectedTimeZone => _selectedTimeZone;

  void setSelectedTimeZone(String zone) {
    _selectedTimeZone = zone;
    notifyListeners();
  }

  List<String> _languages = [
    'Arabic (Modern Standard)',
    'Bulgarian',
    'cantonese',
    'Czech',
    'Danish',
    'Englis (US)',
    'Espanol (Espana)',
    'Francais (France)',
    'Italino',
  ];

  List<String> get languages => _languages;

  bool? _checkBox1 = false;
  bool? _checkBox2 = false;

  bool? get checkBox1 => _checkBox1;
  bool? get checkBox2 => _checkBox2;

  set setCheckbox1(bool? val) {
    this._checkBox1 = val;
    notifyListeners();
  }

  set setcheckBox2(bool? newValue) {
    this._checkBox2 = newValue;

    notifyListeners();
  }

  List<String> _checkBoxText = [
    'Set the time zone automatically',
    'Enable spellcheck on your messages'
  ];

  List get checkBoxText => _checkBoxText;

  List<String> _subHeadings = [
    'Choose the language you’d like to use with Slack',
    'Slack uses your time zone to send summary and notification emails, for times in your activity feeds, and your reminders',
  ];

  List get subHeadings => _subHeadings;
}
