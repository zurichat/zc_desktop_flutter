// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/auth/check_mail_page/check_email_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/auth/login_page/login_view.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';


class CheckEmailView extends StatelessWidget {
  const CheckEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckEmailViewModel>.reactive(
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
                      isSignIn: true, text: 'Check Email | Zuri'),
                ),
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
                Container(
                  width: 490.w,
                  alignment: Alignment.center,
                  child: Text(
                    model.subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontSize: 18.sp,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                verticalSpaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model.wrongEmail,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 20.sp,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400),
                    ),
                    horizontalSpaceSmall,
                    GestureDetector(
                      onTap: model.goToForgetView,
                      child: Text(
                        model.reEnter,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20.sp,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
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
                          builder: (_) => LoginView(),
                        ),
                      );
                    },
                    child: Text(
                      'Go back to login_page',
                      style: authBtnStyle,
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
            )
          ],
        ));
      },
      viewModelBuilder: () => CheckEmailViewModel(),
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
