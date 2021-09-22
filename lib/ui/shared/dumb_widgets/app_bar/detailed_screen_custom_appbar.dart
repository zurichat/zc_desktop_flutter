import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

class DetailedCustomAppBar extends StatelessWidget {
  const DetailedCustomAppBar(
      {Key? key,
      this.margin,
      this.leading = const SizedBox(),
      this.trailing = const SizedBox()})
      : super(key: key);

  final Widget leading;
  final Widget trailing;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: fullWidth(context),
      //color: Theme.of(context).accentColor,
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [leading, trailing],
      ),
    );
  }
}
