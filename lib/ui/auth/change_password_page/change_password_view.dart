import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/build_left_startup_image.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

import 'change_password_view_model.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}): super(key: key);
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              verticalSpaceMedium,
                              SvgPicture.asset(model.logoUrl),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Reset Password',
                                  style: TextStyle(
                                      fontSize: 32.sp,
                                      color: Color.fromRGBO(36, 36, 36, 1),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600),
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
                              Container(
                                  height: 58.h,
                                  width: 440.w,
                                  child: AuthButton(
                                    label: 'Continue',
                                    isBUsy: model.isBusy,
                                    onTap: () async {
                                      await model.changePassword();
                                      if(model.isShowDialog) {
                                         showDialog(
                                            context: context,
                                            builder: (_) =>
                                                BuildConfirmation());
                                      }
                                    },
                                  )),
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
    const BuildConfirmation({ Key? key }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return ViewModelBuilder<ChangePasswordViewModel>.nonReactive(builder: (context, model, child) => Dialog(
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
                  child: SvgPicture.asset(
                      model.isError ? 'assets/images/x.svg' : 'assets/images/mark.svg'),
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              model.isError ? model.errorTitle : model.successTitle,
              style: TextStyle(
                  fontSize: 31.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Lato',
                  color: Colors.black),
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              width: 454.w,
              child: Text(
                model.isError ? model.errorSubtiltle : model.successSubtitle,
                style: TextStyle(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lato',
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
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
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lato',
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ), viewModelBuilder: () => ChangePasswordViewModel(),);
      
       
    }
  }