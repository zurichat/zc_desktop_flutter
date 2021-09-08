// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';


import '../services/api/fake_api_service.dart';
import '../services/api/api_service.dart';
import '../services/api/api.dart';
import '../services/local_storage_service.dart';

final locator = StackedLocator.instance;

const bool USE_FAKE_IMPLEMENTATION = false;

Future setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  final localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton(localStorageService);

  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton<Api>(
      () => USE_FAKE_IMPLEMENTATION ? FakeAPiService() : ApiService());
}
