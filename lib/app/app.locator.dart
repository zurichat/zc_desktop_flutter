// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:zc_desktop_flutter/services/centrifuge_service.dart';

import '../services/api/api_service.dart';
import '../services/authentication/auth_service.dart';
import '../services/channel_service/channels_service.dart';
import '../services/dm_service/dm_service.dart';
import '../services/local_storage/local_storage_service.dart';
import '../services/organization_service/organization_service.dart';

final locator = StackedLocator.instance;

Future setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  final localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton(localStorageService);

  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => ChannelsService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => DMService());
  locator.registerLazySingleton(() => OrganizationService());
  locator.registerLazySingleton(() => CentrifugeService());
  locator.registerLazySingleton(() => ThemeService.getInstance());
}
