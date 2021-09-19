import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

import '../const_app_colors.dart';

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
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
    );
  }
}
