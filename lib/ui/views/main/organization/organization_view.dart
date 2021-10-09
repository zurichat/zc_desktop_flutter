import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/new_message_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/work_space_setting.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/base_connectivity_check/base_connectvity_check.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_channel/create_channel_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/organization/organization_viewmodel.dart';

class OrganizationView extends StatelessWidget {
  const OrganizationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrganizationViewModel>.reactive(
      onModelReady: (model) {
        model.setup();
      },
      builder: (context, model, child) => BaseConnectivityCheck(
        child: Scaffold(
          backgroundColor: whiteColor,
          body: OrganizationWrapper(
            model,
            centerChild: Expanded(
              child: ExtendedNavigator(
                navigatorKey: StackedService.nestedNavigationKey(1),
                router: OrganizationViewRouter(),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => OrganizationViewModel(),
    );
  }
}

class OrganizationWrapper extends StatelessWidget {
  final OrganizationViewModel? model;
  final Widget? centerChild;

  OrganizationWrapper(this.model, {Key? key, this.centerChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Add reload workspace button on data not loaded
    return Container(
      child: Column(
        children: [
          model!.isBusy
              ? Expanded(
                  child: Center(
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0.r,
                        valueColor: AlwaysStoppedAnimation(Colors.grey),
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: Row(
                    children: [
                      //TODO: organization side bar
                      Container(
                        color: whiteColor,
                        width: 60.w,
                        height: double.infinity,
                        child: SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: model!.organization.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        model!.reloadWithSelectedOrganization(
                                            index);
                                      },
                                      child: OrganizationItem(
                                        organization:
                                            model!.organization[index],
                                        selected: model!.selectedOrg(index),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              verticalSpaceSmall,
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    model!.goToCreateWorkspace();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 30,
                                  ),
                                ),
                              ),
                              verticalSpaceMedium,
                            ],
                          ),
                        ),
                      ),
                      //TODO: Left side bar
                      Container(
                        color: whiteColor,
                        width: 260.w,
                        height: double.infinity,
                        child: Column(
                          children: [
                            DetailedCustomAppBar(
                              leading: WorkSpaceSetting(
                                workspaceTitle: model!.currentOrganization.name,
                              ),
                              trailing: Flexible(child: NewMessageBtn()),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                controller: model!.controller,
                                physics: ScrollPhysics(),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ListView(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        children: [
                                          DisplayMenu(model!),
                                          verticalSpaceRegular,
                                          ReusableDropDown(
                                            title: 'Channels',
                                            addButtonTitle: 'Add channels',
                                            toggleTap: () {
                                              model!.openChannelsDropDownMenu();
                                            },
                                            show: model!.showChannels,
                                            addTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    CreateChannelView(),
                                              );
                                            },
                                            showChannelListDisplay: () {
                                              model!.openChannelsList();
                                            },
                                            listItemCount:
                                                model!.channels.length,
                                            onListItemTapped: (index) {
                                              model!.goToChannelsView(
                                                  index: index);
                                            },
                                            itemChild: (index) {
                                              return ChannelItem(
                                                channelName:
                                                    model!.channels[index].name,
                                                selected: model!
                                                    .selectedChannel(index),
                                              );
                                            },
                                          ),
                                          verticalSpaceRegular,
                                          ReusableDropDown(
                                            title: 'Direct Messages',
                                            addButtonTitle: 'Add teammates',
                                            show: model!.showDMs,
                                            toggleTap: () {
                                              model!.openDMsDropDownMenu();
                                            },
                                            showChannelListDisplay: () {},
                                            addTap: () {},
                                            listItemCount: model!.dms.length,
                                            onListItemTapped: (index) {
                                              model!.goToDmView(index);
                                            },
                                            itemChild: (index) {
                                              return DMItem(
                                                userName: model!.dms
                                                    .elementAt(index)
                                                    .userProfile
                                                    .displayName,
                                                userIcon:
                                                    'assets/icons/users.svg',
                                                selected: false,
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
                      ),
                      //TODO: Center Area
                      centerChild!,
                      //TODO: Reusable view for channel and dms
                      // ChannelDmView(channel: true, dm: false),
                    ],
                  ),
                ),
        ],
      ),
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
            onTap: () {},
          ),
          ReusableMenuItem(
            iconPath: 'assets/icons/alldms.svg',
            text: 'All DMs',
            onTap: () {
              model.goToAllDmView();
            },
          ),
          ReusableMenuItem(
            iconPath: 'assets/icons/drafts.svg',
            text: 'Draft',
            onTap: () {},
          ),
          ReusableMenuItem(
            iconPath: 'assets/icons/ribbon.svg',
            text: 'Saved Items',
            onTap: () {
              model.goToSavedItems();
            },
          ),
          ReusableMenuItem(
            iconPath: 'assets/icons/files.svg',
            text: 'Files',
            onTap: () {},
          ),
          ReusableMenuItem(
              iconPath: 'assets/icons/plugins.svg',
              text: 'People and User Groups',
              onTap: model.goToUserPeopleGroup),
          ReusableMenuItem(
            iconPath: 'assets/icons/plugins.svg',
            text: 'Plugins',
            onTap: () {},
          ),
        ],
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
                            bottom: 16.0,
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

class ReusableMenuItem extends StatelessWidget {
  final String? iconPath;
  final String? text;
  final GestureTapCallback? onTap;

  const ReusableMenuItem({
    Key? key,
    this.iconPath,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 30,
          child: Row(
            children: [
              Container(
                height: 30,
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  child: SvgPicture.asset(iconPath!),
                ),
              ),
              SizedBox(width: 10),
              Container(
                child: Text(text!, style: kLeftSideBarStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrganizationItem extends StatelessWidget {
  final int? index;
  final bool? selected;
  final Organization? organization;
  final void Function()? onTap;
  final bool? hover;
  final void Function(PointerHoverEvent)? onHover;
  final void Function(PointerExitEvent)? onExit;

  OrganizationItem(
      {this.index,
      this.selected,
      this.organization,
      this.onTap,
      this.hover,
      this.onHover,
      this.onExit});

  /*void selected(bool value) => setState(() => _selected = value);*/

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              MouseRegion(
                onHover: onHover,
                onExit: onExit,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: selected!
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.white,
                      width: 3,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: Container(
                      width: 38.0,
                      height: 38.0,
                      child:
                          SvgPicture.asset('assets/icons/zuri_logo_only.svg'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
                    color: Colors.black),
          ),
          horizontalSpaceSmall,
          Text(
            channelName!,
            style: dropDownBodyTextStyle.copyWith(
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
              child: SvgPicture.asset(userIcon!),
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
