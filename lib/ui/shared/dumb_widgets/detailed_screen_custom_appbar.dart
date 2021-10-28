import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

class DetailedCustomAppBar extends StatelessWidget {
  const DetailedCustomAppBar(
      {Key? key,
      this.margin,
      this.color,
      this.leading = const SizedBox(),
      this.trailing = const SizedBox()})
      : super(key: key);

  final Widget leading;
  final Widget trailing;
  final EdgeInsetsGeometry? margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: fullWidth(context),
      color: Theme.of(context).colorScheme.secondary,
      margin: margin,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.0.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading,
          trailing,
        ],
      ),
    );
  }
}
