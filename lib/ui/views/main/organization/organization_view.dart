import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/new_message_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/work_space_setting.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/channel_dm/channel_dm_view.dart';
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
      builder: (context, model, child) => Scaffold(
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
                  child: Container(
                    height: fullHeight(context),
                    width: fullHeight(context),
                    child: Center(
                      child: Container(
                        width: 24.0,
                        height: 24.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.0.r,
                          valueColor: AlwaysStoppedAnimation(Colors.grey),
                        ),
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: Row(
                    children: [
                      //TODO: organization side bar
                      Container(
                        color: Theme.of(context).accentColor,
                        width: 70.w,
                        height: double.infinity,
                        child: SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: model!.organization!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        print("Workspace $index tapped");
                                        model!.reloadWithSelectedOrganization(
                                            index);
                                      },
                                      child: OrganizationItem(
                                        organization:
                                            model!.organization![index],
                                        selected: model!.showSelectedOrg(index),
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
                                    color: Colors.white,
                                    size: 20,
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
                        color: Theme.of(context).accentColor,
                        width: 260.w,
                        height: double.infinity,
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                controller: model!.controller,
                                physics: ScrollPhysics(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: [
                                        DetailedCustomAppBar(
                                          leading: WorkSpaceSetting(
                                            workspaceTitle: model!
                                                    .currentOrganization!
                                                    .name ??
                                                '',
                                          ),
                                          // trailing: NewMessageBtn(),
                                        ),
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
                                              model!.channels!.length,
                                          onListItemTapped: (index) {
                                            model!
                                                .goToChannelsView(index: index);
                                          },
                                          itemChild: (index) {
                                            return ChannelItem(
                                              channelName:
                                                  model!.channels![index].name,
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
                                          listItemCount: 3,
                                          onListItemTapped: (index) {},
                                          itemChild: (index) {
                                            return DMItem(
                                              userName: 'John snow',
                                              userIcon: '',
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
                          ],
                        ),
                      ),
                      //TODO: Center Area
                      // centerChild!,
                      ChannelDmView(channel: true, dm: false,),
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
            onTap: () {},
          ),
          ReusableMenuItem(
            iconPath: 'assets/icons/drafts.svg',
            text: 'Draft',
            onTap: () {},
          ),
          ReusableMenuItem(
            iconPath: 'assets/icons/files.svg',
            text: 'Files',
            onTap: () {},
          ),
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
                        child: SvgPicture.asset(SVGAssetPaths.dropDownOpenIcon),
                      )
                    : Container(
                        height: 8,
                        width: 8,
                        child:
                            SvgPicture.asset(SVGAssetPaths.dropDownClosedIcon),
                      ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(title, style: kLeftSideBarStyle),
                  ),
                  Spacer(),
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
        verticalSpaceSmall,
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
                              "assets/icons/add_dm_channel.svg"),
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
                      color: Colors.black.withOpacity(0.2),
                      width: 3,
                    ),
                    /*border: Border.all(
                        color: selected!
                            ? Colors.white
                            : hover!
                                ? Colors.white.withOpacity(0.2)
                                : Colors.transparent,
                        width: 3),*/
                  ),
                  child: /*organization!.logoUrl!.isEmpty
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Text(
                              organization!.name!,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      : */
                      ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: Container(
                      width: 38.0,
                      height: 38.0,
                      child:
                          SvgPicture.asset("assets/icons/zuri_logo_only.svg"),
                    ),
                  ),
                ),
              ),
              if (selected!)
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ClipOval(
                      child: Container(
                        width: 12,
                        height: 12,
                        color: Color(0xFE1D2229),
                        padding: const EdgeInsets.all(3),
                        child: ClipOval(
                          child: Container(
                            width: 12,
                            height: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Container(
          child: Center(
            child: Wrap(
              children: [
                Text(
                  organization!.name!,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChannelItem extends StatelessWidget {
  final String? channelName;

  ChannelItem({Key? key, this.channelName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: SvgPicture.asset(SVGAssetPaths.channelsListIcon),
          ),
          horizontalSpaceSmall,
          ZcdeskText.dropDownBodyTextStyle(channelName!),
        ],
      ),
    );
  }
}

class DMItem extends StatelessWidget {
  final String? userIcon;
  final String? userName;

  DMItem({Key? key, this.userIcon, this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              child: SvgPicture.asset(userIcon!),
              radius: 18.r,
            ),
            horizontalSpaceRegular,
            ZcdeskText.dropDownBodyTextStyle(userName!),
          ],
        ),
      ),
    );
  }
}
