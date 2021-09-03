import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

buildAppBar(BuildContext context, bool isActive) {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                size: 20,
                color: lightIconColor,
              ),
            ),
            SizedBox(width: 150),
            IconButton(
              onPressed: () {},
              icon: Icon(
                icona,
                size: 20,
                color: lightIconColor,
              ),
            ),
            //  SizedBox(width: 10),
            IconButton(
              onPressed: () {},
              icon: Icon(
                iconb,
                size: 20,
                color: lightIconColor,
              ),
            ),
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
            IconButton(
              onPressed: () {},
              icon: Icon(
                icond,
                size: 20,
                color: lightIconColor,
              ),
            ),
            SizedBox(width: 100),
            GestureDetector(
              child: Stack(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(),
                      Positioned(
                        top: 15,
                        left: 28,
                        child: Container(
                          height: 15,
                          width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        decoration: BoxDecoration(
                            color: isActive ? Colors.green : Colors.grey,
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ],
              ),
            ),
            WindowsButton()
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
