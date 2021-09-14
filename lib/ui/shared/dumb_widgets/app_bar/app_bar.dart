import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferences_view.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

Widget buildAppBar(BuildContext context,
    {bool isActive = false,
    bool isSignUp = false,
    bool isSignIn = false,
    String text = ''}) {
  final icon = Icons.menu;
  final icona = Icons.arrow_back;
  final iconb = Icons.arrow_forward;
  final iconc = Icons.watch_later_outlined;
  final icond = Icons.settings_outlined;
  return Container(
    height: 45.h,
    color: Colors.black,
    child: WindowTitleBarBox(
      child: MoveWindow(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                size: 20,
                color: lightIconColor,
              ),
            ),
            SizedBox(width: !isSignUp && !isSignIn ? 150.w : 70.w),
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
                    style: TextStyle(color: Colors.white, fontFamily: 'Lato'),
                  )),
            //  SizedBox(width: 10),
            if (!isSignUp && !isSignIn)
              IconButton(
                onPressed: () {},
                icon: Icon(
                  iconb,
                  size: 20,
                  color: lightIconColor,
                ),
              ),
            if (!isSignUp && !isSignIn)
              // SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  iconc,
                  size: 20,
                  color: lightIconColor,
                ),
              ),
            // SizedBox(width: 10),
            if (!isSignUp && !isSignIn)
              Container(
                constraints: BoxConstraints(
                  maxHeight: 18,
                  maxWidth: 350.0,
                ),
                decoration: BoxDecoration(
                  color: bodyColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  cursorHeight: 16,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 15,
                      color: lightIconColor,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: timeColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: bodyColor,
                    isDense: true,
                    //border: InputBorder.none,
                  ),
                ),
              ),
            //  SizedBox(width: 10),
            // if (!isSignUp && !isSignIn)
              IconButton(
                onPressed: () {
                  showDialog(context: context, builder: (context){
                    return PreferenceView();
                  });
                },
                icon: Icon(
                  icond,
                  size: 20,
                  color: lightIconColor,
                ),
               )
            SizedBox(width: 100),
            if (!isSignUp && !isSignIn)
              GestureDetector(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(),
                    Positioned(
                      top: 20,
                      left: 28,
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
            Align(alignment: Alignment.centerRight, child: WindowsButton())
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
