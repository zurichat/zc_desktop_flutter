import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const_ui_helpers.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Privacy & Terms',
                    style: bottomTextStyle(),
                  ),
                  horizontalSpaceMedium,
                  Text(
                    'Contact us',
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
                        'Change Region',
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