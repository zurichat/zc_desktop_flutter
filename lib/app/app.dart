import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/centrifuge_service.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
import 'package:zc_desktop_flutter/services/connectivity_service.dart';
import 'package:zc_desktop_flutter/services/dm_service.dart';
import 'package:zc_desktop_flutter/services/files_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/startup_service.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/api.dart';
import 'package:zc_desktop_flutter/services/zuri_api/fake_zuri_api_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/zuri_api_service.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/channel_dm/channel_dm_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/profile/profile_view/profile_show_view.dart';
import 'package:zc_desktop_flutter/ui/views/auth/change_password/change_password_view.dart';
import 'package:zc_desktop_flutter/ui/views/auth/check_email/check_email_view.dart';
import 'package:zc_desktop_flutter/ui/views/auth/login/login_view.dart';
import 'package:zc_desktop_flutter/ui/views/auth/reset_password/reset_password_view.dart';
import 'package:zc_desktop_flutter/ui/views/auth/sign_up/sign_up_view.dart';
import 'package:zc_desktop_flutter/ui/views/auth/success/success_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels/channels_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_list/channels_list_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/choose_workspace.dart/choose_workspace_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_channel/create_channel_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_organization/create_organization_name.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_organization/create_workspace.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_organization/create_workspace_stage2.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_organization/create_workspace_stage3.dart';
import 'package:zc_desktop_flutter/ui/views/main/dm/all_dms/all_dms_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/dm/dm_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/organization/organization_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/people_user_group/peopel_user_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/saved_items/saved_items_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/Todo_view.dart';
import 'package:zc_desktop_flutter/ui/views/startup/startup_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/Threads/threads_view.dart';

/// Use this to switch to mock data or live data
const useFakeApiService = false;

@StackedApp(
  routes: [
    CustomRoute(page: StartUpView, initial: true),
    CustomRoute(page: ChooseWorkspaceView),
    CustomRoute(page: LoginView),
    CustomRoute(page: SignUpView),
    //CustomRoute(page: ForgotPasswordView),
    CustomRoute(page: CheckEmailView),
    CustomRoute(page: ResetPasswordView),
    CustomRoute(page: ChangePasswordView),
    CustomRoute(page: SuccessView),
    CustomRoute(page: CreateWorkspaceView),
    CustomRoute(page: CreateWorkspaceStage1),
    CustomRoute(page: CreateWorkspaceStage2),
    CustomRoute(page: CreateWorkspaceStage3),
    CustomRoute(page: SavedItemsView),
    CustomRoute(
      page: OrganizationView,
      children: [
        MaterialRoute(page: ChannelsView, initial: true),
        MaterialRoute(page: ChannelDmView),
        MaterialRoute(page: ChannelsListView),
        MaterialRoute(page: CreateChannelView),
        MaterialRoute(page: DmView),
        MaterialRoute(page: AllDmsView),
        MaterialRoute(page: SavedItemsView),
        MaterialRoute(
          page: PeopleUserGroupView,
        ),
        MaterialRoute(
          page: TodoView,
        ),
        MaterialRoute(page: ProfileShowView),
        MaterialRoute(page: ThreadsView),
      ],
    )
  ],
  dependencies: [
    Presolve(
      classType: LocalStorageService,
      presolveUsing: LocalStorageService.getInstance,
    ),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ChannelsService),
    LazySingleton(classType: DMService),
    LazySingleton(classType: OrganizationService),
    LazySingleton(classType: StartupService),
    LazySingleton(classType: UserService),
    Presolve(
      classType: CentrifugeService,
      presolveUsing: CentrifugeService.getInstance,
    ),
    LazySingleton(classType: ConnectivityService),
    LazySingleton(
        classType: useFakeApiService ? FakeZuriApiService : ZuriApiService,
        asType: Api),
    LazySingleton(classType: FilesService),
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
    LazySingleton(classType: WindowTitleBarService),
    
  ],
  logger: StackedLogger(),
)
class AppSetup {}
