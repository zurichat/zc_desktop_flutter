import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../const_app_colors.dart';
import '../../../../const_text_styles.dart';

class AudioVideoSetting extends StatelessWidget {
  const AudioVideoSetting({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
    this.useSubtitle = false,
  }) : super(key: key);
  final bool value;
  final Function(bool?) onChanged;
  final String title;
  final String? subtitle;
  final bool useSubtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          useSubtitle ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: kcPrimaryColor,
          checkColor: kcBackgroundColor2,
          value: value,
          onChanged: onChanged,
        ),
        SizedBox(width: 10.w),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: bodyColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (useSubtitle) SizedBox(height: 2.h),
              if (useSubtitle)
                Text(
                  subtitle!,
                  style: bodyStyle.copyWith(
                    color: bodyColor.withOpacity(.5),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
