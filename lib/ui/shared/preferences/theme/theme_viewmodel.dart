import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/ui/shared/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

const testLocalKey = 'TESTKEY';

class ThemeViewModel extends BaseViewModel {
  final log = getLogger("ThemeViewModel");
  final _themeService = locator<ThemeService>();

  void setupLocator() {
    locator.registerSingleton(ThemeService.getInstance());
  }

  String _logoLight = 'assets/images/logoo.png';
  String _logoDark = 'assets/images/logooDark.png';
  String _lightThmemImg = 'assets/images/LightThme.png';
  String _lightThmemImg2 = 'assets/images/LightThme2.png';
  String _coast = 'assets/images/Coast.png';
  String _triadic = 'assets/images/Triadic.png';
  String _complimentary = 'assets/images/complimentary.png';
  String _automatic = 'assets/images/automatic.png';
  String _nocturne = 'assets/images/Nocturne.png';
  String _expensive = 'assets/images/Expensive.png';
  double _logoWidth = 29.1;
  double _logoHeight = 30.77;
  String _title = 'Zuribot';
  String _head1 =
      'Change the appearance of Slack across all of your workspaces.';
  String _head2 = 'Colours';
  String _head3 = 'Clean and minimal';
  String _head4 = 'Dark and Dramatic';
  String _body1 = 'Sync with OS setting';
  String _body2 = 'Direct messages, mentions & network';
  String _body3 =
      'Automatically switch between light and dark themes when your system does.';
  Color _activeColor = Colors.blue;
  String _lightTheme = 'Light';
  String _darkTheme = 'Dark';
  String _aubergine = 'Aubergine';
  String _versatile = 'Versatile';
  String _coastName = 'Coast';
  String _triadicName = 'Triadic';
  String _complimetaryName = 'Complimentary';
  String _automaticName = 'Automatic';
  String _nocturneName = 'Nocturne';
  String _expensiveName = 'Expensive';
  DateTime _now = DateTime.now();

  bool _coastVal = false;
  bool _triVal = false;
  bool _compliVal = false;
  bool _autoVal = false;
  bool _nocVal = false;
  bool _expVal = false;
  bool _isChecked = false;
  bool _isChecked2 = true;
  bool _lightChecked = true;
  bool _versatileChecked = false;
  bool _darkChecked = false;
  bool _aubergineChecked = false;

  String get lightTheme => _lightTheme;
  String get darkTheme => _darkTheme;
  String get logoLight => _logoLight;
  String get logoDark => _logoDark;
  String get lightThmemImg => _lightThmemImg;
  String get lightThmemImg2 => _lightThmemImg2;
  String get coast => _coast;
  String get triadic => _triadic;
  String get complimentary => _complimentary;
  String get automatic => _automatic;
  String get nocturne => _nocturne;
  String get expensive => _expensive;
  String get title => _title;
  String get aubergine => _aubergine;
  String get versatile => _versatile;
  String get coastName => _coastName;
  String get triadicName => _triadicName;
  String get complimentaryName => _complimetaryName;
  String get automaticName => _automaticName;
  String get nocturneName => _nocturneName;
  String get expensiveName => _expensiveName;
  String get head1 => _head1;

  String get head2 => _head2;

  String get head3 => _head3;

  String get head4 => _head4;

  String get body1 => _body1;

  String get body2 => _body2;

  double get logoWidth => _logoWidth;

  double get logoHeight => _logoHeight;

  String get body3 => _body3;

  DateTime get now => _now;

  bool get isChecked => _isChecked;
  bool get isChecked2 => _isChecked2;
  bool get versatileChecked => _versatileChecked;
  bool get aubergineChecked => _aubergineChecked;
  bool get darkChecked => _darkChecked;
  bool get lighChecked => _lightChecked;
  bool get coastVal => _coastVal;
  bool get triVal => _triVal;
  bool get compliVal => _compliVal;
  bool get autoVal => _autoVal;
  bool get nocVal => _nocVal;
  bool get expVal => _expVal;

