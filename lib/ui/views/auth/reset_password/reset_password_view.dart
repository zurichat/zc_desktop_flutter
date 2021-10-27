import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/auth_header.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/goto_login_button.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'package:zc_desktop_flutter/ui/views/auth/reset_password/reset_password_viewmodel.dart';

import 'reset_password_view.form.dart';

@FormView(fields: [FormTextField(name: 'email')])
class ResetPasswordView extends StatelessWidget with $ResetPasswordView {
  ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.init();
      },
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (
        BuildContext context,
        ResetPasswordViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                        width: 542.w,
                        child: AuthHeader(
                            title: ResetPasswordTitleText,
                            subTitle: ResetPasswordSubtitleText)),
                    verticalSpaceLarge,
                    Text(
                      model.errorMessage,
                      style: headline6.copyWith(
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                    verticalSpaceSmall,
                    Container(
                      width: 502.w,
                      child: ZuriDeskInputField(
                        label: 'Email',
                        controller: emailController,
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
                          isBusy: model.isBusy,
                          onTap: () async => await model
                              .verifyAndGotoCheckEmail(emailController.text),
                        )),
                    SizedBox(
                      height: 32.h,
                    ),
                    GotoLoginButton(),
                  ],
                ),
                // AuthFooter()
              ],
            ),
          ),
        );
      },
    );
  }
}
