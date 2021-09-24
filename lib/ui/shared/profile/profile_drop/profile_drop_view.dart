import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/main/status_dialog/status_dialog_min/status_dialog_min_view.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferences_view.dart';
import 'package:zc_desktop_flutter/ui/shared/profile/profile_drop/profile_drop_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/profile/profile_edit/profile_edit_view.dart';
import 'package:zc_desktop_flutter/ui/shared/profile/profile_edit/profile_edit_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/profile/profile_upload_image/profile_upload_view.dart';

class ProfileDropdownView extends StatelessWidget {
  ProfileDropdownView({Key? key}) : super(key: key);

  final GlobalKey actionKey = GlobalKey();
  late double height, width, xPosition, yPosition;
  late OverlayEntry floatingDropdown;

  get floatingDrop => floatingDropdown;

  OverlayEntry createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        right: 100.w,
        width: 300.w,
        height: 450.h,
        top: 60.h,
        child: Container(
          child: Material(
            child: InkWell(
              onTap: () {
                _toggleDropdown(close: true, context: context);
              },
              child: DropDown(
                onPress: () {
                  _toggleDropdown(close: true, context: context);
                },
              ),
            ),
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
    // Offset offset = renderBox.localToGlobal(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileDropdownViewModel>.reactive(
      builder: (context, model, child) => InkWell(
        onTap: () {
          _toggleDropdown(context: context);
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
          child: ClipRRect(),
        ),
      ),
      viewModelBuilder: () => ProfileDropdownViewModel(),
    );
  }

  void _toggleDropdown({bool close = false, BuildContext? context}) {
    final model = ProfileDropdownViewModel();
    if (model.isDropped || close) {
      this.floatingDropdown.remove();
      model.setIsDropped(false);
    } else {
      this.floatingDropdown = this.createFloatingDropdown();
      Overlay.of(context!)!.insert(this.floatingDropdown);
      model.setIsDropped(true);
    }
  }
}

class DropDown extends StatelessWidget {
  DropDown({
    Key? key,
    this.onPress,
  }) : super(key: key);

  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileDropdownViewModel>.reactive(
        viewModelBuilder: () => ProfileDropdownViewModel(),
        builder: (context, model, child) => Material(
              elevation: 20,
              child: Container(
                color: kcBackgroundColor2,
                // height: 300.h,
                child: Column(
                  children: <Widget>[
                    ProfilePicture(),
                    Container(
                      width: 300.w,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: OutlineButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => StatusDialogMinView());
                        },
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
                    DropDownItem(
                      onTap: () {
                        onPress!();
                        showDialog(
                            context: context,
                            builder: (context) => ProfileEditView());
                      },
                      text: "Edit Profile",
                    ),
                    DropDownItem(
                      onTap: () {
                        onPress!();
                      },
                      text: "View Profile",
                    ),
                    DropDownItem(
                      onTap: () {
                        onPress!();
                        showDialog(
                            context: context,
                            builder: (context) => PreferenceView());
                      },
                      text: "Preferences",
                    ),
                    Divider(),
                    DropDownItem(
                      text: "Sign out of Zuri",
                    ),
                  ],
                ),
              ),
            ));
  }
}

class DropDownItem extends StatelessWidget {
  final String text;
  final IconData? iconData;
  void Function()? onTap;

  DropDownItem({
    Key? key,
    required this.text,
    this.onTap,
    this.iconData,
  }) : super(key: key);

  late FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileDropdownViewModel>.reactive(
        viewModelBuilder: () => ProfileDropdownViewModel(),
        builder: (context, model, child) => MouseRegion(
              onEnter: (_) => model.onEntered(true),
              onExit: (_) => model.onEntered(false),
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  color: model.isHover ? kcPrimaryColor : kcBackgroundColor2,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        text,
                        style: preferenceStyleNormal,
                      ),
                      Spacer(),
                      Icon(
                        iconData,
                        color: headerColor,
                      ),
                    ],
                  ),
                ),
              ),
            ));
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
            height: 60.h,
            width: 50.w,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
                color: kcSuccessColor),
          ),
          horizontalSpaceRegular,
          Container(
            width: 100.w,
            child: Column(
              children: [
                Text(
                  "Bernice_Perp",
                  style: preferenceStyleNormal,
                ),
                verticalSpaceTiny,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: kcSuccessColor,
                    ),
                    Text(
                      "Away",
                      style: preferenceStyleNormal,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}









 