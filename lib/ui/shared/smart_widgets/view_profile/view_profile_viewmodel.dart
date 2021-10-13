import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class ViewProfileViewModel extends BaseViewModel{
  final _userService = locator<UserService>();
  User get user => _userService.auth.user!;

}