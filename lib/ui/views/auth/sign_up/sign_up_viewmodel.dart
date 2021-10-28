import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';
import 'sign_up_view.form.dart';

class SignUpViewModel extends FormViewModel with Validator {
  final log = getLogger('SignUpViewModel');

  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _windowsTitleBarService = locator<WindowTitleBarService>();

  /// This variable keeps track of the password field visibility state. When set to true the 
  /// password text is obscured when set to false it isn't
  bool _passwordVisibility = true;
  bool get passwordVisibility => _passwordVisibility;

  /// This variable keeps track of the confirm password field visibility state. When set to true the 
  /// confirm password text is obscured when set to false it isn't
  bool _confirmPasswordVisibility = true;
  bool get confirmPasswordVisibility => _confirmPasswordVisibility;

  /// This variable keeps track of the policy checkbox state. It is set to false initially
  /// which means the check box is unchecked.
  bool _isPolicyChecked = false;
  bool get isPolicyChecked => _isPolicyChecked;


  /// This method is called inside on model ready in the view which act just like init state
  /// The function is used to state the state of the title bar as well a the title of the 
  /// title bar. 
  void init() async {
    await Future.delayed(Duration(milliseconds: 1));
    _windowsTitleBarService.setTitle('Zuri | SignUp');
  }

  /// This function update the state of [_passwordVissibility] when the relative action is
  /// triggered. Act more like the setter for the variable.
  void setPasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

   /// This function update the state of [_confrimPasswordVissibility] when the relative action is
  /// triggered. Act more like the setter for the variable
  void setConfirmPasswordVisibility() {
    _confirmPasswordVisibility = !_confirmPasswordVisibility;
    notifyListeners();
  }

  /// This function update the state of [_isPolichecked] when the relative action is
  /// triggered. Act more like the setter for the variable
  void onPolicyCheckChanged(bool? value) {
    _isPolicyChecked = value!;
    notifyListeners();
  }

  /// The function redirect the user back to the login screen.
  void goToLogin() {
    _navigationService.navigateTo(Routes.loginView);
    notifyListeners();
  }

  /// This function is called to perform the user signup and set the view state to busy
  /// while performing the task. This is accomplished by using the [runBusyFuture]
  Future<void> signUp() async {
    await runBusyFuture(performSignUp(emailValue!, passwordValue!, fullNameValue!));
  }

  /// This function validate all the field in  the signup screen and create the acount if
  /// all fields have been validated. Redirect the user to the login screen when user
  /// acout has been reated.
  Future<void> performSignUp(String email, String password, String fullName) async {
    if (!isPolicyChecked) {
      throw Failure('Please accept our policy before you continue');
    } else {
      this.clearErrors();
      notifyListeners();
    }
    try {
      String fName = '';
      String lName = '';
      if(fullName.contains(' ')) {
        final names = fullName.split(' ');
        fName = names[0];
        lName = names[1];
      } else {

      }
      await _authService.signup(email: email.trim(), password: password, fName: fName, lName: lName);
    } catch (e) {
      if(e.toString().contains('40')){
        throw Failure(EmailAlreadyInUseError);
      }
      throw Failure(AuthErrorMessage);
    }

    _navigationService.navigateTo(Routes.checkEmailView, arguments: {
      'email': email,
      'isReset': false,
    });
  }

  /// Error should be handled here. It could be displaying a toast of something else
  @override
  void onFutureError(error, Object? key) {
    log.i('Handle Error here');
    super.onFutureError(error, key);
  }

  /// This method is meant to  be override while using the FormViewModel but since there's
  /// absolutely no need for the function inside this view model so it remain an empty funcion
  @override
  void setFormStatus() {}
}
