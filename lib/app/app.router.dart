// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
<<<<<<< HEAD
import '../ui/views/signUp/signup_view.dart';
import 'package:stacked/stacked_annotations.dart';
=======

import '../ui/views/signUp/signup_view.dart';
import 'package:zc_desktop_flutter/ui/login/login_view.dart';

>>>>>>> b3ce203934cbf5e49f588802419b3108b802b9d2

import '../ui/views/authInputTestView/authInputTestView.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String signUpView = '/signUp-view';
  static const String homeView = '/home-view';
  static const String authInputTestView = '/auth-input-test-view';
  static const all = <String>{
    startUpView,
    signUpView,
    homeView,
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
<<<<<<< HEAD
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignUpView(),
=======

    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignUpView(),


    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),

    AuthInputTestView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AuthInputTestView(),

>>>>>>> b3ce203934cbf5e49f588802419b3108b802b9d2
        settings: data,
      );
    },
  };
}
