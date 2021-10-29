import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/core/validator/validation_extension.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/left_side_container.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'package:zc_desktop_flutter/ui/views/auth/login/login_viewmodel.dart';


import 'login_view.form.dart';

@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'password')
  ]
)
class LoginView extends HookWidget with $LoginView {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _appLocalization = AppLocalizations.of(context)!;

    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.init();
      },
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
                                _appLocalization.signInText,
                                // SignInText,
                                style: headline3,
                              ),
                              if (model.hasError) ...[
                                verticalSpaceMedium,
                                Text(
                                  (model.modelError as Failure).message,
                                  style: boldCaptionStyle.copyWith(
                                      color: Colors.red),
                                ),
                              ],
                              verticalSpaceMedium,
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    ZuriDeskInputField(
                                      label: _appLocalization.emailHintText,
                                      // 'Email',
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      hintPlaceHolder:
                                          _appLocalization.emailHintText,
                                      //EmailHintText,
                                      validator: context.validateEmail,
                                    ),
                                    verticalSpaceMedium,
                                    ZuriDeskInputField(
                                      label: _appLocalization.passwordHintText,
                                      // 'Password',
                                      password: true,
                                      controller: passwordController,
                                      isVisible: model.passwordVisible,
                                      onVisibilityTap:
                                          model.setPasswordVisibility,
                                      hintPlaceHolder:
                                          _appLocalization.passwordHintText,
                                      //PasswordHintText,
                                      validator: context.validatePassword,
                                    ),
                                  ],
                                ),
                              ),
                              verticalSpaceMedium,
                              AuthButton(
                                label: _appLocalization.logInText,
                                //LogInText,
                                isBusy: model.isBusy,
                                onTap: () async {
                                  if (!_formKey.currentState!.validate())
                                    return;
                                  await model.login(emailController.text, passwordController.text);
                                },
                              ),
                              verticalSpaceMediumTwo,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text(
                                  //   _appLocalization.easySignIn,
                                  //   // EasySignInWith,
                                  //   style: bodyText1.copyWith(fontSize: 16.sp),
                                  // ),
                                  // verticalSpaceSmall,
                                  // AuthIcons(
                                  //   googleOnPressed: () {},
                                  //   facebookOnPressed: () {},
                                  //   twitterOnPressed: () {},
                                  // ),
                                  // verticalSpaceSmall,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _appLocalization.noAccountText,
                                        //NoAccountText,
                                        style: subtitle2.copyWith(
                                            color: leftNavBarColor),
                                      ),
                                      TextButton(
                                        onPressed: model.goToSignUp,
                                        child: Text(
                                          _appLocalization.signUpText,
                                          //SignUpText,
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
                                      _appLocalization.forgotPasswordText,
                                      //ForgotPasswordText,
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
