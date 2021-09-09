// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/build_left_startup_image.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'sign_up_viewmodel.dart';
import 'package:zcdesk_ui/src/shared/styles.dart';

class SignUpView extends StatelessWidget with Validator {
  const SignUpView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool check = false;
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
                    isSignUp: true, text: 'Sign Up | Zuri')),
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
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      AuthInputField(
                                        label: 'First Name',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (value) {
                                          model.setFname(value);
                                        },
                                        hintPlaceHolder: 'John',
                                        validator: (value) {
                                          if (validateName((value) as String)) {
                                            return null;
                                          }
                                          return 'First Name must be at least 3 characters long';
                                        },
                                      ),
                                      AuthInputField(
                                        label: 'Last Name',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (value) {
                                          model.setLname(value);
                                        },
                                        hintPlaceHolder: 'Doe',
                                        validator: (value) {
                                          if (validateName((value) as String)) {
                                            return null;
                                          }
                                          return 'First Name must be at least 3 characters long';
                                        },
                                      ),
                                      AuthInputField(
                                        label: 'Username',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (value) {
                                          model.setUsername(value);
                                        },
                                        hintPlaceHolder: 'protector',
                                        validator: (value) {
                                          if (validateName(
                                              (value) as String)) {
                                            return null;
                                          }
                                          return 'Username must be at least 3 characters long';
                                        },
                                      ),
                                      AuthInputField(
                                        label: 'phone',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (value) {
                                          model.setPhone(value);
                                        },
                                        hintPlaceHolder: '0804576859',
                                        validator: (value) {
                                          if (validatePhone(
                                              (value) as String)) {
                                            return null;
                                          }
                                          return 'Phone must be at least 11 characters';
                                        },
                                      ),
                                      AuthInputField(
                                        label: 'Email',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (value) {
                                          model.setEmail(value);
                                        },
                                        hintPlaceHolder: 'email@gmail.com',
                                        validator: (value) {
                                          if (emailValidator(
                                            (value) as String)) {
                                          return null;
                                        } 
                                        return 'Invalid Email';
                                        }
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
                                        validator: (value) {
                                          if (passwordValidator(
                                              (value) as String)) {
                                            return null;
                                          }

                                          return '''Invalid Password. Password should consist of atleast 
                                                          One Uppercase 
                                                          One Lowercase
                                                          One Character
                                                          And It should be at least 8 characters long ''';
                                        },
                                      ),
                                      verticalSpaceMedium,
                                      AuthInputField(
                                        label: 'Confirm Password',
                                        password: true,
                                        isVisible: model.passwordVisibily,
                                        onVisibilityTap:
                                            model.setPasswordVisibility,
                                        onChanged: (_) {},
                                        controller: TextEditingController(),
                                        hintPlaceHolder: 'Password',
                                        validator: (value) {
                                          if (confirmPassword((value) as String,
                                              model.password)) {
                                            return null;
                                          }
                                          return 'Password does not match';
                                        },
                                      ),
                                    ],
                                  ),
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
                                        style: bodyStyle,
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
                                    onPressed: () async {
                                        await model.validateAndSignUP(_formKey);},
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
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16, ),
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
