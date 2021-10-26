import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  const AuthHeader({ Key? key, required this.title, required this.subTitle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceLarge,
                SvgPicture.asset('assets/images/zc_logo.svg'),
                verticalSpaceMedium,
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 43.sp,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600),
                ),
                verticalSpaceSmall,
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400),
                ),
      ],
    );
  }
}