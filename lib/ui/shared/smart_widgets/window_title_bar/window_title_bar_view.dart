import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/profile/profile_drop/profile_drop_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/search_modal/search_modal_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/window_title_bar/window_title_bar_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/status_dialog/status_dialog_min/status_dialog_min_view.dart';

class WindowTitleBar extends StatelessWidget {
  final Widget body;

  const WindowTitleBar({required this.body, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentAreaHeight = screenHeight(context) -
        (Platform.isWindows ? appWindow.titleBarHeight : 0);
    final contentAreaWidth = screenWidth(context);

    return ViewModelBuilder<WindowTitleBarModel>.reactive(
      builder: (context, model, child) {
        return ScreenUtilInit(
          key: Key(MediaQuery.of(context).size.toString()),
          designSize: Size(1280, 720),
          builder: () => Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 15.h),
                  child: WindowTitleBarBox(
                    child: Row(
                      children: [
                        if (Platform.isMacOS || Platform.isLinux) RightSide(),
                        model.isHomeView
                            ? Expanded(child: LeftSideHome(model: model))
                            : Expanded(child: LeftSideAuth(model: model)),
                        if (Platform.isWindows) RightSide()
                      ],
                    ),
                  ),
                ),
                // Contents of the whole app
                Expanded(
                  child: SizedBox(
                    height: contentAreaHeight,
                    width: contentAreaWidth,
                    // Adjust the height of media query so that child widgets use the size of the content area as
                    // the window size. This allows ScreenUtils() to calculate scale factors using the correct
                    // size of the content area.
                    child: MediaQuery(
                      child: body,
                      data: MediaQuery.of(context).copyWith(
                        size: Size(
                          contentAreaWidth,
                          contentAreaHeight,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => WindowTitleBarModel(),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: _windowButtonColors),
        MaximizeWindowButton(colors: _windowButtonColors),
        CloseWindowButton(colors: _windowCloseButtonColors)
      ],
    );
  }
}

class LeftSideAuth extends StatelessWidget {
  const LeftSideAuth({Key? key, required this.model}) : super(key: key);
  final WindowTitleBarModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Icon(
              Icons.menu,
              color: lightIconColor,
              size: 20,
            )),
        horizontalSpaceMedium,
        Text(model.title,
            style: preferenceStyleBold.copyWith(color: lightIconColor)),
        Expanded(child: MoveWindow()),
      ],
    );
  }
}

class LeftSideHome extends HookWidget {
  final WindowTitleBarModel model;

  const LeftSideHome({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchTextFieldController = useTextEditingController();
    final width = screenWidth(context);
    final iconSize = 20.0;
    return Row(
      children: [
        SvgPicture.asset(AppSvgPath),
        if (width > 1440) horizontalSpaceLarge,
        horizontalSpaceLarge,
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_sharp,
                size: iconSize,
                color: lightIconColor,
              ),
            ),
            horizontalSpaceSmall,
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_sharp,
                size: iconSize,
                color: lightIconColor,
              ),
            ),
            horizontalSpaceSmall,
            IconButton(
              onPressed: () {
                /*showDialog(
                          context: context,
                          builder: (context) {
                            return PreferenceView();
                          });*/
              },
              icon: Icon(
                Icons.watch_later_outlined,
                size: iconSize,
                color: lightIconColor,
              ),
            ),
          ],
        ),
        horizontalSpaceSmall,
        SizedBox(
          width: 500.w,
          height: 30.w,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => SearchModalView(),
              );
            },
            child: TextField(
              enabled: false,
              controller: searchTextFieldController,
              style: TextStyle(color: lightIconColor),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                hintText: 'Search here',
                hintStyle: TextStyle(color: lightIconColor),
                filled: true,
                fillColor: bodyColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: authBtnColor, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: authBtnColor, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
        Expanded(child: MoveWindow()),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => StatusDialogMinView());
            },
            // child: Text(
            //   // statusTag,
            //   ''
            // )
            child: Icon(
              Icons.star_rate,
              size: 20,
              color: kcStatusIcon,
            ),
          ),
        ),
        horizontalSpaceVeryTiny,
        Stack(
          clipBehavior: Clip.none,
          children: [
            ProfileDropdownView(),
            Positioned(
              top: 23,
              left: 26,
              child: Container(
                height: 14,
                width: 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
        horizontalSpaceMedium,
      ],
    );
  }
}

final _windowButtonColors = WindowButtonColors(
  iconNormal: Colors.white70,
  mouseOver: Color(0xFF404040),
  mouseDown: Color(0xFF202020),
  iconMouseOver: Color(0xFFFFFFFF),
  iconMouseDown: Color(0xFFF0F0F0),
);

final _windowCloseButtonColors = WindowButtonColors(
  mouseOver: Color(0xFFD32F2F),
  mouseDown: Color(0xFFB71C1C),
  iconNormal: Colors.white70,
  iconMouseOver: Color(0xFFFFFFFF),
);
