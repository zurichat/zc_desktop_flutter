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
<<<<<<< HEAD
          Text("# ${channelTitle!}", style: TextStyle()),
=======
          Text('# Announcement',
              style: TextStyle(
                color: Colors.white,
              )),
>>>>>>> parent of 1a0f028 (Theme implementation on workspace)
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: SvgPicture.asset('assets/icons/vectordown_icon.svg'))
        ],
      ),
    );
  }
}
