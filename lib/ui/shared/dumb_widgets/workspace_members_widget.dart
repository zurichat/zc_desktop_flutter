import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

class WorkSpaceMembers extends StatelessWidget {
  const WorkSpaceMembers({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 115.w,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(color: Colors.grey)),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                    child: MemberAvatar(
                      avatar: 'assets/images/pictureAvatar3.png',
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    top: 0,
                    left: 3,
                    child: MemberAvatar(
                      avatar: 'assets/images/pictureAvatar2.png',
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    top: 0,
                    left: 40,
                    child: MemberAvatar(
                      avatar: 'assets/images/pictureAvatar1.png',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 2.0.w),
                child: Text(
                  '300',
                  style: messageTimeStyleNormal1,
                ),
              ),
            ),
          ],
        ));
  }
}

class MemberAvatar extends StatelessWidget {
  const MemberAvatar({
    Key? key,
    this.avatar,
  }) : super(key: key);
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(avatar!)),
        borderRadius: BorderRadius.all(
          Radius.circular(3.0),
        ),
      ),
      height: 40.h,
      width: 40.w,
    );
  }
}
