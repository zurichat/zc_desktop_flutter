import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/auth/success_page/success_view_model.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';

class SuccessView extends StatefulWidget {
  const SuccessView({Key? key}) : super(key: key);
  @override
  _SuccessViewState createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SuccessViewModel>.reactive(
      viewModelBuilder: () => SuccessViewModel(),
      builder: (
        BuildContext context,
        SuccessViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            body: Column(
          children: [
            Container(
                height: 40,
                child: buildAppBar(context,
                    isHome: false, text: 'Success | Zuri')),
                    SizedBox(
                      height: 300.h,
                    ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset('assets/images/success.svg'),
                    Center(
                      child: SvgPicture.asset('assets/images/mark.svg'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  'Email verification succesfull !',
                  style: TextStyle(
                      fontSize: 31.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lato',
                      color: Colors.black),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  width: 454.w,
                  child: Text(
                    'Click on the Button to continue',
                    style: TextStyle(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lato',
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                GestureDetector(
                  onTap: model.gotoLogin,
                  child: Container(
                    height: 48.h,
                    width: 154.w,
                    color: Color.fromRGBO(0, 184, 124, 1),
                    child: Center(
                      child: Text(
                        'Continue to Login',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Lato',
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
      },
    );
  }
}
