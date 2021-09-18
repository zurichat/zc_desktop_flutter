import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/auth/login_page/login_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/build_left_startup_image.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: implementation_imports
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
                height: 40,
                child: buildAppBar(context,
                    isSignIn: true, text: 'Sign In | Zuri')),
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
                                Image(image: AssetImage(model.logoUrl)),
                              ],
                            ),
                            verticalSpaceMedium,
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                model.signIn,
                                style: headline3,
                              ),
                            ),
                            verticalSpaceMedium,
                            if (model.isError)
                              Text(
                                model.errorMessage,
                                style: headline6.copyWith(color: Colors.red),
                              ),
                            Column(
                              children: [
                                AuthInputField(
                                  label: 'Email',
                                  onChanged: (value){
                                    model.setEmail(value);
                                  },
                                  errorText: model.emailErrorText,
                                  keyboardType: TextInputType.emailAddress,
                                  hintPlaceHolder: 'someone@gmail.com',
                                ),
                                verticalSpaceMedium,
                                AuthInputField(
                                  label: 'Password',
                                  password: true,
                                  isVisible: model.passwordVisibily,
                                  onVisibilityTap: model.setPasswordVisibility,
                                  errorText: model.passwordErrorText,
                                  onChanged: (value) {
                                    model.setPassword(value);
                                  },
                                  hintPlaceHolder: 'Password',
                                ),
                              ],
                            ),
                            SizedBox(height: 40.0.h),
                            Container(
                              height: 58.h,
                              width: 440.w,
                              child: AuthButton(label: 'Login', isBUsy: model.isBusy, onTap: () async {
                                  await model.validateAndLogin();
                                },)
                              
                              
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
          icon: Image.asset(
            model.logoUrlG,
          ),
          iconSize: 52.h,
          onPressed: () {},
        ),
        horizontalSpaceRegular,
        IconButton(
          icon: Image.asset(
            model.logoUrlF,
          ),
          iconSize: 52.h,
          onPressed: () {},
        ),
        horizontalSpaceRegular,
        IconButton(
          icon: Image.asset(
            model.logoUrlT,
          ),
          iconSize: 52.h,
          onPressed: () {},
        ),
      ],
    );
  }
}
