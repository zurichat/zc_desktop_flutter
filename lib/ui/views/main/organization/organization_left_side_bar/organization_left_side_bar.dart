import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/custom_color.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/new_message_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/work_space_setting.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'package:zc_desktop_flutter/ui/views/main/add_user_channel/add_user_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_channel/create_channel_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/organization/organization_viewmodel.dart';

class OrganizationLeftSideBar extends ViewModelWidget<OrganizationViewModel> {
  const OrganizationLeftSideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, OrganizationViewModel model) {
    return Container(
      color: whiteColor,
      width: 260.w,
      height: double.infinity,
      child: Column(
        children: [
          DetailedCustomAppBar(
            leading: WorkSpaceSetting(
              workspaceTitle: model.currentOrganization.name,
            ),
            trailing: Flexible(
              child: GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) => EditDialogContainer(
                            model: model,
                          )),
                  child: NewMessageBtn()),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: model.controller,
              physics: ScrollPhysics(),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        DisplayMenu(model),
                        verticalSpaceRegular,
                        ReusableDropDown(
                          title: 'Channels',
                          addButtonTitle: 'Add channels',
                          toggleTap: () {
                            model.openChannelsDropDownMenu();
                          },
                          show: model.showChannels,
                          addTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => CreateChannelView(),
                            );
                          },
                          showChannelListDisplay: () {
                            model.openChannelsList();
                          },
                          listItemCount: model.channels.length,
                          onListItemTapped: (index) {
                            model.goToChannelsView(index: index);
                          },
                          itemChild: (index) {
                            return ChannelItem(
                              channelName: model.channels[index].name,
                              selected: model.selectedChannel(index),
                            );
                          },
                        ),
                        verticalSpaceRegular,
                        ReusableDropDown(
                          title: 'Direct Messages',
                          addButtonTitle: 'Add teammates',
                          show: model.showDMs,
                          toggleTap: () {
                            model.openDMsDropDownMenu();
                          },
                          showChannelListDisplay: () {
                            model.goToAllDmView();
                          },
                          addTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AddUserView(),
                            );
                          },
                          listItemCount: model.dms.length,
                          onListItemTapped: (index) {
                            model.goToDmView(index);
                          },
                          itemChild: (index) {
                            return DMItem(
                              userName: model.dms
                                  .elementAt(index)
                                  .otherUserProfile
                                  .displayName,
                              userIcon: model.dms.elementAt(index).otherUserProfile.imageUrl,
                              selected: model.selectedDM(index),
                            );
                          },
                        ),
                        verticalSpaceRegular,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableMenuItem extends StatelessWidget {
  final String? iconPath;
  final String? text;
  final GestureTapCallback? onTap;
  final bool isSelected;

  const ReusableMenuItem({
    Key? key,
    this.iconPath,
    this.text,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              Container(
                height: 30,
                child: Container(
                    width: 18.0,
                    height: 18.0,
                    child: SvgPicture.asset(iconPath!,
                        color: isSelected ? kcPrimaryColor : headerColor)),
              ),
              SizedBox(width: 10),
              Container(
                child: Text(text!,
                    style: kLeftSideBarStyle.copyWith(
                        color: isSelected ? kcPrimaryColor : headerColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChannelItem extends StatelessWidget {
  final String? channelName;
  final bool? selected;

  ChannelItem({Key? key, this.channelName, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: selected!
                ? SvgPicture.asset(
                    SVGAssetPaths.channelsListIcon,
                    color: Theme.of(context).colorScheme.secondary,
                  )
                : SvgPicture.asset(SVGAssetPaths.channelsListIcon,
                    color: black),
          ),
          horizontalSpaceSmall,
          Text(
            channelName!,
            style: messageStyleNormal.copyWith(
              color: selected!
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class DMItem extends StatelessWidget {
  final String? userIcon;
  final String? userName;
  final bool? selected;

  DMItem({Key? key, this.userIcon, this.userName, this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 20.0,
              width: 20.0,
              child:GFAvatar(
                              backgroundColor: Colors.transparent,
                              foregroundColor: kcPrimaryLight,
                              shape: GFAvatarShape.standard,
                              backgroundImage: NetworkImage(userIcon!),
                            ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
            horizontalSpaceSmall,
            Text(
              userName!,
              style: dropDownBodyTextStyle.copyWith(
                color: selected!
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableDropDown extends StatelessWidget {
  final String title;
  final GestureTapCallback toggleTap;
  final bool show;
  final GestureTapCallback addTap;
  final String? addButtonTitle;
  final GestureTapCallback showChannelListDisplay;
  final int listItemCount;
  final void Function(int index)? onListItemTapped;
  final Widget? Function(int index)? itemChild;

  const ReusableDropDown({
    Key? key,
    required this.title,
    required this.toggleTap,
    required this.show,
    required this.addTap,
    required this.listItemCount,
    this.addButtonTitle,
    required this.showChannelListDisplay,
    this.onListItemTapped,
    this.itemChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: toggleTap,
              child: Container(
                child: show
                    ? Container(
                        height: 8,
                        width: 8,
                        child: SvgPicture.asset(
                          SVGAssetPaths.dropDownOpenIcon,
                        ),
                      )
                    : Container(
                        height: 8,
                        width: 8,
                        child: SvgPicture.asset(
                          SVGAssetPaths.dropDownClosedIcon,
                        ),
                      ),
              ),
            ),
            horizontalSpaceSmall,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(title, style: kLeftSideBarStyle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0.w),
                    child: InkWell(
                      onTap: showChannelListDisplay,
                      child: SvgPicture.asset(
                        AddSvg,
                        height: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (show)
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Column(
                    children: List.generate(listItemCount, (index) {
                      return MouseRegion(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20.0,
                          ),
                          child: InkWell(
                            onTap: () => onListItemTapped!(index),
                            child: itemChild!(index),
                          ),
                        ),
                      );
                    }),
                  ),
                  verticalSpaceTiny,
                  Row(
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      InkWell(
                        onTap: addTap,
                        child: Container(
                          height: 12,
                          width: 12,
                          child: SvgPicture.asset(
                              'assets/icons/add_dm_channel.svg'),
                        ),
                      ),
                      horizontalSpaceSmall,
                      Text(addButtonTitle!, style: kLeftSideBarStyle),
                      horizontalSpaceSmall,
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class DisplayMenu extends StatelessWidget {
  final OrganizationViewModel model;

  const DisplayMenu(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ReusableMenuItem(
            iconPath: 'assets/icons/threads.svg',
            text: 'Threads',
            isSelected: model.selectedMenuIndex == 0,
            onTap: () {
              model.goToThreadsView();
              model.updateSelectedMenuIndex(0);
            },
          ),
          ReusableMenuItem(
            iconPath: 'assets/icons/alldms.svg',
            text: 'All DMs',
            isSelected: model.selectedMenuIndex == 1,
            onTap: () {
              model.goToAllDmView();
              model.updateSelectedMenuIndex(1);
            },
          ),
          ReusableMenuItem(
            iconPath: 'assets/icons/drafts.svg',
            text: 'Draft',
            isSelected: model.selectedMenuIndex == 2,
            onTap: () {
              model.updateSelectedMenuIndex(2);
            },
          ),
          ReusableMenuItem(
            iconPath: 'assets/icons/ribbon.svg',
            text: 'Saved Items',
            isSelected: model.selectedMenuIndex == 3,
            onTap: () {
              model.goToSavedItems();
              model.updateSelectedMenuIndex(3);
            },
          ),
          ReusableMenuItem(
            iconPath: 'assets/icons/files.svg',
            isSelected: model.selectedMenuIndex == 4,
            text: 'Files',
            onTap: () {
              model.updateSelectedMenuIndex(4);
            },
          ),
          ReusableMenuItem(
              iconPath: 'assets/icons/pugroup.svg',
              isSelected: model.selectedMenuIndex == 5,
              text: 'People and User Groups',
              onTap: () {
                model.goToUserPeopleGroup();
                model.updateSelectedMenuIndex(5);
              }),
          ReusableMenuItem(
            iconPath: 'assets/icons/drafts.svg',
            text: 'Todo',
            isSelected: model.selectedMenuIndex == 6,
            onTap: () {
              model.goTodoView();
              model.updateSelectedMenuIndex(6);
            },
          ),
          ReusableMenuItem(
            iconPath: 'assets/icons/plugins.svg',
            text: 'Plugins',
            isSelected: model.selectedMenuIndex == 7,
            onTap: () {
              model.updateSelectedMenuIndex(7);
            },
          ),
        ],
      ),
    );
  }
}

class EditDialogContainer extends StatelessWidget {
  final OrganizationViewModel model;
  EditDialogContainer({Key? key, required this.model}) : super(key: key);
  final nameController = TextEditingController();
  final urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 450.h,
        width: 450.w,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Edit Organization',
                style: headline6,
              ),
              verticalSpaceSmall,
              ZuriDeskInputField(
                label: 'Organization Name',
                controller: nameController,
                hintPlaceHolder: model.currentOrganization.name,
              ),
              verticalSpaceSmall,
              ZuriDeskInputField(
                label: 'Orgnization Url',
                controller: urlController,
                hintPlaceHolder: model.currentOrganization.workspaceUrl,
              ),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthButton(
                  label: 'Save Changes',
                  isBusy: model.isBusy,
                  onTap: () => model
                      .updateOrganizationDetails(
                          url: urlController.text, name: nameController.text)
                      .then((value) => Navigator.of(context).pop()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
