import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class ProfileShowViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();

  String? _name = 'tobi';

  get name => _name;

  String? _description = 'Beginner Flutter Mobile Dev || UI/UX Designer';
  get description => _description;

  String? _title = 'Him/He';
  get title => _title;

  String _email = 'tobi@gmail.com';
  get email => _email;

  String _phoneNumeber = '+234 601 788 9991';
  get phoneNumber => _phoneNumeber;

  String _profilePic = 'assets/images/profile_placeholder.png';
  get profilePic => _profilePic;

  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }
}
