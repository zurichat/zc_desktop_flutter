// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/login/login_view.dart';
import '../ui/views/signUp/signup_view.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/authInputTestView/authInputTestView.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String signUpView = '/signUp-view';
  static const String homeView = '/home-view';
  static const String loginView = '/login-view';
  static const String authInputTestView = '/auth-input-test-view';
  static const all = <String>{
    startUpView,
    signUpView,
    homeView,
    loginView,
    authInputTestView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.authInputTestView, page: AuthInputTestView),
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
    HomeView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignUpView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
  };
}
