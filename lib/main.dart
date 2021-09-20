import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/l10n/l10n.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'app/app.router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    ZcDesktop(),
  );
}

class ZcDesktop extends StatelessWidget {
  const ZcDesktop({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
        );
      },
    );
  }
}
