import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/views/auth/success/success_viewmodel.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SuccessViewModel>.nonReactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => SuccessViewModel(),
      builder: (BuildContext context, model, Widget? child) {
        return Scaffold(
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(SuccessCheckPath),
                  verticalSpaceMediumTwo,
                  Text(
                    'Email verification successful!',
                    style: headline3.copyWith(),
                  ),
                  verticalSpaceMedium,
                  Text(
                    'Click on the Button to continue',
                    style: bodyText1.copyWith(fontSize: 16.sp),
                  ),
                  verticalSpaceMediumTwo,
                  AuthButton(
                      label: 'Continue to Login',
                      onTap: model.navigateToLoginView),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
