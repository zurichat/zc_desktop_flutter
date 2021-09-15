import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/ui/shared/themes.dart';

import 'app/app.router.dart';

void main() async {
  setupLocator();
  await ThemeManager.initialise();
  runApp(const ZcDesktop());
}

class ZcDesktop extends StatelessWidget {
  const ZcDesktop({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
        defaultThemeMode: ThemeMode.system,
        themes: getThemes(),
        builder: (context, lightTheme, darkTheme, themeMode) => ScreenUtilInit(
            designSize: Size(1440, 940),
            builder: () {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Zuri Chat',
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: themeMode,
                navigatorKey: StackedService.navigatorKey,
                onGenerateRoute: StackedRouter().onGenerateRoute,
              );
            }));
  }
}
