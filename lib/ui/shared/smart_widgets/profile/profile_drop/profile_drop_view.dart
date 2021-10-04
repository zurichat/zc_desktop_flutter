import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferences_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/profile/profile_drop/profile_drop_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/profile/profile_edit/profile_edit_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/status_dialog/status_dialog_min/status_dialog_min_view.dart';

class ProfileDropdownView extends StatelessWidget {
  ProfileDropdownView({Key? key}) : super(key: key);

  final GlobalKey actionKey = GlobalKey();
  late double height, width, xPosition, yPosition;
  late OverlayEntry _floatingDropdown;

  late OverlayEntry _floatingDrop;

  get floatingDropDown => floatingDrop;

  bool _isDropped = false;

  get floatingDrop => _floatingDropdown;

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        right: 100,
        width: 250.w,
        height: 350.h,
        top: 60.h,
        child: Container(
          child: Material(
            child: InkWell(
              onTap: () {
                _toggleDropdown(context: context, close: true);
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

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileDropdownViewModel>.reactive(
      builder: (context, model, child) => Material(
        child: InkWell(
          onTap: () {
            _toggleDropdown(context: context);
          },
          child: Container(
            width: 40.w,
            height: 40.h,
            child: ClipRRect(),
          ),
        ),
      ),
      viewModelBuilder: () => ProfileDropdownViewModel(),
    );
  }

  void _toggleDropdown(
      {bool close = false, required BuildContext context}) async {
    final model = ProfileDropdownViewModel();
    if (model.isDropped || close) {
      this._floatingDropdown.remove();
      model.setIsDropped(false);
    } else {
      this._floatingDropdown = this._createFloatingDropdown();
      Overlay.of(context)!.insert(this._floatingDropdown);
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
          child: Column(
            children: <Widget>[
              ProfilePicture(),
              Container(
                width: 250.w,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: OutlineButton(
                  onPressed: () {
                    onPress!();
                    showDialog(
                        context: context,
                        builder: (context) => StatusDialogMinView());
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.edit_outlined,
                    ),
                  ),
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
                      context: context, builder: (context) => PreferenceView());
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
      ),
    );
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
                        style: model.isHover ? subtitlec2 : subtitle2,
                      ),
                      Spacer(),
                      Icon(
                        iconData,
                        color: model.isHover ? kcBackgroundColor2 : headerColor,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class ProfilePicture extends StatelessWidget {
  bool isActive = false;

  ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileDropdownViewModel>.reactive(
      onModelReady: (model) {
        model.getUserDetail();
      },
      viewModelBuilder: () => ProfileDropdownViewModel(),
      builder: (context, model, child) => Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.email,
                    style: subtitle3b,
                  ),
                  verticalSpaceTiny,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: isActive
                                ? createChannelTextColor
                                : kcSuccessColor),
                      ),
                      horizontalSpaceTiny,
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
      ),
    );
  }
}
