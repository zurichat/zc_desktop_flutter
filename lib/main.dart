import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/l10n/l10n.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/theme/themes.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/window_title_bar/window_title_bar_view.dart';
import 'package:zc_desktop_flutter/window_setup.dart';

import 'app/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  await ThemeManager.initialise();

  runApp(ZcDesktop());

  await setUpWindow();
}

GlobalKey<NavigatorState> windowTitleNavigationKey =
    GlobalKey<NavigatorState>();

class ZcDesktop extends StatelessWidget {
  const ZcDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themes: getThemes(),
      builder: (context, regularTheme, darkTheme, themeMode) => ScreenUtilInit(
        designSize: Size(1440, 1024),
        builder: () {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Zuri Chat',
            builder: (context, child) => Navigator(
              key: windowTitleNavigationKey,
              onGenerateRoute: (settings) => MaterialPageRoute(
                settings: settings,
                builder: (context) => Material(
                  color: Colors.transparent,
                  child: WindowTitleBar(
                    body: child!,
                  ),
                ),
              ),
            ),
            theme: regularTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            navigatorKey: StackedService.navigatorKey,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            supportedLocales: L10n.all,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
          );
        },
      ),
    );
  }
}
