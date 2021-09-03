// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/login/login_view.dart';
import '../ui/views/authInputTestView/authInputTestView.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/signUp/signup_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String homeView = '/home-view';
  static const String authInputTestView = '/auth-input-test-view';
  static const String loginView = '/';
  static const String startUpView = '/start-up-view';
  static const String signUpView = '/sign-up-view';
  static const all = <String>{
    homeView,
    authInputTestView,
    loginView,
    startUpView,
    signUpView,
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
  };
}
