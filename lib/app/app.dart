import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/ui/login/login_view.dart';
import 'package:zc_desktop_flutter/ui/views/authInputTestView/authInputTestView.dart';
import 'package:zc_desktop_flutter/ui/views/check_mail/check_email_view.dart';
import 'package:zc_desktop_flutter/ui/views/forget_password/reset_password_view.dart';
import 'package:zc_desktop_flutter/ui/views/forgotPasswordPage/forgot_password_view.dart';
import 'package:zc_desktop_flutter/ui/views/home/home_view.dart';
import 'package:zc_desktop_flutter/ui/views/signUp/signup_view.dart';
import 'package:zc_desktop_flutter/ui/views/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: AuthInputTestView),
    MaterialRoute(page: LoginView, initial: true),
    MaterialRoute(page: StartUpView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: ResetPasswordView),
    MaterialRoute(page: ForgotPasswordPage),
    MaterialRoute(page: CheckEmailView),
  ],
  dependencies: [
    Presolve(
      classType: LocalStorageService,
      presolveUsing: LocalStorageService.getInstance,
    ),
    LazySingleton(classType: NavigationService),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
