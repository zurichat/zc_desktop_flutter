// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../services/auth_service.dart';
import '../services/centrifuge_service.dart';
import '../services/channels_service.dart';
import '../services/connectivity_service.dart';
import '../services/dm_service.dart';
import '../services/files_service.dart';
import '../services/local_storage_service.dart';
import '../services/organization_service.dart';
import '../services/startup_service.dart';
import '../services/user_service.dart';
import '../services/window_title_bar_service.dart';
import '../services/zuri_api/api.dart';
import '../services/zuri_api/fake_zuri_api_service.dart';

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
  locator.registerLazySingleton(() => DMService());
  locator.registerLazySingleton(() => OrganizationService());
  locator.registerLazySingleton(() => StartupService());
  locator.registerLazySingleton(() => CentrifugeService());
  locator.registerLazySingleton(() => ConnectivityService());
  locator.registerLazySingleton<Api>(() => FakeZuriApiService());
  locator.registerLazySingleton(() => FilesService());
  locator.registerLazySingleton(() => ThemeService.getInstance());
  locator.registerLazySingleton(() => WindowTitleBarService());
  locator.registerLazySingleton(() => UserService());
}
