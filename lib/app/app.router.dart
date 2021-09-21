// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/auth/change_password_page/change_password_view.dart';
import '../ui/views/auth/check_email_page/check_email_view.dart';
import '../ui/views/auth/forgot_password_page/forgot_password_view.dart';
import '../ui/views/auth/login_page/login_view.dart';
import '../ui/views/auth/reset_password_page/reset_password_view.dart';
import '../ui/views/auth/signUp/signup_view.dart';
import '../ui/views/auth/success_page/success_view.dart';
import '../ui/views/main/channels_page/channels_view.dart';
import '../ui/views/main/home_page/home_view.dart';
import '../ui/views/main/workspace_page/workspace_view.dart';
import '../ui/views/startup_page/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String loginView = '/login-view';
  static const String signUpView = '/sign-up-view';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String checkEmailView = '/check-email-view';
  static const String resetPasswordView = '/reset-password-view';
  static const String changePasswordView = '/change-password-view';
  static const String successView = '/success-view';
  static const String homeView = '/home-view';
  static const String workspaceView = '/workspace-view';
  static const String channelsView = '/channels-view';
  static const all = <String>{
    startUpView,
    loginView,
    signUpView,
    forgotPasswordView,
    checkEmailView,
    resetPasswordView,
    changePasswordView,
    successView,
    homeView,
    workspaceView,
    channelsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPasswordView),
    RouteDef(Routes.checkEmailView, page: CheckEmailView),
    RouteDef(Routes.resetPasswordView, page: ResetPasswordView),
    RouteDef(Routes.changePasswordView, page: ChangePasswordView),
    RouteDef(Routes.successView, page: SuccessView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.workspaceView, page: WorkspaceView),
    RouteDef(Routes.channelsView, page: ChannelsView),
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
    LoginView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const SignUpView(),
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
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const ResetPasswordView(),
        settings: data,
      );
    },
    ChangePasswordView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const ChangePasswordView(),
        settings: data,
      );
    },
    SuccessView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const SuccessView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    WorkspaceView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const WorkspaceView(),
        settings: data,
      );
    },
    ChannelsView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => ChannelsView(),
        settings: data,
      );
    },
  };
}