  Color activeColor() => _activeColor;

  void setChecked(bool? newValue) {
    _isChecked = newValue!;
    notifyListeners();
  }

  void setChecked2(bool? newValue) {
    _isChecked2 = newValue!;
    notifyListeners();
  }

  void coastChecked(bool? newValue) {
    setFalse();
    _triVal = false;
    _compliVal = false;
    _autoVal = false;
    _nocVal = false;
    _expVal = false;
    _coastVal = newValue!;
    notifyListeners();
  }

  void triaChecked(bool? newValue) {
    setFalse();
    _coastVal = false;
    _compliVal = false;
    _autoVal = false;
    _nocVal = false;
    _expVal = false;
    _triVal = newValue!;
    notifyListeners();
  }

  void compliChecked(bool? newValue) {
    setFalse();
    _coastVal = false;
    _triVal = false;
    _autoVal = false;
    _nocVal = false;
    _expVal = false;
    _compliVal = newValue!;
    notifyListeners();
  }

  void autoChecked(bool? newValue) {
    setFalse();
    _coastVal = false;
    _triVal = false;
    _compliVal = false;
    _nocVal = false;
    _expVal = false;
    _autoVal = newValue!;
    notifyListeners();
  }

  void nocChecked(bool? newValue) {
    setFalse();
    _coastVal = false;
    _triVal = false;
    _compliVal = false;
    _autoVal = false;
    _expVal = false;
    _nocVal = newValue!;
    notifyListeners();
  }

  void expChecked(bool? newValue) {
    setFalse();
    _coastVal = false;
    _triVal = false;
    _compliVal = false;
    _autoVal = false;
    _nocVal = false;
    _expVal = newValue!;
    notifyListeners();
  }

  void lightThemeChecked(bool? newValue) async {
    if (_lightChecked) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    _lightChecked = prefs.getBool('my_bool_key1') ?? true;
    _darkChecked = false;
    _versatileChecked = false;
    _aubergineChecked = false;
    _lightChecked = newValue!;
    prefs.setBool('my_bool_key1', _lightChecked);
    setTheme(themes[0]);
    notifyListeners();
  }

  String date() {
    String datee = now.hour.toString() + ":" + now.minute.toString();
    return datee;
  }

  void darkThemeChecked(bool? newValue) async {
    if (_darkChecked) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    _darkChecked = prefs.getBool('my_bool_key2') ?? false;
    _versatileChecked = false;
    _aubergineChecked = false;
    _lightChecked = false;
    _darkChecked = newValue!;
    prefs.setBool('my_bool_key2', _darkChecked);
    setTheme(themes[1]);
    notifyListeners();
  }

  void versatileThemeChecked(bool? newValue) async {
    if (_versatileChecked) {
      return;
    }
    _lightChecked = false;
    _darkChecked = false;
    _aubergineChecked = false;
    _versatileChecked = newValue!;
    setTheme(themes[3]);
    notifyListeners();
  }

  void aubergineThemeChecked(bool? newValue) async {
    if (_aubergineChecked) {
      return;
    }
    _lightChecked = false;
    _darkChecked = false;
    _versatileChecked = false;
    _aubergineChecked = newValue!;
    setTheme(themes[2]);
    notifyListeners();
  }

  void setFalse() {
    _lightChecked = false;
    _darkChecked = false;
    _versatileChecked = false;
    _aubergineChecked = false;
    notifyListeners();
  }

  List<ThemeModell> get themes => List<ThemeModell>.generate(
        4,
        (index) => ThemeModell(index: index, title: _getTitleForIndex(index)),
      );

  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return "Light";
      case 1:
        return "Dark";
      case 2:
        return "aubergine";
      case 3:
        return 'versatile';
    }
    return "No Theme for index";
  }

  void setTheme(ThemeModell themeData) =>
      _themeService.selectThemeAtIndex(themeData.index);
}
