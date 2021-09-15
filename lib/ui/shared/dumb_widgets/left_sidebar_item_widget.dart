import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

class LeftSideBarItem extends StatelessWidget {
  final Function() onTap;
  final ImageProvider icon;
  final String title;

  const LeftSideBarItem({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ImageIcon(
                  icon,
                  size: 15.sp,
                  color: kcPrimaryColor,
                ),
                horizontalSpaceSmall,
                ZcdeskText.leftSideBarText(title),
              ],
            ),
            verticalSpaceRegular
          ],
        ),
      ),
    );
  }
}
