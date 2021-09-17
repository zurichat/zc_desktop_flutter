import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

class AuthButton extends StatelessWidget {
  late final String label;
  late final VoidCallback? onTap;

  AuthButton({
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: authBtnColor,
          // fixedSize: Size(double.infinity, 60.h
          // )
        ),
        child: ZcdeskText.authBtnStyle(label));
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
          child: Center(child: ZcdeskText.preferenceBtn(label))),
    );

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
