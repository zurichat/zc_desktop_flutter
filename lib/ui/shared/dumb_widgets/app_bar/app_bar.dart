import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferences_view.dart';
import 'package:zc_desktop_flutter/ui/shared/profile/profile_drop/profile_drop_view.dart';

Widget buildAppBar(BuildContext context,
    {bool isActive = false,
    bool isSignUp = false,
    bool isSignIn = false,
    String text = ''}) {
  final icona = Icons.arrow_back;
  final iconb = Icons.arrow_forward;
  final iconc = Icons.watch_later_outlined;
  return Container(
    height: 40.h,
    color: Colors.black,
    child: WindowTitleBarBox(
      child: MoveWindow(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SvgPicture.asset('assets/icons/zuri.svg'),
            ),
            if (!isSignUp && !isSignIn) SizedBox(width: 40.w),
            Row(
              children: [
                !isSignUp && !isSignIn
                    ? IconButton(
                        onPressed: () {},
                        icon: Icon(
                          icona,
                          size: 20,
                          color: lightIconColor,
                        ),
                      )
                    : Expanded(
                        child: Text(
                        text,
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'Lato'),
                      )),
                if (!isSignUp && !isSignIn)
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        iconb,
                        size: 20,
                        color: lightIconColor,
                      )),
                if (!isSignUp && !isSignIn)
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return PreferenceView();
                          });
                    },
                    icon: Icon(
                      iconc,
                      size: 20,
                      color: lightIconColor,
                    ),
                  ),
              ],
            ),
            SizedBox(width: 29.w),
            if (!isSignUp && !isSignIn)
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(153, 153, 153, 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 7),
                      child: Text('Search here',
                          style: TextStyle(
                              color: Color.fromRGBO(231, 231, 231, 1),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Lato')),
                    ),
                  ),
                ),
              ),
            if (!isSignUp && !isSignIn)
              SizedBox(
                  width: MediaQuery.of(context).size.width <= 1440
                      ? 120.w
                      : 500.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!isSignUp && !isSignIn)
                  GestureDetector(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ProfileDropdownView(),
                        Positioned(
                          top: 16,
                          left: 20,
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: isActive ? Colors.green : Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(width: 35.w),
                Align(alignment: Alignment.centerRight, child: WindowsButton())
              ],
            )
          ],
        ),
      ),
    ),
  );
}

class WindowsButton extends StatelessWidget {
  const WindowsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = WindowButtonColors(
      mouseOver: Color(0xFFD32F2F),
      mouseDown: Color(0xFFB71C1C),
      iconNormal: lightIconColor,
      iconMouseOver: Colors.white,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MinimizeWindowButton(colors: colors),
        MaximizeWindowButton(colors: colors),
        CloseWindowButton(colors: colors)
      ],
    );
  }
}
