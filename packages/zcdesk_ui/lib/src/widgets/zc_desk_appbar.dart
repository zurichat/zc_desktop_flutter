import 'package:flutter/material.dart';
import 'package:zcdesk_ui/src/shared/app_colors.dart';
import 'package:zcdesk_ui/src/shared/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//TODO: Appbar still needs a lot of improvement
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF242424),
      leading: Icon(Icons.menu, size: 16.h, color: timeColor),
      title: Text(
        'Sign In | Zuri',
        style: subtitle2.copyWith(
          fontSize: 18.sp,
          color: timeColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.minimize, size: 18.h, color: timeColor),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.copy, size: 18.h, color: timeColor),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.close, size: 18.h, color: timeColor),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
