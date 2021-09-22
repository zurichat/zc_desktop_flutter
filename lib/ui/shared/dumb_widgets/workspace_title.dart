import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WorkSpaceTitle extends StatelessWidget {
  const WorkSpaceTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      child: Row(
        children: [
          Text(
            '# Announcement',
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: SvgPicture.asset('assets/icons/vectordown_icon.svg'))
        ],
      ),
    );
  }
}
