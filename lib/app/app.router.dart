// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/auth/check_email_oage/check_email_view.dart';
import '../ui/auth/forgot_password_page/forgot_password_view.dart';
import '../ui/auth/login_page/login_view.dart';
import '../ui/auth/sign_up_page/sign_up_view.dart';
import '../ui/auth/success_page/success_view.dart';
import '../ui/main/home_page/home_view.dart';
import '../ui/startup_page/startup_view.dart';

class Routes {
  static const String homeView = '/home-view';
  static const String loginView = '/';
  static const String startUpView = '/start-up-view';
  static const String signUpView = '/sign-up-view';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String checkEmailView = '/check-email-view';
  static const String successView = '/success-view';
  static const all = <String>{
    homeView,
    loginView,
    startUpView,
    signUpView,
    forgotPasswordView,
    checkEmailView,
    successView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPasswordView),
    RouteDef(Routes.checkEmailView, page: CheckEmailView),
    RouteDef(Routes.successView, page: SuccessView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    StartUpView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const StartUpView(),
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
    SuccessView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const SuccessView(),
        settings: data,
      );
    },
  };
}
