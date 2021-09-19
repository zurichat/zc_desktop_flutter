import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
<<<<<<< HEAD
import 'package:stacked_themes/stacked_themes.dart';
// import 'package:zc_desktop_flutter/app/app.locator.dart';
// import 'app/app.router.dart';
import 'ui/shared/preferences/preferenceswidgets/theme/themes.dart';

Future main() async {
  // setupLocator();
  await ThemeManager.initialise();
  runApp(const ZcDesktop());
=======
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'app/app.router.dart';

void main() {
  setupLocator();
  runApp(
    ZcDesktop(),
  );
>>>>>>> 68344c8ae41656ebbd1563e3fca88f9bd1f39256
}

class ZcDesktop extends StatelessWidget {
  const ZcDesktop({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    //For the theme
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
              // onGenerateRoute: StackedRouter().onGenerateRoute,
            );
          }),
=======
    return ScreenUtilInit(
      designSize: Size(1440, 1024),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Zuri Chat',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            scaffoldBackgroundColor: whiteColor,
          ),
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
        );
      },
>>>>>>> 68344c8ae41656ebbd1563e3fca88f9bd1f39256
    );
  }
}
