import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/auth/reset_password_page/reset_password_view_model.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/auth_footer.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/auth_header.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/goto_login/goto_login_button.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (
        BuildContext context,
        ResetPasswordViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                      height: 40,
                      child: buildAppBar(context,
                          isHome: false, text: 'Reset Password | Zuri')),
                  Container(
                      width: 542.w,
                      child: AuthHeader(
                          title: model.title, subTitle: model.subTitle)),
                  verticalSpaceLarge,
                  Container(
                    width: 502.w,
                    child: AuthInputField(
                      label: 'Email',
                      onChanged: (value) {
                        model.setEmail(value);
                      },
                      errorText: model.errorText,
                      keyboardType: TextInputType.emailAddress,
                      hintPlaceHolder: 'someone@gmail.com',
                    ),
                  ),
                  verticalSpaceMedium,
                  Container(
                      width: 502.w,
                      height: 48.h,
                      child: AuthButton(
                        label: 'Get a reset link',
                        isBUsy: model.isBusy,
                        onTap: () async {
                          await model.verfiyAndGotoCheckEmail();
                        },
                      )),
                      SizedBox(
                  height: 32.h,
                ),
                GotoLoginButton(),
                ],
              ),
              AuthFooter()
            ],
          ),
        );
      },
    );
  }
}
