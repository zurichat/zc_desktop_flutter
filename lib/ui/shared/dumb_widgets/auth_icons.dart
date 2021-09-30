import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

class AuthIcons extends StatelessWidget {
  final void Function()? googleOnPressed;
  final void Function()? facebookOnPressed;
  final void Function()? twitterOnPressed;

  const AuthIcons({
    Key? key,
   required this.googleOnPressed,
   required this.facebookOnPressed,
   required this.twitterOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Image.asset(GoogleLogo),
          iconSize: 40.h,
          onPressed: googleOnPressed,
        ),
        horizontalSpaceRegular,
        IconButton(
          icon: Image.asset(FacebookLogo),
          iconSize: 40.h,
          onPressed: facebookOnPressed,
        ),
        horizontalSpaceRegular,
        IconButton(
          icon: Image.asset(TwitterLogo),
          iconSize: 40.h,
          onPressed: twitterOnPressed,
        ),
      ],
    );
  }
}
