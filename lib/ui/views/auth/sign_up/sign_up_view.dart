import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_images.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/core/validator/validation_extension.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/auth_icons.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/left_side_container.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

import 'sign_up_viewmodel.dart';

class SignUpView extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    LeftSideContainer(),
                    Expanded(
                        flex: 2,
                        child: Scrollbar(
                          showTrackOnHover: true,
                          interactive: true,
                          isAlwaysShown: true,
                          scrollbarOrientation: ScrollbarOrientation.right,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(
                                horizontal: 80.w, vertical: 40.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(ZuriLogo),
                                verticalSpaceMedium,
                                Text(
                                  CreateAccountText,
                                  style: headline3,
                                ),
                                if (model.hasError)
                                  Text(
                                    (model.modelError as Failure).message,
                                    style:
                                        headline6.copyWith(color: Colors.red),
                                  ),
                                verticalSpaceMedium,
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      AuthInputField(
                                        label: 'Email',
                                        controller: emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintPlaceHolder: EmailHintText,
                                        validator: context.validateEmail,
                                      ),
                                      verticalSpaceMedium,
                                      AuthInputField(
                                        label: 'Password',
                                        password: true,
                                        isVisible: model.passwordVisibility,
                                        onVisibilityTap:
                                            model.setPasswordVisibility,
                                        hintPlaceHolder: PasswordHintText,
                                        controller: passwordController,
                                        validator: context.validatePassword,
                                      ),
                                      verticalSpaceMedium,
                                      AuthInputField(
                                        label: 'Confirm Password',
                                        password: true,
                                        isVisible:
                                            model.confirmPasswordVisibility,
                                        onVisibilityTap:
                                            model.setConfirmPasswordVisibility,
                                        hintPlaceHolder: PasswordHintText,
                                        controller: confirmPasswordController,
                                        validator: (value) =>
                                            context.validateConfirmPassword(
                                          passwordController.text,
                                          value,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpaceMedium,
                                Row(
                                  children: [
                                    Checkbox(
                                      value: model.isPolicyChecked,
                                      activeColor: kcSuccessColor,
                                      onChanged: model.onPolicyCheckChanged,
                                    ),
                                    Expanded(
                                      child: Text(
                                        PolicyText,
                                        style: kBodyTextStyle,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceMedium,
                                SizedBox(
                                    height: 45.h,
                                    width: 440.w,
                                    child: AuthButton(
                                      label: 'Register',
                                      onTap: () async {
                                        if (!_formKey.currentState!.validate())
                                          return;
                                        await model.signUp(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      },
                                      isBusy: model.isBusy,
                                    )),
                                verticalSpaceMedium,
                                Center(
                                  child: Text(
                                    'Easy Sign in With',
                                    style: bodyText1.copyWith(fontSize: 16.sp),
                                  ),
                                ),
                                verticalSpaceMedium,
                                AuthIcons(
                                  googleOnPressed: () {},
                                  facebookOnPressed: () {},
                                  twitterOnPressed: () {},
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
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
