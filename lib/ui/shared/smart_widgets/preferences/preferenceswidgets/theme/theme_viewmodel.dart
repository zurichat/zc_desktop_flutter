import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';

const testLocalKey = 'TESTKEY';

class ThemeModel {
  final int index;
  final String title;

  ThemeModel({required this.index, required this.title});
}

enum themeAccross { directMessage }

enum toggleBtwTheme {
  LightTheme,
  DarkTheme,
}

enum darkDramaticTheme {
  coast,
  triadic,
  complimentary,
  automatic,
  nocturne,
  expensive,
  Null
}

enum cleanThemes { aubergine, versatile, aubergine1, aubergine2 }

class ThemeViewModel extends BaseViewModel {
  final log = getLogger('ThemeViewModel');

  final _themeService = locator<ThemeService>();
   final _localStorage = locator<LocalStorageService>();
  var _themes = Themes();

  themeAccross _allWorkSpace = themeAccross.directMessage;
  toggleBtwTheme _switchLightDark = toggleBtwTheme.LightTheme;
  darkDramaticTheme _darkDramaTheme = darkDramaticTheme.Null;
  cleanThemes _cleanTheme = cleanThemes.aubergine;

  String _logoLight = 'assets/images/logoo.png';
  String _logoDark = 'assets/images/logooDark.png';
  String _lightThmemImg = 'assets/images/LightThme2.png';
  String _lightThmemImg2 = 'assets/images/LightThme.png';
  String _coast = 'assets/images/Coast.png';
  String _triadic = 'assets/images/Triadic.png';
  String _complimentary = 'assets/images/complimentary.png';
  String _automatic = 'assets/images/automatic.png';
  String _nocturne = 'assets/images/Nocturne.png';
  String _expensive = 'assets/images/Expensive.png';
  String _aubergine2 = 'assets/images/Aubergine2.png';
  String _aubergine3 = 'assets/images/Aubergine3.png';
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
  Color _activeColor = Colors.green;
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

  bool _isChecked = false;

  String get lightTheme => _lightTheme;
  String get darkTheme => _darkTheme;
  String get logoLight => _logoLight;
  String get logoDark => _logoDark;
  String get lightThmemImg => _lightThmemImg;
  String get lightThmemImg2 => _lightThmemImg2;
  String get coast => _coast;
  String get triadic => _triadic;
  String get aubergine2 => _aubergine2;
  String get aubergine3 => _aubergine3;
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

  themeAccross get allWorkSpace => _allWorkSpace;
  toggleBtwTheme get switchLightDark => _switchLightDark;
  darkDramaticTheme get darkDramaTheme => _darkDramaTheme;
  cleanThemes get cleanTheme => _cleanTheme;

  String get head2 => _head2;
  String get head3 => _head3;
  String get head4 => _head4;
  String get body1 => _body1;
  String get body2 => _body2;
  String get body3 => _body3;
  DateTime get now => _now;
  bool get isChecked => _isChecked;
  Color activeColor() => _activeColor;

  void setChecked(bool? newValue) {
    _isChecked = newValue!;
    _themes = _themes.copyWith(isChecked: _isChecked);
    notifyListeners();
  }

  void setChecked2(themeAccross? newValue) {
    _allWorkSpace = newValue!;
      _themes = _themes.copyWith(allWorkSpace: _allWorkSpace);
    notifyListeners();
  }

  void switchBtwLightDark(Object? newValue) {
    _switchLightDark = (newValue) as toggleBtwTheme;
    _themes = _themes.copyWith(switchLightDark: _switchLightDark);
    switch (_switchLightDark) {
      case toggleBtwTheme.LightTheme:
        setTheme(themes[0]);
        notifyListeners();
        break;
      case toggleBtwTheme.DarkTheme:
        setTheme(themes[1]);
        notifyListeners();
        break;
    }
  }

  void switchCleanTheme(Object? value) {
    _cleanTheme = (value) as cleanThemes;
    _themes = _themes.copyWith(cleanTheme: _cleanTheme);
    switch (_cleanTheme) {
      case cleanThemes.aubergine:
        setTheme(themes[2]);
        notifyListeners();
        break;
      case cleanThemes.versatile:
        setTheme(themes[3]);
        break;
      case cleanThemes.aubergine1:
        setTheme(themes[4]);
        notifyListeners();
        break;
      case cleanThemes.aubergine2:
        setTheme(themes[5]);
        notifyListeners();
        break;
    }
  }

  void switchDramaticTheme(Object? value) {
    _darkDramaTheme = (value) as darkDramaticTheme;
     _themes = _themes.copyWith(darkDramaTheme: _darkDramaTheme);
    switch (_darkDramaTheme) {
      case darkDramaticTheme.coast:
        setTheme(themes[6]);
        notifyListeners();
        break;
      case darkDramaticTheme.triadic:
        setTheme(themes[7]);
        notifyListeners();
        break;
      case darkDramaticTheme.complimentary:
        setTheme(themes[8]);
        notifyListeners();
        break;
      case darkDramaticTheme.automatic:
        setTheme(themes[9]);
        notifyListeners();
        break;
      case darkDramaticTheme.nocturne:
        setTheme(themes[10]);
        notifyListeners();
        break;
      case darkDramaticTheme.expensive:
        setTheme(themes[11]);
        notifyListeners();
        break;
      case darkDramaticTheme.Null:
        break;
    }
  }

  String date() {
    String datee = now.hour.toString() + ':' + now.minute.toString();
    return datee;
  }

  List<ThemeModel> get themes => List<ThemeModel>.generate(
        12,
        (index) => ThemeModel(index: index, title: _getTitleForIndex(index)),
      );

  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'Light';
      case 1:
        return 'Dark';
      case 2:
        return 'aubergine';
      case 3:
        return 'versatile';
      case 4:
        return 'aubergine';
      case 5:
        return 'aubergine';
      case 6:
        return 'coast';
      case 7:
        return 'triadic';
      case 8:
        return 'complimentary';
      case 9:
        return 'automatic';
      case 10:
        return 'nocture';
      case 11:
        return 'expensive';
    }
    return 'No Theme for index';
  }

  void setTheme(ThemeModel themeData) =>
      _themeService.selectThemeAtIndex(themeData.index);

  void saveSettings() =>
      _localStorage.setThemes(_themes);

  void fetchAndSetSetting() async {
    _themes = await _localStorage.themes as Themes;
    _isChecked = _themes.isChecked;
    _allWorkSpace =  _themes.allWorkSpace;
    _switchLightDark = _themes.switchLightDark;
    _darkDramaTheme = _themes.darkDramaTheme;
    _cleanTheme = _themes.cleanTheme;

    notifyListeners();
  }
}
