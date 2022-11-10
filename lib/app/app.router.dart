// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i16;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i26;
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/profile/profile_view/profile_show_view.dart'
    as _i24;
import 'package:zc_desktop_flutter/ui/views/auth/change_password/change_password_view.dart'
    as _i8;
import 'package:zc_desktop_flutter/ui/views/auth/check_email/check_email_view.dart'
    as _i6;
import 'package:zc_desktop_flutter/ui/views/auth/login/login_view.dart' as _i4;
import 'package:zc_desktop_flutter/ui/views/auth/reset_password/reset_password_view.dart'
    as _i7;
import 'package:zc_desktop_flutter/ui/views/auth/sign_up/sign_up_view.dart'
    as _i5;
import 'package:zc_desktop_flutter/ui/views/auth/success/success_view.dart'
    as _i9;
import 'package:zc_desktop_flutter/ui/views/main/channels/channels_view.dart'
    as _i17;
import 'package:zc_desktop_flutter/ui/views/main/channels_list/channels_list_view.dart'
    as _i18;
import 'package:zc_desktop_flutter/ui/views/main/choose_workspace.dart/choose_workspace_view.dart'
    as _i3;
import 'package:zc_desktop_flutter/ui/views/main/create_channel/create_channel_view.dart'
    as _i19;
import 'package:zc_desktop_flutter/ui/views/main/create_organization/create_organization_name.dart'
    as _i11;
import 'package:zc_desktop_flutter/ui/views/main/create_organization/create_workspace.dart'
    as _i10;
import 'package:zc_desktop_flutter/ui/views/main/create_organization/create_workspace_stage2.dart'
    as _i12;
import 'package:zc_desktop_flutter/ui/views/main/create_organization/create_workspace_stage3.dart'
    as _i13;
import 'package:zc_desktop_flutter/ui/views/main/dm/all_dms/all_dms_view.dart'
    as _i21;
import 'package:zc_desktop_flutter/ui/views/main/dm/dm_view.dart' as _i20;
import 'package:zc_desktop_flutter/ui/views/main/organization/organization_view.dart'
    as _i15;
import 'package:zc_desktop_flutter/ui/views/main/people_user_group/peopel_user_view.dart'
    as _i22;
import 'package:zc_desktop_flutter/ui/views/main/saved_items/saved_items_view.dart'
    as _i14;
import 'package:zc_desktop_flutter/ui/views/main/Threads/threads_view.dart'
    as _i25;
import 'package:zc_desktop_flutter/ui/views/main/todo/Todo_view.dart' as _i23;
import 'package:zc_desktop_flutter/ui/views/startup/startup_view.dart' as _i2;

class Routes {
  static const startUpView = '/';

  static const chooseWorkspaceView = '/choose-workspace-view';

  static const loginView = '/login-view';

  static const signUpView = '/sign-up-view';

  static const checkEmailView = '/check-email-view';

  static const resetPasswordView = '/reset-password-view';

  static const changePasswordView = '/change-password-view';

  static const successView = '/success-view';

  static const createWorkspaceView = '/create-workspace-view';

  static const createWorkspaceStage1 = '/create-workspace-stage1';

  static const createWorkspaceStage2 = '/create-workspace-stage2';

  static const createWorkspaceStage3 = '/create-workspace-stage3';

  static const savedItemsView = '/saved-items-view';

  static const organizationView = '/organization-view';

