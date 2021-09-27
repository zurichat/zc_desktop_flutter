import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:zc_desktop_flutter/services/api/api_service.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';
import 'package:zc_desktop_flutter/services/centrifuge_service.dart';
import 'package:zc_desktop_flutter/services/channel_service/channels_service.dart';
import 'package:zc_desktop_flutter/services/dm_service/dm_service.dart';
import 'package:zc_desktop_flutter/services/local_storage/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service/organization_service.dart';
import 'package:zc_desktop_flutter/ui/auth/change_password_page/change_password_view.dart';
import 'package:zc_desktop_flutter/ui/auth/check_email_page/check_email_view.dart';
import 'package:zc_desktop_flutter/ui/auth/forgot_password_page/forgot_password_view.dart';
import 'package:zc_desktop_flutter/ui/auth/login_page/login_view.dart';
import 'package:zc_desktop_flutter/ui/auth/login_page/splash_view.dart';
import 'package:zc_desktop_flutter/ui/auth/reset_password_page/reset_password_view.dart';
import 'package:zc_desktop_flutter/ui/auth/sign_up_page/sign_up_view.dart';
import 'package:zc_desktop_flutter/ui/auth/success_page/success_view.dart';
import 'package:zc_desktop_flutter/ui/create_workspace/create_workspace.dart';
import 'package:zc_desktop_flutter/ui/create_workspace/create_workspace_stage1.dart';
import 'package:zc_desktop_flutter/ui/create_workspace/create_workspace_stage2.dart';
import 'package:zc_desktop_flutter/ui/create_workspace/create_workspace_stage3.dart';
import 'package:zc_desktop_flutter/ui/main/channels_creation/channels_creation_view.dart';
import 'package:zc_desktop_flutter/ui/main/channels_display/channels_display_view.dart';
import 'package:zc_desktop_flutter/ui/main/channels_page/channels_view.dart';
import 'package:zc_desktop_flutter/ui/main/dm/dm_view.dart';
import 'package:zc_desktop_flutter/ui/main/organization_page/organization_view.dart';
import 'package:zc_desktop_flutter/ui/startup_page/startup_view.dart';

const USE_FAKE_API_IMPL = false;

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView, initial: true),
    MaterialRoute(page: SplashView),
    MaterialRoute(page: StartUpView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: CheckEmailView),
    MaterialRoute(page: ResetPasswordView),
    MaterialRoute(page: ChangePasswordView),
    MaterialRoute(page: SuccessView),
    MaterialRoute(page: CreateWorkspaceView),
    MaterialRoute(page: CreateWorkspaceStage1),
    MaterialRoute(page: CreateWorkspaceStage2),
    MaterialRoute(page: CreateWorkspaceStage3),
    MaterialRoute(
      page: OrganizationView,
      children: [
        MaterialRoute(page: ChannelsView, initial: true),
        MaterialRoute(page: ChannelsDisplayView),
        MaterialRoute(page: ChannelsCreationView),
        MaterialRoute(page: DmView),
      ],
    ),
  ],
  dependencies: [
    Presolve(
        classType: LocalStorageService,
        presolveUsing: LocalStorageService.getInstance),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ChannelsService),
    // USE_FAKE_API_IMPL
    //     ? LazySingleton(classType: FakeApiService, asType: FakeApi)
    //     : 
        LazySingleton(classType: ApiService),
    LazySingleton(classType: DMService),
    LazySingleton(classType: OrganizationService),
    LazySingleton(classType: CentrifugeService),
    LazySingleton(
        classType: ThemeService, resolveUsing: ThemeService.getInstance),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
