import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/profile/profile_drop/profile_drop_view.dart';

class ProfileDropdownViewModel extends BaseViewModel {
  GlobalKey actionKey = GlobalKey();
  late double height, width, xPosition, yPosition;
  late OverlayEntry floatingDropdown;
  bool isDropped = false;

  bool get isDroppedd => isDropped;
  get floatingDrop => floatingDropdown;

  OverlayEntry createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        right: 100.w,
        width: 300.w,
        height: 500.h,
        top: 60.h,
        child: InkWell(
          onTap: () {},
          child: DropDown(),
        ),
      );
    });
  }

  void findDropdownData() {
    RenderBox? renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    print(height);
    print(width);
    print(xPosition);
    print(yPosition);
  }
}