  static const all = <String>{
    startUpView,
    chooseWorkspaceView,
    loginView,
    signUpView,
    checkEmailView,
    resetPasswordView,
    changePasswordView,
    successView,
    createWorkspaceView,
    createWorkspaceStage1,
    createWorkspaceStage2,
    createWorkspaceStage3,
    savedItemsView,
    organizationView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startUpView,
      page: _i2.StartUpView,
    ),
    _i1.RouteDef(
      Routes.chooseWorkspaceView,
      page: _i3.ChooseWorkspaceView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i5.SignUpView,
    ),
    _i1.RouteDef(
      Routes.checkEmailView,
      page: _i6.CheckEmailView,
    ),
    _i1.RouteDef(
      Routes.resetPasswordView,
      page: _i7.ResetPasswordView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i8.ChangePasswordView,
    ),
    _i1.RouteDef(
      Routes.successView,
      page: _i9.SuccessView,
    ),
    _i1.RouteDef(
      Routes.createWorkspaceView,
      page: _i10.CreateWorkspaceView,
    ),
    _i1.RouteDef(
      Routes.createWorkspaceStage1,
      page: _i11.CreateWorkspaceStage1,
    ),
    _i1.RouteDef(
      Routes.createWorkspaceStage2,
      page: _i12.CreateWorkspaceStage2,
    ),
    _i1.RouteDef(
      Routes.createWorkspaceStage3,
      page: _i13.CreateWorkspaceStage3,
    ),
    _i1.RouteDef(
      Routes.savedItemsView,
      page: _i14.SavedItemsView,
    ),
    _i1.RouteDef(
      Routes.organizationView,
      page: _i15.OrganizationView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartUpView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i2.StartUpView(),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i3.ChooseWorkspaceView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i3.ChooseWorkspaceView(),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i4.LoginView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i4.LoginView(),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i5.SignUpView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i5.SignUpView(),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i6.CheckEmailView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i6.CheckEmailView(),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i7.ResetPasswordView: (data) {
      final args = data.getArgs<ResetPasswordViewArguments>(
        orElse: () => const ResetPasswordViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i7.ResetPasswordView(key: args.key),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i8.ChangePasswordView: (data) {
      final args = data.getArgs<ChangePasswordViewArguments>(
        orElse: () => const ChangePasswordViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i8.ChangePasswordView(key: args.key),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i9.SuccessView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i9.SuccessView(),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i10.CreateWorkspaceView: (data) {
      final args = data.getArgs<CreateWorkspaceViewArguments>(
        orElse: () => const CreateWorkspaceViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i10.CreateWorkspaceView(key: args.key),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i11.CreateWorkspaceStage1: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i11.CreateWorkspaceStage1(),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i12.CreateWorkspaceStage2: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i12.CreateWorkspaceStage2(),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i13.CreateWorkspaceStage3: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i13.CreateWorkspaceStage3(),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i14.SavedItemsView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i14.SavedItemsView(),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i15.OrganizationView: (data) {
      final args = data.getArgs<OrganizationViewArguments>(
        orElse: () => const OrganizationViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i15.OrganizationView(key: args.key),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ResetPasswordViewArguments {
  const ResetPasswordViewArguments({this.key});

  final _i16.Key? key;
}

class ChangePasswordViewArguments {
  const ChangePasswordViewArguments({this.key});

  final _i16.Key? key;
}

class CreateWorkspaceViewArguments {
  const CreateWorkspaceViewArguments({this.key});

  final _i16.Key? key;
}

class OrganizationViewArguments {
  const OrganizationViewArguments({this.key});

  final _i16.Key? key;
}

class OrganizationViewRoutes {
  static const channelsView = '/';

  static const channelsListView = '/channels-list-view';

  static const createChannelView = '/create-channel-view';

  static const dmView = '/dm-view';

  static const allDmsView = '/all-dms-view';

  static const savedItemsView = '/saved-items-view';

  static const peopleUserGroupView = '/people-user-group-view';

  static const todoView = '/todo-view';

  static const profileShowView = '/profile-show-view';

  static const threadsView = '/threads-view';

  static const all = <String>{
    channelsView,
    channelsListView,
    createChannelView,
    dmView,
    allDmsView,
    savedItemsView,
    peopleUserGroupView,
    todoView,
    profileShowView,
    threadsView,
  };
}

class OrganizationViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      OrganizationViewRoutes.channelsView,
      page: _i17.ChannelsView,
    ),
    _i1.RouteDef(
      OrganizationViewRoutes.channelsListView,
      page: _i18.ChannelsListView,
    ),
    _i1.RouteDef(
      OrganizationViewRoutes.createChannelView,
      page: _i19.CreateChannelView,
    ),
    _i1.RouteDef(
      OrganizationViewRoutes.dmView,
      page: _i20.DmView,
    ),
    _i1.RouteDef(
      OrganizationViewRoutes.allDmsView,
      page: _i21.AllDmsView,
    ),
    _i1.RouteDef(
      OrganizationViewRoutes.savedItemsView,
      page: _i14.SavedItemsView,
    ),
    _i1.RouteDef(
      OrganizationViewRoutes.peopleUserGroupView,
      page: _i22.PeopleUserGroupView,
    ),
    _i1.RouteDef(
      OrganizationViewRoutes.todoView,
      page: _i23.TodoView,
    ),
    _i1.RouteDef(
      OrganizationViewRoutes.profileShowView,
      page: _i24.ProfileShowView,
    ),
    _i1.RouteDef(
      OrganizationViewRoutes.threadsView,
      page: _i25.ThreadsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i17.ChannelsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i17.ChannelsView(),
        settings: data,
      );
    },
    _i18.ChannelsListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.ChannelsListView(),
        settings: data,
      );
    },
    _i19.CreateChannelView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i19.CreateChannelView(),
        settings: data,
      );
    },
    _i20.DmView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.DmView(),
        settings: data,
      );
    },
    _i21.AllDmsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.AllDmsView(),
        settings: data,
      );
    },
    _i14.SavedItemsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.SavedItemsView(),
        settings: data,
      );
    },
    _i22.PeopleUserGroupView: (data) {
      final args = data.getArgs<NestedPeopleUserGroupViewArguments>(
        orElse: () => const NestedPeopleUserGroupViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i22.PeopleUserGroupView(key: args.key),
        settings: data,
      );
    },
    _i23.TodoView: (data) {
      final args = data.getArgs<NestedTodoViewArguments>(
        orElse: () => const NestedTodoViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i23.TodoView(key: args.key),
        settings: data,
      );
    },
    _i24.ProfileShowView: (data) {
      final args = data.getArgs<NestedProfileShowViewArguments>(
        orElse: () => const NestedProfileShowViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i24.ProfileShowView(key: args.key),
        settings: data,
      );
    },
    _i25.ThreadsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.ThreadsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class NestedPeopleUserGroupViewArguments {
  const NestedPeopleUserGroupViewArguments({this.key});

  final _i16.Key? key;
}

