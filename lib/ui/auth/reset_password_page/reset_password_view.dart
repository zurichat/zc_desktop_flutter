// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/auth/check_mail_page/check_email_view.dart';
import 'package:zc_desktop_flutter/ui/auth/reset_password_page/reset_password_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';


class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
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
                      model.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 43.sp,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600),
                    ),
                    verticalSpaceSmall,
                    Text(
                      model.subTitle,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400),
                    ),
                    verticalSpaceLarge,
                    Container(
                      width: 440.w,
                      child: AuthInputField(
                        label: 'Email',
                        controller: TextEditingController(),
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
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blue[800],
                          ),
                        ),
                        onPressed: () {
                          //TODO replace with the normal nav
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => CheckEmailView(),
                            ),
                          );
                        },
                        child: Text(
                          'Get Reset Link',
                          style: authBtnStyle,
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
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
                              icon: SvgPicture.asset('assets/images/world.svg')),
                          Text(
                            model.changeRegion,
                            style: bottomTextStyle(),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon:
                              SvgPicture.asset('assets/images/arrow_down.svg')),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
      viewModelBuilder: () => ResetPasswordViewModel(),
    );
  }

  bottomTextStyle() {
    return TextStyle(
        fontFamily: 'Lato',
        fontSize: 18.sp,
        color: Color.fromRGBO(153, 153, 153, 1),
        fontWeight: FontWeight.w400);
  }
}
