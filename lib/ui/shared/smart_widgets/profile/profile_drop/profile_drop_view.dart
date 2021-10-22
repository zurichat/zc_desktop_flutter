import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferences_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/profile/profile_drop/profile_drop_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/profile/profile_edit/profile_edit_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/status_dialog/status_dialog_min/status_dialog_min_view.dart';

// ignore: must_be_immutable
class ProfileDropdownView extends StatelessWidget {
  ProfileDropdownView({Key? key}) : super(key: key);

  final GlobalKey actionKey = GlobalKey();
  late double height, width, xPosition, yPosition;
  late OverlayEntry _floatingDropdown;

  get floatingDropDown => floatingDrop;

  get floatingDrop => _floatingDropdown;

  OverlayEntry _createFloatingDropdown(ProfileDropdownViewModel model) {
    return OverlayEntry(builder: (context) {
      return Positioned(
        right: 100,
        // width: 250.w,
        // height: 400.h,
        top: 60.h,
        child: Container(
          child: Material(
            child: InkWell(
              onTap: () {
                _toggleDropdown(context: context, close: true, model: model);
              },
              child: DropDown(
                onPress: () {
                  _toggleDropdown(close: true, context: context, model: model);
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
            _toggleDropdown(context: context, model: model);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(
                width: 2,
                color: kcDisplayChannelColor3,
              ),
            ),
            child: Image.asset(
              'assets/images/profile_placeholder.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ProfileDropdownViewModel(),
    );
  }

  void _toggleDropdown(
      {bool close = false,
      required BuildContext context,
      required ProfileDropdownViewModel model}) async {
    if (model.isDropped) {
      this._floatingDropdown.remove();
      model.setIsDropped();
    } else {
      this._floatingDropdown = this._createFloatingDropdown(model);
      Overlay.of(context)!.insert(this._floatingDropdown);
      model.setIsDropped();
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
        child: Expanded(
          child: Container(
            width: 300.w,
            color: kcBackgroundColor2,
            child: Column(children: <Widget>[
              ProfilePicture(
                user: model.user,
                member: model.currentMember,
                // member: model.member,
                displayName: model.currentMember.displayName,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: OutlinedButton(
                  onPressed: () {
                    onPress!();
                    showDialog(
                        context: context,
                        builder: (context) => StatusDialogMinView());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.edit_outlined,
                        color: headerColor,
                      ),
                    ),
                  ),
                ),
              ),
              DropDownItem(
                text: 'Clear Status',
              ),
              DropDownItem(
                text: 'Set yourself as Away',
              ),
              DropDownItem(
                text: 'Pause Notificatons',
              ),
              Divider(),
              DropDownItem(
                onTap: () {
                  onPress!();
                  showDialog(
                      context: context,
                      builder: (context) => ProfileEditView());
                },
                text: 'Edit Profile',
              ),
              DropDownItem(
                onTap: () {
                  onPress!();
                  // model.goToViewProfile();
                },
                text: 'View Profile',
              ),
              DropDownItem(
                onTap: () {
                  onPress!();
                  showDialog(
                      context: context, builder: (context) => PreferenceView());
                },
                text: 'Preferences',
              ),
              Divider(),
              DropDownItem(
                text: 'Sign out of Zuri',
                onTap: () {
                  onPress!();
                  model.signOut();
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class DropDownItem extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final void Function()? onTap;

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
                  child: Expanded(
                    child: Row(
                      children: <Widget>[
                        Text(
                          text,
                          style: model.isHover ? subtitlec2 : subtitle2,
                        ),
                        Spacer(),
                        Icon(
                          iconData,
                          color:
                              model.isHover ? kcBackgroundColor2 : headerColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}

class ProfilePicture extends StatelessWidget {
  final bool isActive = false;
  final String displayName;
  final String? img;
  final User user;
  final Member member;
  ProfilePicture({
    Key? key,
    required this.displayName,
    this.img,
    required this.user,
    required this.member,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(children: [
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color: kcDisplayChannelColor3,
            ),
          ),
          child: Image.asset(
            'assets/images/profile_placeholder.png',
            // '${img!.isEmpty ? 'assets/images/profile_placeholder.png' : img}',
            fit: BoxFit.fill,
          ),
        ),
        horizontalSpaceRegular,
        Container(
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${displayName.isEmpty  ? 'Anonymous' : displayName}',
                // '${member.displayName.isEmpty ? 'Anonymous' : member.displayName}',
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
                        color:
                            isActive ? createChannelTextColor : kcSuccessColor),
                  ),
                  horizontalSpaceTiny,
                  Text(
                    '${user.status == 0 ? 'Away' : 'Online'}',
                    style: preferenceStyleNormal,
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
