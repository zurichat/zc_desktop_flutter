import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

class ZcdeskReusableDropDownMenu extends StatelessWidget {
  final GlobalKey? menuKey;

  /// bool to check if drop down menu is open or closed
  final bool? isDropDownOpen;

  /// Function called when drop down tapped
  final void Function()? onDropDownTapped;

  /// Color for background
  final Color? backGroundColor;

  /// Function called when trailing icon tapped
  final void Function()? onTrailingIconTapped;

  const ZcdeskReusableDropDownMenu({
    Key? key,
    this.menuKey,
    this.isDropDownOpen,
    this.onDropDownTapped,
    this.backGroundColor,
    this.onTrailingIconTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: menuKey,
      onTap: onDropDownTapped,
      child: Container(
        color: backGroundColor,
        height: 50.0,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  isDropDownOpen!
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  color: leftNavBarColor,
                ),
                horizontalSpaceRegular,
                Container(
                  child: ZcdeskText.dropDownTitleStyle("Channels"),
                ),
              ],
            ),
            GestureDetector(
              onTap: onTrailingIconTapped,
              child: Icon(
                Icons.add_circle_outline,
                color: leftNavBarColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

OverlayEntry createDropDown(
    {Offset? boxPosition,
    Size? boxSize,
    int? listItemCount,
    RenderBox? renderBox,
    void Function()? onItemTapped,
    Color? itemBackGroundColor,
    IconData? listItemIcon,
    String? listItemText}) {
  return OverlayEntry(builder: (context) {
    return Positioned(
      top: boxPosition!.dy + boxSize!.height,
      left: boxPosition.dx,
      width: boxSize.width,
      child: Material(
        child: Container(
          height: listItemCount! * renderBox!.size.height,
          child: Column(
            children: [
              Column(
                children: List.generate(
                  listItemCount,
                  (index) => GestureDetector(
                    onTap: onItemTapped,
                    child: Container(
                      padding: EdgeInsets.only(left: 34.0,),
                      width: renderBox.size.width,
                      height: renderBox.size.height,
                      decoration: BoxDecoration(
                        color: itemBackGroundColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            listItemIcon,
                            color: leftNavBarColor,
                          ),
                          horizontalSpaceSmall,
                          ZcdeskText.dropDownBodyTextStyle(listItemText!),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
}