class NestedTodoViewArguments {
  const NestedTodoViewArguments({this.key});

  final _i16.Key? key;
}

class NestedProfileShowViewArguments {
  const NestedProfileShowViewArguments({this.key});

  final _i16.Key? key;
}

extension NavigatorStateExtension on _i26.NavigationService {
  Future<dynamic> navigateToStartUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChooseWorkspaceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chooseWorkspaceView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCheckEmailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.checkEmailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResetPasswordView({
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.resetPasswordView,
        arguments: ResetPasswordViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePasswordView({
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.changePasswordView,
        arguments: ChangePasswordViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.successView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateWorkspaceView({
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createWorkspaceView,
        arguments: CreateWorkspaceViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateWorkspaceStage1([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createWorkspaceStage1,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateWorkspaceStage2([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createWorkspaceStage2,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateWorkspaceStage3([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createWorkspaceStage3,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSavedItemsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.savedItemsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrganizationView({
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.organizationView,
        arguments: OrganizationViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedChannelsViewInOrganizationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(OrganizationViewRoutes.channelsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedChannelsListViewInOrganizationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(OrganizationViewRoutes.channelsListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedCreateChannelViewInOrganizationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(OrganizationViewRoutes.createChannelView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedDmViewInOrganizationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(OrganizationViewRoutes.dmView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedAllDmsViewInOrganizationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(OrganizationViewRoutes.allDmsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedSavedItemsViewInOrganizationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(OrganizationViewRoutes.savedItemsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedPeopleUserGroupViewInOrganizationView({
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(OrganizationViewRoutes.peopleUserGroupView,
        arguments: NestedPeopleUserGroupViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedTodoViewInOrganizationView({
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(OrganizationViewRoutes.todoView,
        arguments: NestedTodoViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedProfileShowViewInOrganizationView({
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(OrganizationViewRoutes.profileShowView,
        arguments: NestedProfileShowViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedThreadsViewInOrganizationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(OrganizationViewRoutes.threadsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
