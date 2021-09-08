// ignore_for_file: implementation_imports

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/auth/check_mail_page/check_email_view.dart';
import 'package:zc_desktop_flutter/ui/auth/reset_password_page/reset_password_view.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart' as auth;
import 'package:zcdesk_ui/src/shared/styles.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

import 'forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                    height: 40,
                    child: buildAppBar(context,
                        isSignIn: true, text: 'Forget Password | Zuri')),
                verticalSpaceLarge,
                Image.asset(model.logoUrl),
                verticalSpaceMedium,
                Text(
                  model.signInText,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 43.sp,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600),
                ),
                verticalSpaceSmall,
                Text(
                  model.signInSubtext,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400),
                ),
                verticalSpaceLarge,
                Container(
                  width: 440.w,
                  child: auth.AuthInputField(
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (_) {},
                    hintPlaceHolder: 'password@gmail.com',
                  ),
                ),
                verticalSpaceSmall,
                Container(
                  height: 58.h,
                  width: 440.w,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[800])),
                    onPressed: () {
                      //TODO replace with the normal nav
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => CheckEmailView(),
                        ),
                      );
                    },
                    child: Text(
                      model.btnText,
                      style: authBtnStyle,
                    ),
                  ),
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildLine(),
                    Text(
                      model.orText,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lato',
                          color: Color.fromRGBO(36, 36, 36, 1)),
                    ),
                    buildLine(),
                  ],
                ),
                verticalSpaceMedium,
                GestureDetector(
                  onTap: () {
                    //TODO to be replaced with the normal navigation\
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => ResetPasswordView(),
                      ),
                    );
                  },
                  child: Container(
                    height: 58.h,
                    width: 440.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Text(
                        model.resetBtnText,
                        style: TextStyle(
                            color: Color.fromRGBO(
                              26,
                              97,
                              219,
                              1,
                            ),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.privacy,
                    style: bottomTextStyle(),
                  ),
                  horizontalSpaceMedium,
                  Text(
                    model.contactUs,
                    style: bottomTextStyle(),
                  ),
                  horizontalSpaceMedium,
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/images/world.svg'),
                      ),
                      Text(
                        model.changeRegion,
                        style: bottomTextStyle(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/images/arrow_down.svg'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => ForgotPasswordViewModel(),
    );
  }

  bottomTextStyle() {
    return TextStyle(
        fontFamily: 'Lato',
        fontSize: 18.sp,
        color: Color.fromRGBO(153, 153, 153, 1),
        fontWeight: FontWeight.w400);
  }

  buildLine() {
    return Container(
      height: 1.h,
      width: 187.w,
      color: Color.fromRGBO(219, 219, 219, 1),
    );
  }
}
