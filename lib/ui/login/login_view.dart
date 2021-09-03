import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/login/login_viewmodel.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppbar(),
        body: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: kcPrimaryColor,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(model.circularImage),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      model.title,
                      textAlign: TextAlign.center,
                      style: headline6.copyWith(color: Colors.white),
                    ),
                    verticalSpaceSmall,
                    Text(
                      model.subTitle,
                      textAlign: TextAlign.center,
                      style: subtitle2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    verticalSpaceLarge,
                  ],
                ),
              ),
            ),
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
                        controller: TextEditingController(),
                        hintPlaceHolder: 'password@gmail.com',
                      ),
                      verticalSpaceMedium,
                      AuthInputField(
                        label: model.password,
                        password: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: TextEditingController(),
                        hintPlaceHolder: 'Password',
                      ),
                      SizedBox(height: 40.0.h),
                      ZcDeskButton(
                        text: 'Sign In',
                        onPressed: () {},
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
                        onTap: () => print('Sign Up Button Pressed'),
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
                        onPressed: () =>
                            print('Forgot Password Button Pressed'),
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
