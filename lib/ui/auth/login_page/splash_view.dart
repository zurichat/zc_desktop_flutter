import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';

import 'login_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                buildAppBar(context, isHome: false, text: 'ZURI CHAT'),
                SizedBox(
                  height: 390.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/zc_logo.svg'),
                    verticalSpaceMedium,
                    Center(
                        child: CircularProgressIndicator(
                      color: Colors.grey,
                    )),
                  ],
                )
              ],
            ),
          ),
        );
      },
      onModelReady: (model) => model.checkLoginStatus(),
    );
  }
}
