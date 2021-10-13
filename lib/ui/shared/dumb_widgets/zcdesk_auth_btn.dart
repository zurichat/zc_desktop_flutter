import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const_app_colors.dart';
import '../const_text_styles.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isBusy;
  final double? height;
  final double? width;

  AuthButton(
      {required this.label,
      this.onTap,
      this.isBusy = false,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.h,
      width: width ?? 440.w,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(0, 184, 124, 1),
          ),
        ),
        onPressed: onTap,
        child: !isBusy
            ? Text(label, style: authBtnStyle)
            : Center(
                child: Container(
                  width: 16.0,
                  height: 16.0,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.0.r,
                  ),
                ),
              ),
      ),
    );
  }
}


class ProfileButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isBusy;
  final double? height;
  final double? width;

  ProfileButton(
      {required this.label,
      this.onTap,
      this.isBusy = false,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.h,
      // width: width ?? 440.w,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(0, 184, 124, 1),
          ),
        ),
        onPressed: onTap,
        child: !isBusy
            ? Text(label, style: profileBtnStyle)
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}

class PreferenceButton extends StatelessWidget {
  late final String label;
  late final VoidCallback? onTap;

  PreferenceButton({
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: 39.h,
            width: 183.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: preferenceBorderblack),
            ),
            child: Center(
                child: Text(
              label,
              style: TextStyle(
                  color: bodyColor,
                  fontSize: 13.sp,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400),
            ))));
  }
}
