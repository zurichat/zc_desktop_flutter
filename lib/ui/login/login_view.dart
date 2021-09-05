import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/appbar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/login/login_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/forgotPasswordPage/forgot_password_view.dart';
import 'package:zc_desktop_flutter/ui/views/widgets/build_left_startup_image.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: implementation_imports
import 'package:zcdesk_ui/src/shared/styles.dart';

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
            Container(height: 40, child: buildAppBar(context, isSignIn: true, text: 'Sign In | Zuri')),
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
                            AuthInputField(
                              label: model.email,
                              onChanged: model.emailChanged,
                              hintPlaceHolder: 'password@gmail.com',
                            ),
                            verticalSpaceMedium,
                            AuthInputField(
                              label: model.password,
                              password: true,
                              isVisible: model.passwordVisibily,
                              onVisibilityTap: model.setPasswordVisibility,
                              onChanged: model.passwordChanged,
                              keyboardType: TextInputType.emailAddress,
                              controller: TextEditingController(),
                              hintPlaceHolder: 'Password',
                            ),
                            SizedBox(height: 40.0.h),
                            Container(
                              height: 58.h,
                              width: 440.w,
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blue[800])),
                                onPressed: model.goToHome,
                                child: Text(
                                  "Login",
                                  style: authBtnStyle,
                                ),
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
                              onPressed: () {
                                //TODO to be replaced with the normal navigation\
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => ForgotPasswordPage()));
                              },
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
