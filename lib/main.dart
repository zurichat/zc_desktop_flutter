import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/theme/themes.dart';

import 'app/app.router.dart';

Future main() async {
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
      themes: getThemes(),
      builder: (context, regularTheme, darkTheme, themeMode) => ScreenUtilInit(
          designSize: Size(1440, 940),
          builder: () {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Zuri Chat',
              theme: regularTheme,
              darkTheme: darkTheme,
              themeMode: themeMode,
              navigatorKey: StackedService.navigatorKey,
              onGenerateRoute: StackedRouter().onGenerateRoute,
            );
          }),
    );
  }
}
