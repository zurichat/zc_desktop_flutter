import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

class GotoLoginButton extends StatelessWidget {
  final bool isHome;
  const GotoLoginButton({Key? key, this.isHome = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final _navigate = locator<NavigationService>();
        _navigate
            .navigateTo(!isHome ? Routes.loginView : Routes.organizationView);
      },
      child: Text(
        'Back to Login',
        style: headline6.copyWith(
          color: Color.fromRGBO(0, 184, 124, 1),
        ),
      ),
    );
  }
}

class ViewTodo extends StatelessWidget {
  final bool isHome;
  const ViewTodo({Key? key, this.isHome = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final _navigate = locator<NavigationService>();
        _navigate
            .navigateTo(!isHome ? Routes.loginView : Routes.organizationView);
      },
      child: Text(
        'View Task',
        style: headline6.copyWith(fontSize: 15,
          color: Color.fromRGBO(0, 184, 124, 1),
        ),
      ),
    );
  }
}



class CreateDateButton extends StatelessWidget {
  final bool isHome;
  const CreateDateButton({Key? key, this.isHome = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final _navigate = locator<NavigationService>();
        _navigate
            .navigateTo(!isHome ? Routes.loginView : Routes.organizationView);
      },
      child: ElevatedButton.icon(
        onPressed: () {
          // Respond to button press
        },
        icon: Icon(
          Icons.date_range,
          color: Colors.white,
          size: 20.0,
        ),
        label: Text('Sept 18, 2021'),
        style: ElevatedButton.styleFrom(
          primary: KStartupContainerColor,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}