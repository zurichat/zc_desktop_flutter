import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zc_desktop_flutter/core/validator/validation_extension.dart';
import 'package:zc_desktop_flutter/core/constants/images.dart';
import 'package:zc_desktop_flutter/core/constants/strings.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/build_left_startup_image.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'sign_up_viewmodel.dart';

class SignUpView extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    final _scrollController = useScrollController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 40,
              child:
                  buildAppBar(context, isHome: false, text: 'Sign Up | Zuri'),
            ),
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
                                    SvgPicture.asset(AppImages.zuriIcon),
                                    verticalSpaceMedium,
                                    Text(
                                      AppStrings.zuriText,
                                      style: kHeading4TextStyle,
                                    ),
                                  ],
                                ),
                                Text(
                                  AppStrings.createAccount,
                                  style: kHeading2TextStyle,
                                ),
                                verticalSpaceMedium,
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
                                        hintPlaceHolder: AppStrings.emailHint,
                                        validator: context.validateEmail,
                                      ),
                                      verticalSpaceMedium,
                                      AuthInputField(
                                        label: 'Password',
                                        password: true,
                                        isVisible: model.passwordVisibily,
                                        onVisibilityTap:
                                            model.setPasswordVisibility,
                                        hintPlaceHolder:
                                            AppStrings.passwordHint,
                                        controller: passwordController,
                                        validator: context.validatePassword,
                                      ),
                                      verticalSpaceMedium,
                                      AuthInputField(
                                        label: 'Confirm Password',
                                        password: true,
                                        isVisible:
                                            model.confirmPasswordVisibily,
                                        onVisibilityTap:
                                            model.setconfirmPasswordVisibility,
                                        hintPlaceHolder:
                                            AppStrings.passwordHint,
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
                                        AppStrings.policyText,
                                        style: kBodyTextStyle,
                                      ),
                                    )
                                  ],
                                ),
                                // Text(model.isCheckError ?? '',
                                //     style: TextStyle(
                                //         color: Colors.red,
                                //         fontSize: 13.sp,
                                //         fontWeight: FontWeight.w400,
                                //         fontFamily: 'Lato')),
                                verticalSpaceMedium,
                                Container(
                                    height: 58.h,
                                    width: 440.w,
                                    child: AuthButton(
                                      label: 'Register',
                                      onTap: () async {
                                        if (!_formKey.currentState!.validate())
                                          return;

                                        await model.signup(
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
                                AuthIcons(),
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

class AuthIcons extends ViewModelWidget<SignUpViewModel> {
  const AuthIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, SignUpViewModel model) {
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
