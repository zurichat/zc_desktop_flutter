import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/core/constants/images.dart';
import 'package:zc_desktop_flutter/core/constants/strings.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/core/validator/validation_extension.dart';
import 'package:zc_desktop_flutter/ui/auth/login_page/login_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/build_left_startup_image.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

class LoginView extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 40,
              child:
                  buildAppBar(context, isHome: false, text: 'Sign In | Zuri'),
            ),
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
                            Row(
                              children: [
                                Image.asset(AppImages.zuriLogoUrl),
                              ],
                            ),
                            verticalSpaceMedium,
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppStrings.signIn,
                                style: headline3,
                              ),
                            ),
                            verticalSpaceMedium,
                            if (model.hasError)
                              Text(
                                (model.modelError as Failure).message,
                                style: headline6.copyWith(
                                    color: Colors.red, fontSize: 12.sp),
                              ),
                            verticalSpaceMedium,
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  AuthInputField(
                                    label: 'Email',
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    hintPlaceHolder: AppStrings.emailHint,
                                    validator: context.validateEmail,
                                  ),
                                  verticalSpaceMedium,
                                  AuthInputField(
                                    label: 'Password',
                                    password: true,
                                    controller: passwordController,
                                    isVisible: model.passwordVisibily,
                                    onVisibilityTap:
                                        model.setPasswordVisibility,
                                    hintPlaceHolder: AppStrings.passwordHint,
                                    validator: context.validatePassword,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40.0.h),
                            Container(
                              height: 58.h,
                              width: 440.w,
                              child: AuthButton(
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
                            ),
                            verticalSpaceLarge,
                            Text(
                              'Easy Sign in With',
                              style: bodyText1.copyWith(fontSize: 16.sp),
                            ),
                            verticalSpaceMedium,
                            AuthIcons(),
                            verticalSpaceMedium,
                            GestureDetector(
                              onTap: model.goToSignUp,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Don\'t have an Account?',
                                      style: bodyText1,
                                    ),
                                    TextSpan(
                                      text: ' Sign Up',
                                      style: TextStyle(
                                        color: Color(0xff20C18C),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpaceTiny,
                            TextButton(
                              onPressed: model.gotoForgetpassword,
                              child: Text(
                                'Forgot Password?',
                                style: bodyText1.copyWith(fontSize: 16.sp),
                              ),
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
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}

class AuthIcons extends ViewModelWidget<LoginViewModel> {
  const AuthIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Image.asset(AppImages.googleLogoUrl),
          iconSize: 52.h,
          onPressed: () {},
        ),
        horizontalSpaceRegular,
        IconButton(
          icon: Image.asset(AppImages.facebookLogoUrl),
          iconSize: 52.h,
          onPressed: () {},
        ),
        horizontalSpaceRegular,
        IconButton(
          icon: Image.asset(AppImages.twitterLogoUrl),
          iconSize: 52.h,
          onPressed: () {},
        ),
      ],
    );
  }
}
