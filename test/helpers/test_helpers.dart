import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';
import 'package:zc_desktop_flutter/services/centrifuge_service.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
import 'package:zc_desktop_flutter/services/dm_service.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/recent_search_service.dart';
import 'package:zc_desktop_flutter/services/startup_service.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/zuri_api_service.dart';

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  // If we don't supply returnNullOnMissingStub then we'll get an exception when
  // a non-stubbed method is called.
  MockSpec<AuthService>(returnNullOnMissingStub: true),
  MockSpec<CentrifugeService>(returnNullOnMissingStub: true),
  MockSpec<NavigationService>(returnNullOnMissingStub: true),
  MockSpec<StartupService>(returnNullOnMissingStub: true),

  MockSpec<ZuriApiService>(returnNullOnMissingStub: true),
  MockSpec<ChannelsService>(returnNullOnMissingStub: true),
  MockSpec<DMService>(returnNullOnMissingStub: true),
  MockSpec<LocalStorageService>(returnNullOnMissingStub: true),
  MockSpec<OrganizationService>(returnNullOnMissingStub: true),
  MockSpec<RecentSearchService>(returnNullOnMissingStub: true),
  MockSpec<UserService>(returnNullOnMissingStub: true),
  MockSpec<WindowTitleBarService>(returnNullOnMissingStub: true),
])
StartupService getAndRegisterStartupService({
  bool hasLoggedInUser = false,
}) {
  _removeRegistrationIfExists<StartupService>();
  final service = MockStartupService();
  when(service.hasLoggedInUser).thenReturn(hasLoggedInUser);
  locator.registerSingleton<StartupService>(service);
  return service;
}

WindowTitleBarService getAndRegisterWindowTitleBarService() {
  _removeRegistrationIfExists<WindowTitleBarService>();
  final service = MockWindowTitleBarService();
  locator.registerSingleton<WindowTitleBarService>(service);
  return service;
}

UserService getAndRegisterUserService() {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  locator.registerSingleton<UserService>(service);
  return service;
}

RecentSearchService getAndRegisterRecentSearchService() {
  _removeRegistrationIfExists<RecentSearchService>();
  final service = MockRecentSearchService();
  locator.registerSingleton<RecentSearchService>(service);
  return service;
}

OrganizationService getAndRegisterOrganizationService() {
  _removeRegistrationIfExists<OrganizationService>();
  final service = MockOrganizationService();
  locator.registerSingleton<OrganizationService>(service);
  return service;
}

LocalStorageService getAndRegisterLocalStorageService() {
  _removeRegistrationIfExists<LocalStorageService>();
  final service = MockLocalStorageService();
  locator.registerSingleton<LocalStorageService>(service);
  return service;
}

DMService getAndRegisterDMService() {
  _removeRegistrationIfExists<DMService>();
  final service = MockDMService();
  locator.registerSingleton<DMService>(service);
  return service;
}

ChannelsService getAndRegisterChannelsService() {
  _removeRegistrationIfExists<ChannelsService>();
  final service = MockChannelsService();
  locator.registerSingleton<ChannelsService>(service);
  return service;
}

ZuriApiService getAndRegisterZuriApiService() {
  _removeRegistrationIfExists<ZuriApiService>();
  final service = MockZuriApiService();
  locator.registerSingleton<ZuriApiService>(service);
  return service;
}

AuthService getAndRegisterAuthService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

CentrifugeService getAndRegisterCentrifugeService() {
  _removeRegistrationIfExists<CentrifugeService>();
  final service = MockCentrifugeService();
  locator.registerSingleton<CentrifugeService>(service);
  return service;
}

NavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

void registerServices() {
  getAndRegisterAuthService();
  getAndRegisterCentrifugeService();
  getAndRegisterChannelsService();
  getAndRegisterDMService();
  getAndRegisterLocalStorageService();
  getAndRegisterNavigationService();
  getAndRegisterOrganizationService();
  getAndRegisterRecentSearchService();
  getAndRegisterStartupService();
  getAndRegisterUserService();
  getAndRegisterWindowTitleBarService();
  getAndRegisterZuriApiService();
  
}

void unregisterServices() {
  locator.unregister<AuthService>();
  locator.unregister<CentrifugeService>();
  locator.unregister<NavigationService>();
  locator.unregister<StartupService>();

  locator.unregister<ZuriApiService>();
  locator.unregister<ChannelsService>();
  locator.unregister<DMService>();
  locator.unregister<LocalStorageService>();
  locator.unregister<RecentSearchService>();
  locator.unregister<OrganizationService>();
  locator.unregister<UserService>();
  locator.unregister<WindowTitleBarService>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
