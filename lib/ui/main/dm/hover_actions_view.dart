import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';

class MoreActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          height: 480.h,
          width: 320.w,
          color: whiteColor,
          child: ListView(
            children: [
              MoreActionTile(
                  title: 'Turn off notifications for replies',
                  trailing: SizedBox()),
              MoreActionTile(title: 'Mark unread', trailing: Text('U')),
              MoreActionTile(
                title: 'Remind me about this',
                trailing: SvgPicture.asset(
                  SVGAssetPaths.right_icon,
                ),
              ),
              MoreActionTile(title: 'Copy link', trailing: SizedBox()),
              MoreActionTile(
                  title: 'Pin to this conversation', trailing: Text('F')),
              MoreActionTile(
                  title: 'Turn question into poll', trailing: SizedBox()),
              MoreActionTile(
                  title: 'More message shortcuts',
                  trailing: SvgPicture.asset(SVGAssetPaths.shortcut))
            ],
          )),
    );
  }
}

class MoreActionTile extends StatelessWidget {
  final String title;
  final Widget trailing;
  MoreActionTile({required this.title, required this.trailing});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: trailing,
    );
  }
}
