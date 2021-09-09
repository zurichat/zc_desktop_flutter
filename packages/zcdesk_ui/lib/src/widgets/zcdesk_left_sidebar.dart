import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zcdesk_ui/src/shared/app_colors.dart';
import 'package:zcdesk_ui/src/widgets/zcdesk_text.dart';

class LeftSideBar extends StatelessWidget {
  final String iconText;
  final ImageProvider icon;
  final VoidCallback? onTap;

  LeftSideBar({
    required this.iconText,
    required this.icon,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ImageIcon(
              icon,
              size: 15,
              color: leftNavBarColor,
            ),
            SizedBox(width: 10.w,),
            ZcdeskText.leftSideBarText(iconText),
          ],
        ),
      ),
    );
  }
}
