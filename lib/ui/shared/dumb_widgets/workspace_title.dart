import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WorkSpaceTitle extends StatelessWidget {
  final String? channelTitle;

  WorkSpaceTitle({Key? key, this.channelTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      child: Row(
        children: [
          Text(
            '# ${channelTitle!}',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              color: Colors.white,
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: SvgPicture.asset('assets/icons/vectordown_icon.svg'),),
        ],
      ),
    );
  }
}
