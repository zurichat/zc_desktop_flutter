import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:zc_desktop_flutter/services/api/api_service.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/centrifuge_service.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
import 'package:zc_desktop_flutter/services/dm_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';
import 'package:zc_desktop_flutter/ui/views/auth/change_password/change_password_view.dart';
import 'package:zc_desktop_flutter/ui/views/auth/check_email/check_email_view.dart';
import 'package:zc_desktop_flutter/ui/views/auth/forgot_password/forgot_password_view.dart';
import 'package:zc_desktop_flutter/ui/views/auth/login/login_view.dart';
import 'package:zc_desktop_flutter/ui/views/auth/reset_password/reset_password_view.dart';
import 'package:zc_desktop_flutter/ui/views/auth/sign_up/sign_up_view.dart';
import 'package:zc_desktop_flutter/ui/views/auth/success/success_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels/channels_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_list/channels_list_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_channel/create_channel_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_organization/create_organization_name.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_organization/create_workspace.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_organization/create_workspace_stage2.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_organization/create_workspace_stage3.dart';
import 'package:zc_desktop_flutter/ui/views/main/dm/dm_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/organization/organization_view.dart';
import 'package:zc_desktop_flutter/ui/views/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: LoginView),
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
        MaterialRoute(page: ChannelsListView),
        MaterialRoute(page: CreateChannelView),
        MaterialRoute(page: DmView),
      ],
    ),
  ],
  dependencies: [
    Presolve(
      classType: LocalStorageService,
      presolveUsing: LocalStorageService.getInstance,
    ),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ChannelsService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: DMService),
    LazySingleton(classType: OrganizationService),
    LazySingleton(classType: CentrifugeService),
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
    LazySingleton(classType: WindowTitleBarService),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
