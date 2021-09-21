// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';

import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/build_left_startup_image.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool check = false;
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 40,
                child: buildAppBar(context,
                    isHome: false, text: 'Sign Up | Zuri')),
            Container(
              height: _size.height - 40,
              child: Row(
                children: [
                  BuildStartUpImage(),
                  Expanded(
                      flex: 2,
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 72.w),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    verticalSpaceMedium,
                                    SvgPicture.asset(model.logoUrl),
                                    verticalSpaceMedium,
                                    Text(
                                      model.title,
                                      style: kHeading4TextStyle,
                                    ),
                                  ],
                                ),
                                Text(
                                  model.subtitle,
                                  style: kHeading2TextStyle,
                                ),
                                verticalSpaceMedium,
                                AuthInputField(
                                  label: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (_) {},
                                  hintPlaceHolder: 'password@gmail.com',
                                ),
                                verticalSpaceMedium,
                                AuthInputField(
                                  label: 'Password',
                                  password: true,
                                  isVisible: model.passwordVisibily,
                                  onVisibilityTap: model.setPasswordVisibility,
                                  onChanged: (_) {},
                                  hintPlaceHolder: 'password@gmail.com',
                                ),
                                verticalSpaceMedium,
                                AuthInputField(
                                  label: 'Confirm Password',
                                  password: true,
                                  isVisible: model.passwordVisibily,
                                  onVisibilityTap: model.setPasswordVisibility,
                                  onChanged: (_) {},
                                  keyboardType: TextInputType.emailAddress,
                                  controller: TextEditingController(),
                                  hintPlaceHolder: 'Password',
                                ),
                                verticalSpaceMedium,
                                Row(
                                  children: [
                                    Checkbox(
                                      value: check,
                                      activeColor: kcSuccessColor,
                                      onChanged: (value) {},
                                    ),
                                    Expanded(
                                      child: Text(
                                        model.policy,
                                        style: kBodyTextStyle,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceMedium,
                                Container(
                                  height: 58.h,
                                  width: 440.w,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue[800])),
                                    onPressed: model.goToHome,
                                    child: Text(
                                      "Register",
                                      style: authBtnStyle,
                                    ),
                                  ),
                                ),
                                verticalSpaceMedium,
                                Center(
                                  child: Text(
                                    'Easy Sign in With',
                                    style: bodyText1.copyWith(fontSize: 16.sp),
                                  ),
                                ),
                                verticalSpaceMedium,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buttonGoog(),
                                    horizontalSpaceRegular,
                                    _buttonFace(),
                                    horizontalSpaceRegular,
                                    _buttonTwit(),
                                  ],
                                ),
                                verticalSpaceMedium,
                                Center(
                                  child: GestureDetector(
                                    onTap: model.goToLogin,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Already have an account?',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Lato',
                                                color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Sign In',
                                            style: TextStyle(
                                                color: Color(0xff20C18C),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Lato'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}

Widget _buttonGoog() {
  return GestureDetector(
    onTap: () {},
    child: SvgPicture.asset(
      "assets/images/google.svg",
      // height: 20,
      // width: 20,
    ),
  );
}

Widget _buttonFace() {
  return GestureDetector(
    onTap: () {},
    child: SvgPicture.asset(
      "assets/images/facebook.svg",
    ),
  );
}

Widget _buttonTwit() {
  return GestureDetector(
    onTap: () {},
    child: SvgPicture.asset(
      "assets/images/twitter.svg",
    ),
  );
}
