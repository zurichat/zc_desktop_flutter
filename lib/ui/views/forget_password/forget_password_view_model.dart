// ignore_for_file: unused_field

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';

class ForgetPasswordViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<LocalStorageService>();

  String _logoUrl = 'assets/images/zc_logo2.png';
  String _title = 'Reset your password';
  String _subTitle = 'To reset your password, enter the email address you use to sign in to your workspace';
  String _email = '';
  String _emailHint = 'name@work-email.com';
  String _privacy = "Privacy & Terms";
  String _contactUs = "Contact us";
  String _changeRegion = "Change Region";
  



  String get privacy => _privacy;
  String get contactUs => _contactUs;
  String get changeRegion => _changeRegion;
  String get logoUrl => _logoUrl;
  String get title => _title;
  String get subTitle => _subTitle;
  String get emailHint => _emailHint;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }
}