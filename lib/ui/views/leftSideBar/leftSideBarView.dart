// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/views/leftSideBar/leftSideBarViewModel.dart';
import 'package:zc_desktop_flutter/ui/views/message/message_view.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftSideBarView extends StatelessWidget {
  const LeftSideBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LeftSideBarViewModel>.reactive(
        viewModelBuilder: () => LeftSideBarViewModel(),
        builder: (context, model, child) {
          return Container(
            width: model.leftSideBarWidth,
            height: model.leftSideBarHeight,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/icons/zuri_logo_only.svg',
                              width: 36.w,
                              height: 36.h,
                            ),
                          ),
                          horizontalSpaceSmall,
                          ZcdeskText.leftSideBarLogoText("Z U R I"),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: SvgPicture.asset(
                            'assets/icons/edit.svg',
                            width: 32.w,
                            height: 32.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceRegular,
                  Expanded(
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.insight,
                            icon: AssetImage(model.insightUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.threads,
                            icon: AssetImage(model.threadsUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.allDms,
                            icon: AssetImage(model.allDmsUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.draft,
                            icon: AssetImage(model.draftUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.files,
                            icon: AssetImage(model.filesUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.integrate,
                            icon: AssetImage(model.integrateUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.toDo,
                            icon: AssetImage(model.toDoUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          ZcdeskReusableDropDownMenu(
                            dropDownMainTitle: 'Channels',
                            child: model.channelsDropDown!.isEmpty
                                ? Container()
                                : model.channelsDropDown!.first,
                            onDropDownTapped: () {
                              if (model.isChannelsDropDownMenuOpen) {
                                model.channelsDropDown!.removeAt(0);
                              } else {
                                model.channelsDropDown = <Widget>[
                                  Container(
                                    child: Column(
                                      children: List.generate(
                                        5,
                                        (index) => GestureDetector(
                                          onTap: () {
                                            print("channel item $index tapped");
                                          },
                                          child: Container(
                                            padding:
                                                EdgeInsets.only(left: 20.0),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(vertical: 16.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: SvgPicture.asset(SVGAssetPaths.channelsListIcon),
                                                  ),
                                                  horizontalSpaceSmall,
                                                  ZcdeskText
                                                      .dropDownBodyTextStyle(
                                                          "announcements"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ];
                              }
                              model.openChannelsDropDownMenu();
                            },
                            isDropDownOpen: model.isChannelsDropDownMenuOpen,
                            onTrailingIconTapped: () {},
                          ),
                          verticalSpaceMedium,
                          ZcdeskReusableDropDownMenu(
                            dropDownMainTitle: 'Direct Messages',
                            child: model.dMsDropDown!.isEmpty
                                ? Container()
                                : model.dMsDropDown!.first,
                            onDropDownTapped: () {
                              if (model.isDMsDropDownMenuOpen) {
                                model.dMsDropDown!.removeAt(0);
                              } else {
                                model.dMsDropDown = <Widget>[
                                  Container(
                                    child: Column(
                                      children: List.generate(
                                        5,
                                        (index) => GestureDetector(
                                          onTap: () {
                                            print("dm item $index tapped");
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(left: 20.0),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(vertical: 16.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage: AssetImage('assets/images/mark.jpg'),
                                                    radius: 18.r,
                                                  ),
                                                  horizontalSpaceRegular,
                                                  ZcdeskText.dropDownBodyTextStyle("John Doe"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ];
                              }
                              model.openDMsDropDownMenu();
                            },
                            isDropDownOpen: model.isDMsDropDownMenuOpen,
                            onTrailingIconTapped: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

/*
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/views/leftSideBar/leftSideBarViewModel.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftSideBarView extends StatelessWidget {
  const LeftSideBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return ViewModelBuilder<LeftSideBarViewModel>.reactive(
        viewModelBuilder: () => LeftSideBarViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/zc_logo2.png'),
                    GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/images/edit.svg',
                        )),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Container(
                      decoration: BoxDecoration(color: whiteColor),
                      width: model.leftSideBarWidth,
                      height: model.leftSideBarHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.insight,
                            icon: AssetImage(model.insightUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.threads,
                            icon: AssetImage(model.threadsUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.allDms,
                            icon: AssetImage(model.allDmsUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.draft,
                            icon: AssetImage(model.draftUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.files,
                            icon: AssetImage(model.filesUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.integrate,
                            icon: AssetImage(model.integrateUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.toDo,
                            icon: AssetImage(model.toDoUrl),
                            onTap: () {},
                          ),
                          verticalSpaceMedium,
                          Expanded(
                            child: Column(
                              children: [
                                Builder(
                                  builder: (context) =>
                                      ZcdeskReusableDropDownMenu(
                                    layerLink: model.channelsLayerLink,
                                    dropDownMainTitle: 'Channels',
                                    onDropDownTapped: () {
                                      if (model.isChannelsDropDownMenuOpen) {
                                        model.channelsDropDownMenu.remove();
                                      } else {
                                        model.channelsDropDownMenu =
                                            ZcdeskReusableDropDownMenu
                                                .createDropDown(
                                          layerLink: model.channelsLayerLink,
                                          listItemIcon: Icons.add,
                                          listItemCount: 3,
                                          itemBackGroundColor: Colors.white,
                                          listItemText: 'announcements',
                                          onItemTapped: () {},
                                          context: context,
                                        );
                                        Overlay.of(context)!
                                            .insert(model.channelsDropDownMenu);
                                      }
                                      model.openChannelsDropDownMenu();
                                    },
                                    isDropDownOpen:
                                        model.isChannelsDropDownMenuOpen,
                                    backGroundColor: Colors.white,
                                    onTrailingIconTapped: () {},
                                  ),
                                ),
                                verticalSpaceMedium,
                                Builder(
                                  builder: (context) =>
                                      ZcdeskReusableDropDownMenu(
                                    layerLink: model.dMsLayerLink,
                                    dropDownMainTitle: 'DMs',
                                    onDropDownTapped: () {
                                      if (model.isDMsDropDownMenuOpen) {
                                        model.dMsDropDownMenu.remove();
                                      } else {
                                        model.dMsDropDownMenu =
                                            ZcdeskReusableDropDownMenu
                                                .createDropDown(
                                          layerLink: model.dMsLayerLink,
                                          listItemIcon: Icons.add,
                                          listItemCount: 3,
                                          itemBackGroundColor: Colors.white,
                                          listItemText: 'John Doe',
                                          onItemTapped: () {},
                                          context: context,
                                        );
                                        Overlay.of(context)!
                                            .insert(model.dMsDropDownMenu);
                                      }
                                      model.openDMsDropDownMenu();
                                    },
                                    isDropDownOpen: model.isDMsDropDownMenuOpen,
                                    backGroundColor: Colors.white,
                                    onTrailingIconTapped: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
*/
