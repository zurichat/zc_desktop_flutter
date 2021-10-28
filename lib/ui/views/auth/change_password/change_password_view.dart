import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/goto_login_button.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/left_side_container.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

import 'change_password_view.form.dart';
import 'change_password_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'password'),
  FormTextField(name: 'confirmPassword')
])
class ChangePasswordView extends StatelessWidget with $ChangePasswordView {
  ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangePasswordViewModel>.reactive(
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.init();
      },
      viewModelBuilder: () => ChangePasswordViewModel(),
      builder: (
        BuildContext context,
        ChangePasswordViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Container(
            //height: (height - kToolbarHeight).h,
            child: Row(
              children: [
                LeftSideContainer(),
                Expanded(
                  flex: 2,
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 72.w),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          verticalSpaceMedium,
                          SvgPicture.asset(LogoUrl),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ChangePasswordTitleText,
                              style: headline3,
                            ),
                          ),
                          verticalSpaceMedium,
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 72.w),
                            child: Column(
                              children: [
                                ZuriDeskInputField(
                                  label: PasswordText,
                                  password: true,
                                  isVisible: model.isPasswordVisible,
                                  onVisibilityTap: model.setIsPasswordVisible,
                                  errorText: model.passwordMsg,
                                  controller: passwordController,
                                  hintPlaceHolder: PasswordText,
                                ),
                                verticalSpaceSmall,
                                ZuriDeskInputField(
                                  label: ConfirmPasswordText,
                                  password: true,
                                  isVisible: model.isPasswordVisible,
                                  onVisibilityTap: model.setIsPasswordVisible,
                                  errorText: model.confirmErrorMsg,
                                  controller: confirmPasswordController,
                                  hintPlaceHolder: ConfirmPasswordText,
                                ),
                                verticalSpaceRegular,
                                AuthButton(
                                  label: ContinueText,
                                  isBusy: model.isBusy,
                                  onTap: () async {
                                    await model.changePassword();
                                    if (model.isShowDialog) {
                                      showDialog(
                                          context: context,
                                          builder: (_) => BuildConfirmation());
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          verticalSpaceRegular,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(DontWishToChangePasswordText,
                                  style: headline7),
                              GotoLoginButton(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BuildConfirmation extends StatelessWidget {
  const BuildConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangePasswordViewModel>.nonReactive(
      builder: (context, model, child) => Dialog(
        child: Container(
          height: 634.h,
          width: 954.w,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(model.isError ? ErrorImage : SuccessImage),
                  Center(
                    child: SvgPicture.asset(model.isError ? XSvg : MarkSvg),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              ZcdeskText.headingTwo(
                model.isError ? ErrorTitle : SuccessTitle,
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                  width: 454.w,
                  alignment: Alignment.center,
                  child: ZcdeskText.headingThree(
                    model.isError ? ErrorSubtitle : SuccessSubtitle,
                  )),
              SizedBox(
                height: 32.h,
              ),
              AuthButton(
                  label: 'Continue to Login',
                  onTap: () {
                    Navigator.of(context).pop();
                    model.gotoLogin();
                  })
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ChangePasswordViewModel(),
    );
  }
}
