import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferences_view.dart';
import 'package:zc_desktop_flutter/ui/shared/profile/profile_drop/profile_drop_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/profile/profile_edit/profile_edit_view.dart';

class ProfileDropdownView extends StatefulWidget {
  const ProfileDropdownView({Key? key}) : super(key: key);

  @override
  _ProfileDropdownViewState createState() => _ProfileDropdownViewState();
}

class _ProfileDropdownViewState extends State<ProfileDropdownView> {
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
        child: Material(
          child: InkWell(
            onTap: () {
              _toggleDropdown(close: true);
            },
            child: DropDown(),
          ),
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

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileDropdownViewModel>.reactive(
      builder: (context, model, child) => InkWell(
        onTap: () {
          _toggleDropdown();
          // setState(() {
          //   _toggleDropdown(close: true);
          //   // if (model.isDropped) {
          //   //   model.floatingDropdown.remove();
          //   // } else {
          //   //   model.floatingDropdown = model.createFloatingDropdown();
          //   //   Overlay.of(context)!.insert(model.floatingDropdown);
          //   // }

          //   // model.isDropped = !model.isDropped;
          // });
        },
        child: Container(
          width: 40.w,
          height: 40.h,
          child: CircleAvatar(),
        ),
      ),
      viewModelBuilder: () => ProfileDropdownViewModel(),
    );
  }

  void _toggleDropdown({
    bool close = false,
  }) {
    if (isDropped || close) {
      this.floatingDropdown.remove();
      setState(() {
        isDropped = false;
      });
    } else {
      this.floatingDropdown = this.createFloatingDropdown();
      Overlay.of(context)!.insert(this.floatingDropdown);
      setState(() {
        isDropped = true;
      });
    }
  }
}

class DropDown extends StatefulWidget {
  const DropDown({
    Key? key,
  }) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  bool isShow = false;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: Container(
        height: 400.h,
        child: Column(
          children: <Widget>[
            ProfilePicture(),
            Container(
              width: 200.w,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: OutlineButton(
                onPressed: () {},
                child: Icon(Icons.edit_outlined),
              ),
            ),
            DropDownItem(
              text: "Clear Status",
            ),
            DropDownItem(
              text: "Set yourself as Away",
            ),
            DropDownItem(
              text: "Pause Notificatons",
            ),
            Divider(),
            GestureDetector(
              child: DropDownItem(
                text: "Edit Profile",
              ),
            ),
            DropDownItem(
              text: "View Profile",
            ),
            DropDownItem(
              text: "Preferences",
            ),
            Divider(),
            DropDownItem(
              text: "Sign out of Zuri",
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownItem extends StatefulWidget {
  final String text;
  final IconData;

  const DropDownItem({
    Key? key,
    required this.text,
    this.IconData,
  }) : super(key: key);

  @override
  _DropDownItemState createState() => _DropDownItemState();
}

class _DropDownItemState extends State<DropDownItem> {
  bool isHover = false;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: Container(
        color: isHover ? kcSuccessColor : kcBackgroundColor2,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            Text(
              widget.text,
              style: subtitle2,
            ),
            Spacer(),
            Icon(
              widget.IconData,
              color: headerColor,
            ),
          ],
        ),
      ),
    );
  }

  onEntered(bool isHover) {
    setState(() {
      this.isHover = isHover;
    });
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: kcSuccessColor),
          ),
          horizontalSpaceRegular,
          Column(
            children: [
              Text(
                "Bernice_Perp",
                style: subheadingStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: kcSuccessColor,
                  ),
                  Text(
                    "Away",
                    style: subtitle2,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
