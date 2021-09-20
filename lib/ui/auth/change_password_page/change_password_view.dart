import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/build_left_startup_image.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/goto_login_button.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

import 'change_password_view_model.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<ChangePasswordViewModel>.reactive(
      viewModelBuilder: () => ChangePasswordViewModel(),
      builder: (
        BuildContext context,
        ChangePasswordViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                  height: 40,
                  child: buildAppBar(context,
                      isHome: false, text: 'Change Password | Zuri')),
              Container(
                height: height - 40,
                child: Row(
                  children: [
                    BuildStartUpImage(),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 72.w),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              verticalSpaceMedium,
                              SvgPicture.asset(model.logoUrl),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Reset Password',
                                  style: headline3,
                                ),
                              ),
                              verticalSpaceMedium,
                              Column(
                                children: [
                                  AuthInputField(
                                    label: 'Password',
                                    password: true,
                                    isVisible: model.isPasswordVisible,
                                    onVisibilityTap: model.setIsPasswordVisible,
                                    errorText: model.passwordMsg,
                                    onChanged: (value) {
                                      model.setPassword(value);
                                    },
                                    hintPlaceHolder: 'Password',
                                  ),
                                  verticalSpaceSmall,
                                  AuthInputField(
                                    label: 'Confirm Password',
                                    password: true,
                                    isVisible: model.isPasswordVisible,
                                    onVisibilityTap: model.setIsPasswordVisible,
                                    errorText: model.confirmErrorMsg,
                                    onChanged: (value) {
                                      model.setConfirmPassword(value);
                                    },
                                    hintPlaceHolder: 'Confirm Password',
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.0.h),
                              Text(
                                model.errorMessage,
                                style: headline6.copyWith(
                                    color: Theme.of(context).errorColor),
                              ),
                              verticalSpaceSmall,
                              Container(
                                  height: 58.h,
                                  width: 440.w,
                                  child: AuthButton(
                                    label: 'Continue',
                                    isBusy: model.isBusy,
                                    onTap: () async {
                                      await model.changePassword();
                                      if (model.isShowDialog) {
                                        showDialog(
                                            context: context,
                                            builder: (_) =>
                                                BuildConfirmation());
                                      }
                                    },
                                  )),
                              SizedBox(
                                height: 32.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 23.w),
                                child: Row(
                                  children: [
                                    Text(
                                        'Don\'t wish to change your password?  ',
                                        style: headline6),
                                    GotoLoginButton(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
                  SvgPicture.asset(
                      model.isError ? model.errorImage : model.successImage),
                  Center(
                    child: SvgPicture.asset(model.isError
                        ? 'assets/images/x.svg'
                        : 'assets/images/mark.svg'),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              ZcdeskText.headingTwo(
                model.isError ? model.errorTitle : model.successTitle,
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                  width: 454.w,
                  alignment: Alignment.center,
                  child: ZcdeskText.headingThree(
                    model.isError
                        ? model.errorSubtiltle
                        : model.successSubtitle,
                  )),
              SizedBox(
                height: 32.h,
              ),
              GestureDetector(
                onTap: model.gotoLogin,
                child: Container(
                  height: 48.h,
                  width: 154.w,
                  color: Color.fromRGBO(0, 184, 124, 1),
                  child: Center(
                    child: Text(
                      'Continue to Login',
                      style: headline6.copyWith(
                        color: Color.fromRGBO(0, 184, 124, 1),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ChangePasswordViewModel(),
    );
  }
}
