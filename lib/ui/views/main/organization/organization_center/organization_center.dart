import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';

class OrganizationCenter extends StatelessWidget {
  const OrganizationCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ExtendedNavigator(
        navigatorKey: StackedService.nestedNavigationKey(1),
        router: OrganizationViewRouter(),
      ),
    );
  }
}
