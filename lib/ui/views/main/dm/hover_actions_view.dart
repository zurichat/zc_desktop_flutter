import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';

import 'dm_viewmodel.dart';

class MoreActions extends StatelessWidget {
  final Results message;
  //final int messageIndex;
  final DmViewModel model;

  const MoreActions(
      {Key? key,
      required this.message,
      //required this.messageIndex,
      required this.model})
      : super(key: key);
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
                  onPressed: () {},
                  title: 'Turn off notifications for replies',
                  trailing: SizedBox()),
              MoreActionTile(
                  onPressed: () {}, title: 'Mark unread', trailing: Text('U')),
              MoreActionTile(
                onPressed: () {},
                title: 'Remind me about this',
                trailing: SvgPicture.asset(
                  SVGAssetPaths.right_icon,
                ),
              ),
              MoreActionTile(
                  onPressed: () {}, title: 'Copy link', trailing: SizedBox()),
              MoreActionTile(
                  onPressed: () {
                    model.pinMessage(message.id);
                    model.onPinnedMessage(true);
                    Navigator.pop(context);
                  },
                  title: 'Pin to this conversation',
                  trailing: Text('F')),
              MoreActionTile(
                  onPressed: () {},
                  title: 'Turn question into poll',
                  trailing: SizedBox()),
              MoreActionTile(
                  onPressed: () {},
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
  final void Function() onPressed;
  MoreActionTile(
      {required this.title, required this.trailing, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(title),
      trailing: trailing,
    );
  }
}

class HoverInfo extends StatelessWidget {
  final String action;
  final double width;
  HoverInfo({required this.action, required this.width});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(action);
  }
}

class SimpleClipper extends CustomClipper<Path> {
  final double width;
  SimpleClipper({required this.width});
  @override
  Path getClip(Size size) {
    Path path = new Path();
    // path start with (0.0, 0.0) point
    path.lineTo(0.0, size.height.h - 10);
    path.lineTo(width.w, size.height.h - 10); //75
    path.lineTo(width.w + 5, size.height.h); //70
    path.lineTo(width.w + 5, size.height.h - 10); //65
    path.lineTo(size.width.w, size.height.h - 10);
    path.lineTo(size.width.w, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
