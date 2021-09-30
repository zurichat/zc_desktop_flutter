import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
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
import 'package:zc_desktop_flutter/ui/views/auth/login/login_viewmodel.dart';

class LoginView extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    LeftSideContainer(),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 80.w, vertical: 40.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(ZuriLogoPath),
                              verticalSpaceMedium,
                              Text(
                                SignInText,
                                style: headline3,
                              ),
                              if (model.hasError) ...[
                                verticalSpaceMedium,
                                Text(
                                  (model.modelError as Failure).message,
                                  style: boldCaptionStyle.copyWith(color: Colors.red),
                                ),
                              ],
                              verticalSpaceMedium,
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    AuthInputField(
                                      label: 'Email',
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      hintPlaceHolder: EmailHintText,
                                      validator: context.validateEmail,
                                    ),
                                    verticalSpaceMedium,
                                    AuthInputField(
                                      label: 'Password',
                                      password: true,
                                      controller: passwordController,
                                      isVisible: model.passwordVisible,
                                      onVisibilityTap:
                                          model.setPasswordVisibility,
                                      hintPlaceHolder: PasswordHintText,
                                      validator: context.validatePassword,
                                    ),
                                  ],
                                ),
                              ),
                              verticalSpaceMedium,
                              AuthButton(
                                label: 'Login',
                                isBusy: model.isBusy,
                                onTap: () async {
                                  if (!_formKey.currentState!.validate())
                                    return;

                                  await model.login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                },
                              ),
                              verticalSpaceMediumTwo,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Easy Sign in With',
                                    style: bodyText1.copyWith(fontSize: 16.sp),
                                  ),
                                  verticalSpaceSmall,
                                  AuthIcons(
                                    googleOnPressed: () {},
                                    facebookOnPressed: () {},
                                    twitterOnPressed: () {},
                                  ),
                                  verticalSpaceSmall,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Don\'t have an Account?',
                                        style: subtitle2.copyWith(
                                            color: leftNavBarColor),
                                      ),
                                      TextButton(
                                        onPressed: model.goToSignUp,
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: Color(0xff20C18C),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpaceSmall,
                                  TextButton(
                                    onPressed: model.gotoForgetPassword,
                                    child: Text(
                                      'Forgot Password?',
                                      style:
                                          bodyText1.copyWith(fontSize: 16.sp),
                                    ),
                                  ),
                                ],
                              ),
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
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
