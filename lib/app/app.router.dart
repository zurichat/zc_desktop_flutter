// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/shared/smart_widgets/channel_dm/channel_dm_view.dart';
import '../ui/views/auth/change_password/change_password_view.dart';
import '../ui/views/auth/check_email/check_email_view.dart';
import '../ui/views/auth/forgot_password/forgot_password_view.dart';
import '../ui/views/auth/login/login_view.dart';
import '../ui/views/auth/reset_password/reset_password_view.dart';
import '../ui/views/auth/sign_up/sign_up_view.dart';
import '../ui/views/auth/success/success_view.dart';
import '../ui/views/main/channels/channels_view.dart';
import '../ui/views/main/channels_list/channels_list_view.dart';
import '../ui/views/main/choose_workspace.dart/choose_workspace_view.dart';
import '../ui/views/main/create_channel/create_channel_view.dart';
import '../ui/views/main/create_organization/create_organization_name.dart';
import '../ui/views/main/create_organization/create_workspace.dart';
import '../ui/views/main/create_organization/create_workspace_stage2.dart';
import '../ui/views/main/create_organization/create_workspace_stage3.dart';
import '../ui/views/main/dm/all_dms/all_dms_view.dart';
import '../ui/views/main/dm/dm_view.dart';
import '../ui/views/main/organization/organization_view.dart';
import '../ui/views/main/people_user_group/peopel_user_view.dart';
import '../ui/views/main/saved_items/saved_items_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String chooseWorkspaceView = '/choose-workspace-view';
  static const String loginView = '/login-view';
  static const String signUpView = '/sign-up-view';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String checkEmailView = '/check-email-view';
  static const String resetPasswordView = '/reset-password-view';
  static const String changePasswordView = '/change-password-view';
  static const String successView = '/success-view';
  static const String createWorkspaceView = '/create-workspace-view';
  static const String createWorkspaceStage1 = '/create-workspace-stage1';
  static const String createWorkspaceStage2 = '/create-workspace-stage2';
  static const String createWorkspaceStage3 = '/create-workspace-stage3';
  static const String organizationView = '/organization-view';
  static const all = <String>{
    startUpView,
    chooseWorkspaceView,
    loginView,
    signUpView,
    forgotPasswordView,
    checkEmailView,
    resetPasswordView,
    changePasswordView,
    successView,
    createWorkspaceView,
    createWorkspaceStage1,
    createWorkspaceStage2,
    createWorkspaceStage3,
    organizationView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.chooseWorkspaceView, page: ChooseWorkspaceView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPasswordView),
    RouteDef(Routes.checkEmailView, page: CheckEmailView),
    RouteDef(Routes.resetPasswordView, page: ResetPasswordView),
    RouteDef(Routes.changePasswordView, page: ChangePasswordView),
    RouteDef(Routes.successView, page: SuccessView),
    RouteDef(Routes.createWorkspaceView, page: CreateWorkspaceView),
    RouteDef(Routes.createWorkspaceStage1, page: CreateWorkspaceStage1),
    RouteDef(Routes.createWorkspaceStage2, page: CreateWorkspaceStage2),
    RouteDef(Routes.createWorkspaceStage3, page: CreateWorkspaceStage3),
    RouteDef(
      Routes.organizationView,
      page: OrganizationView,
      generator: OrganizationViewRouter(),
    ),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    ChooseWorkspaceView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const ChooseWorkspaceView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
    ForgotPasswordView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const ForgotPasswordView(),
        settings: data,
      );
    },
    CheckEmailView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const CheckEmailView(),
        settings: data,
      );
    },
    ResetPasswordView: (data) {
      var args = data.getArgs<ResetPasswordViewArguments>(
        orElse: () => ResetPasswordViewArguments(),
      );
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => ResetPasswordView(key: args.key),
        settings: data,
      );
    },
    ChangePasswordView: (data) {
      var args = data.getArgs<ChangePasswordViewArguments>(
        orElse: () => ChangePasswordViewArguments(),
      );
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => ChangePasswordView(key: args.key),
        settings: data,
      );
    },
    SuccessView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const SuccessView(),
        settings: data,
      );
    },
    CreateWorkspaceView: (data) {
      var args = data.getArgs<CreateWorkspaceViewArguments>(
        orElse: () => CreateWorkspaceViewArguments(),
      );
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => CreateWorkspaceView(key: args.key),
        settings: data,
      );
    },
    CreateWorkspaceStage1: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const CreateWorkspaceStage1(),
        settings: data,
      );
    },
    CreateWorkspaceStage2: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const CreateWorkspaceStage2(),
        settings: data,
      );
    },
    CreateWorkspaceStage3: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const CreateWorkspaceStage3(),
        settings: data,
      );
    },
    OrganizationView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const OrganizationView(),
        settings: data,
      );
    },
  };
}

