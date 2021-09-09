// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/auth/authInputTestView/authInputTestView.dart';
import '../ui/auth/check_mail/check_email_view.dart';
import '../ui/auth/forget_password/reset_password_view.dart';
import '../ui/auth/forgotPasswordPage/forgot_password_view.dart';
import '../ui/auth/login/login_view.dart';
import '../ui/auth/signUp/signup_view.dart';
import '../ui/main/home/home_view.dart';
import '../ui/startup/startup_view.dart';

class Routes {
  static const String homeView = '/home-view';
  static const String authInputTestView = '/auth-input-test-view';
  static const String loginView = '/';
  static const String startUpView = '/start-up-view';
  static const String signUpView = '/sign-up-view';
  static const String resetPasswordView = '/reset-password-view';
  static const String forgotPasswordPage = '/forgot-password-page';
  static const String checkEmailView = '/check-email-view';
  static const all = <String>{
    homeView,
    authInputTestView,
    loginView,
    startUpView,
    signUpView,
    resetPasswordView,
    forgotPasswordPage,
    checkEmailView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.authInputTestView, page: AuthInputTestView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.resetPasswordView, page: ResetPasswordView),
    RouteDef(Routes.forgotPasswordPage, page: ForgotPasswordPage),
    RouteDef(Routes.checkEmailView, page: CheckEmailView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    AuthInputTestView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AuthInputTestView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignUpView(),
        settings: data,
      );
    },
    ResetPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ResetPasswordView(),
        settings: data,
      );
    },
    ForgotPasswordPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ForgotPasswordPage(),
        settings: data,
      );
    },
    CheckEmailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CheckEmailView(),
        settings: data,
      );
    },
  };
}
