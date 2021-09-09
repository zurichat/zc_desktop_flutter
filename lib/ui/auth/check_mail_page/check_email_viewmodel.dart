import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';

class CheckEmailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<LocalStorageService>();

  String _logoUrl = 'assets/images/zc_logo2.png';
  String _title = 'Check your email!';
  String _subTitle = 'To login_page password-free, tap the button in the email we sent to \ntoxicbishop01@gmail.com.';
  String _privacy = "Privacy & Terms";
  String _contactUs = "Contact us";
  String _changeRegion = "Change Region";
  String _wrongEmail = "Wrong email address?";
  String _reEnter = "Please re-enter email address";
  
  String get privacy => _privacy;
  String get wrongEmail => _wrongEmail;
  String get reEnter => _reEnter;
  String get contactUs => _contactUs;
  String get changeRegion => _changeRegion;
  String get logoUrl => _logoUrl;
  String get title => _title;
  String get subTitle => _subTitle;

}