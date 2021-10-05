import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

class GotoLoginButton extends StatelessWidget {
  final bool isHome;
  const GotoLoginButton({Key? key, this.isHome = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
            final _navigate = locator<NavigationService>();
            _navigate.navigateTo(!isHome ? Routes.loginView : Routes.organizationView);
          },
          child: Text(
            isHome ? BackToWorkspaceText : BackToLoginText,
            style: subtitle2.copyWith(color: kcPrimaryColor,),
          ),
    );
  }
}
