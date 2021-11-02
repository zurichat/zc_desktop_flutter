import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/core/validator/validation_extension.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/left_side_container.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'sign_up_view.form.dart';
import 'sign_up_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
  FormTextField(name: 'confirmPassword'),
  FormTextField(name: 'fullName')
])
class SignUpView extends HookWidget with $SignUpView {
  final _formKey = GlobalKey<FormState>();
 

  @override
  Widget build(BuildContext context) {
    final _appLocalization = AppLocalizations.of(context)!;
    return ViewModelBuilder<SignUpViewModel>.reactive(
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.init();
      },
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
                                Image.asset(ZuriLogoPath),
                                verticalSpaceMedium,
                                Text(
                                  _appLocalization.createAccounText,
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
                                        label: 'Full Name',
                                        controller: fullNameController,
                                        hintPlaceHolder: FullNameHintText,
                                        validator: context.validatePassword,
                                      ),
                                      verticalSpaceMedium,
                                      ZuriDeskInputField(
                                        label: 'Email',
                                        controller: emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintPlaceHolder: EmailHintText,
                                        validator: context.validateEmail,
                                      ),
                                      verticalSpaceMedium,
                                      ZuriDeskInputField(
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
                                      ZuriDeskInputField(
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
                                    verticalSpaceMedium,
                                    Expanded(
                                      child: Text(
                                        PolicyText,
                                        style: kBodyTextStyle,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceMedium,
                                AuthButton(
                                  label: 'Register',
                                  onTap: () async {
                                    if (!_formKey.currentState!.validate())
                                      return;
                                    await model.signUp();
                                  },
                                  isBusy: model.isBusy,
                                ),
                                verticalSpaceMedium,
                                // Center(
                                //   child: Text(
                                //     'Easy Sign in With',
                                //     style: bodyText1.copyWith(fontSize: 16.sp),
                                //   ),
                                // ),
                                // verticalSpaceMedium,
                                // AuthIcons(
                                //   googleOnPressed: () {},
                                //   facebookOnPressed: () {},
                                //   twitterOnPressed: () {},
                                // ),
                                // verticalSpaceMedium,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have an account?',
                                      style: subtitle2.copyWith(
                                          color: leftNavBarColor),
                                    ),
                                    TextButton(
                                      onPressed: model.goToLogin,
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                          color: Color(0xff20C18C),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
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
