import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const_app_colors.dart';
import '../const_text_styles.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isBusy;

  AuthButton({required this.label, this.onTap, this.isBusy = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color.fromRGBO(0, 184, 124, 1),
        ),
      ),
      onPressed: onTap,
      child: !isBusy
          ? Text(
              label,
              style: authBtnStyle,
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.white,
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

    // ElevatedButton(
    //     onPressed: onTap,
    //     style: ElevatedButton.styleFrom(
    //         onSurface: kcBackgroundColor1,
    //         side: BorderSide(color: preferenceBorderblack)
    //         // fixedSize: Size(double.infinity, 60.h
    //         // )
    //         ),
    //     child: ZcdeskText.extraSmallText(label));
  }
}
