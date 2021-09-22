import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/dummy_user_model/user_model.dart';

class DMService {
  final log = getLogger("DMService");
  User _user = User(name: "");

  void setUser(User user) {
    this._user = user;
  }

  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 2));
    log.i(_user.name);
    return _user;
  }
}
