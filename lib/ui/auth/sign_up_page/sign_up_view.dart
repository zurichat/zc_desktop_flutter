import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/build_left_startup_image.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'sign_up_viewmodel.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    final GlobalKey<FormState> _formKey = GlobalKey();
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
                      child: Scrollbar(
                        controller: _scrollController,
                        showTrackOnHover: true,
                        interactive: true,
                        isAlwaysShown: true,
                        scrollbarOrientation: ScrollbarOrientation.right,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 72.w),
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
                                      style: heading4Style,
                                    ),
                                  ],
                                ),
                                Text(
                                  model.subtitle,
                                  style: heading2Style,
                                ),
                                verticalSpaceMedium,
                                if (model.isSignUpSuccessful)
                                  Text(
                                      'Sign Up Successful, You will be redirected to the login page shortly',
                                      style: headline6.copyWith(
                                          color: kcSuccessColor)),
                                if (model.isSignUpNotSuccessful)
                                  Text(model.errorMessage,
                                      style: headline6.copyWith(
                                          color: kcErrorColor)),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      // AuthInputField(
                                      //   label: 'First Name',
                                      //   keyboardType:
                                      //       TextInputType.emailAddress,
                                      //   onChanged: (value) {
                                      //     model.setFname(value);
                                      //   },
                                      //   errorText: model.fnameError,
                                      //   hintPlaceHolder: 'John',
                                      // ),
                                      // AuthInputField(
                                      //   label: 'Last Name',
                                      //   keyboardType:
                                      //       TextInputType.emailAddress,
                                      //   onChanged: (value) {
                                      //     model.setLname(value);
                                      //   },
                                      //   errorText: model.lnameError,
                                      //   hintPlaceHolder: 'Doe',
                                      // ),
                                      // AuthInputField(
                                      //   label: 'Username',
                                      //   onChanged: (value) {
                                      //     model.setUsername(value);
                                      //   },
                                      //   hintPlaceHolder: 'protector',
                                      //   errorText: model.usernameError,
                                      // ),
                                      // AuthInputField(
                                      //     label: 'phone',
                                      //     keyboardType: TextInputType.number,
                                      //     onChanged: (value) {
                                      //       model.setPhone(value);
                                      //     },
                                      //     hintPlaceHolder: '0804576859',
                                      //     errorText: model.phoneError),
                                      AuthInputField(
                                        label: 'Email',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (value) {
                                          model.setEmail(value);
                                        },
                                        hintPlaceHolder: 'email@gmail.com',
                                        errorText: model.emailError,
                                      ),
                                      verticalSpaceMedium,
                                      AuthInputField(
                                        label: 'Password',
                                        password: true,
                                        isVisible: model.passwordVisibily,
                                        onVisibilityTap:
                                            model.setPasswordVisibility,
                                        onChanged: (value) {
                                          model.setPassword(value);
                                        },
                                        hintPlaceHolder: 'password',
                                        errorText: model.passwordError,
                                      ),
                                      verticalSpaceMedium,
                                      AuthInputField(
                                          label: 'Confirm Password',
                                          password: true,
                                          isVisible: model.passwordVisibily,
                                          onVisibilityTap:
                                              model.setPasswordVisibility,
                                          errorText: model.confirmPasswordError,
                                          onChanged: (value) {
                                            model.setConfirmPassword(value);
                                          },
                                          hintPlaceHolder: 'Password'),
                                    ],
                                  ),
                                ),
                                verticalSpaceMedium,
                                Row(
                                  children: [
                                    Checkbox(
                                      value: model.isCheck,
                                      activeColor: kcSuccessColor,
                                      onChanged: (_) {
                                        model.setIsCheck();
                                      },
                                    ),
                                    Expanded(
                                      child: Text(
                                        model.policy,
                                        style: bodyStyle,
                                      ),
                                    )
                                  ],
                                ),
                                Text(model.isCheckError ?? '',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Lato')),
                                verticalSpaceMedium,
                                Container(
                                    height: 58.h,
                                    width: 440.w,
                                    child: AuthButton(
                                      label: 'Register',
                                      onTap: () async {
                                        await model.validateAndSignUP();
                                      },
                                      isBUsy: model.isBusy,
                                    )),
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 16,
                                  ),
                                  child: Center(
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
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
