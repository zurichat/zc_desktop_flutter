import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/asset_paths.dart';
import 'package:zc_desktop_flutter/ui/views/auth/success/success_viewmodel.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SuccessViewModel>.nonReactive(
      viewModelBuilder: () => SuccessViewModel(),
      builder: (BuildContext context, model, Widget? child) {
        return Scaffold(
          body: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(SuccessSvgPath),
                      Center(
                        child: SvgPicture.asset(MarkSvgPath),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'Email verification successful!',
                    style: TextStyle(
                        fontSize: 31.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato',
                        color: Colors.black),
                  ),
                  SizedBox(height: 24.h),
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
                    onTap: model.navigateToLoginView,
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
          ),
        );
      },
    );
  }
}
