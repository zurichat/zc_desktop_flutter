import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';

class CheckEmailViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _auth = locator<AuthService>();
  bool _isBusy = false;
  String _errorMsg = '';
  get isBusy => _isBusy;
  get errorMsg => _errorMsg;
  final _windowsTitleBarService = locator<WindowTitleBarService>();


  /// This method is called inside on model ready in the view which act just like init state
  /// The function is used to state the state of the title bar as well a the title of the 
  /// title bar. 
  void init() async {
    await Future.delayed(Duration(milliseconds: 1));
    _windowsTitleBarService.setHome(false);
    _windowsTitleBarService.setTitle('Zuri | Check Email');
  }

 /// This function set the busy state of the view. 
  void _setIsBusy() {
    _isBusy = !_isBusy;
    notifyListeners();
  }

  /// Performing email validation based on the otp suplied by the user.
  /// Using [isReset] to know which screen the otp is coming from so as know the screen to redirect user to.
  void performVarification(String otp, bool isReset) async {
    await Future.delayed(Duration(milliseconds: 10));
    if (otp.length == 6) {
      _setIsBusy();
      try {
        /// Performing task based on the [isReset] value
        if (!isReset) {
          await _auth.confirmEmail(otp);
        } else {
          await _auth.verifyPasswordResetCode(otp);
        }
        /// Performing navigation based on the [isReset] value
        _navigator.navigateTo(
            isReset ? Routes.changePasswordView : Routes.successView);
      } catch (e) {
        _errorMsg = 'Invalid ${isReset ? 'reset' : 'confirmation'} code';
        _setIsBusy();
        return;
      }
    }
    notifyListeners();
  }

  /// This function open gmail in the user browser. 
  void openGmail() async {
    if (await canLaunch(GmailUrlText)) {
      await launch(
        GmailUrlText,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not lauch the $GmailUrlText';
    }
  }
}
