import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/services/api/api_service.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';
import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';
import 'package:zc_desktop_flutter/ui/auth/check_mail_page/check_email_view.dart';
import 'package:zc_desktop_flutter/ui/auth/forgot_password_page/forgot_password_view.dart';
import 'package:zc_desktop_flutter/ui/auth/login_page/login_view.dart';
import 'package:zc_desktop_flutter/ui/auth/reset_password_page/reset_password_view.dart';
import 'package:zc_desktop_flutter/ui/auth/sign_up_page/sign_up_view.dart';
import 'package:zc_desktop_flutter/ui/main/home_page/home_view.dart';
import 'package:zc_desktop_flutter/ui/startup_page/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: StartUpView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: CheckEmailView),
    MaterialRoute(page: ResetPasswordView),
  ],
  dependencies: [
    Presolve(
      classType: LocalStorageService,
      presolveUsing: LocalStorageService.getInstance,
    ),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ApiService),

  ],
  logger: StackedLogger(),
)
class AppSetup {}
