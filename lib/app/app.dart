import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/ui/views/home/home_view.dart';
import 'package:zc_desktop_flutter/ui/views/startup/startup_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUpView, initial: true),
  MaterialRoute(page: HomeView),
], dependencies: [
  LazySingleton(classType: NavigationService),
])
class AppSetup {}
