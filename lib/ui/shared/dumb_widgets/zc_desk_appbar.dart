import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = WindowButtonColors(
      mouseOver: Color(0xFFD32F2F),
      mouseDown: Color(0xFFB71C1C),
      iconNormal: lightIconColor,
      iconMouseOver: Colors.white,
    );
    return AppBar(
      backgroundColor: Color(0xFF242424),
      leading: Icon(Icons.menu, size: 18.h, color: timeColor),
      title: Text(
        'Sign In | Zuri',
        style: subtitle2.copyWith(
          fontSize: 18.sp,
          color: timeColor,
        ),
      ),
      actions: [
        MinimizeWindowButton(colors: colors),
        MaximizeWindowButton(colors: colors),
        CloseWindowButton(colors: colors)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
