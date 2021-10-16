import 'package:intl/locale.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/l10n/l10n.dart';

class ChangeRegionViewmodel extends BaseViewModel {
 Locale? _locale;
 Locale get locale => _locale!;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