class OrganizationViewRoutes {
  static const String channelsView = '/';
  static const String channelDmView = '/channel-dm-view';
  static const String channelsListView = '/channels-list-view';
  static const String createChannelView = '/create-channel-view';
  static const String dmView = '/dm-view';
  static const String allDmsView = '/all-dms-view';
  static const String savedItemsView = '/saved-items-view';
  static const String peopleUserGroupView = '/people-user-group-view';
  static const all = <String>{
    channelsView,
    channelDmView,
    channelsListView,
    createChannelView,
    dmView,
    allDmsView,
    savedItemsView,
    peopleUserGroupView,
  };
}

class OrganizationViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(OrganizationViewRoutes.channelsView, page: ChannelsView),
    RouteDef(OrganizationViewRoutes.channelDmView, page: ChannelDmView),
    RouteDef(OrganizationViewRoutes.channelsListView, page: ChannelsListView),
    RouteDef(OrganizationViewRoutes.createChannelView, page: CreateChannelView),
    RouteDef(OrganizationViewRoutes.dmView, page: DmView),
    RouteDef(OrganizationViewRoutes.allDmsView, page: AllDmsView),
    RouteDef(OrganizationViewRoutes.savedItemsView, page: SavedItemsView),
    RouteDef(OrganizationViewRoutes.peopleUserGroupView,
        page: PeopleUserGroupView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    ChannelsView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => ChannelsView(),
        settings: data,
      );
    },
    ChannelDmView: (data) {
      var args = data.getArgs<ChannelDmViewArguments>(
        orElse: () => ChannelDmViewArguments(),
      );
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => ChannelDmView(
          key: args.key,
          margin: args.margin,
          color: args.color,
          leading: args.leading,
          trailing: args.trailing,
          channel: args.channel,
          dm: args.dm,
        ),
        settings: data,
      );
    },
    ChannelsListView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const ChannelsListView(),
        settings: data,
      );
    },
    CreateChannelView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => CreateChannelView(),
        settings: data,
      );
    },
    DmView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const DmView(),
        settings: data,
      );
    },
    AllDmsView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const AllDmsView(),
        settings: data,
      );
    },
    SavedItemsView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const SavedItemsView(),
        settings: data,
      );
    },
    PeopleUserGroupView: (data) {
      var args = data.getArgs<PeopleUserGroupViewArguments>(
        orElse: () => PeopleUserGroupViewArguments(),
      );
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => PeopleUserGroupView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ResetPasswordView arguments holder class
class ResetPasswordViewArguments {
  final Key? key;
  ResetPasswordViewArguments({this.key});
}

/// ChangePasswordView arguments holder class
class ChangePasswordViewArguments {
  final Key? key;
  ChangePasswordViewArguments({this.key});
}

/// CreateWorkspaceView arguments holder class
class CreateWorkspaceViewArguments {
  final Key? key;
  CreateWorkspaceViewArguments({this.key});
}

/// ChannelDmView arguments holder class
class ChannelDmViewArguments {
  final Key? key;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Widget leading;
  final Widget trailing;
  final bool? channel;
  final bool? dm;
  ChannelDmViewArguments(
      {this.key,
      this.margin,
      this.color,
      this.leading = const SizedBox(),
      this.trailing = const SizedBox(),
      this.channel,
      this.dm});
}

/// PeopleUserGroupView arguments holder class
class PeopleUserGroupViewArguments {
  final Key? key;
  PeopleUserGroupViewArguments({this.key});
}
