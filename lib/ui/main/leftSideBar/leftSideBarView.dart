// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

import 'leftSideBarViewModel.dart';

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
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
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
                            verticalSpaceRegular,
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
                            verticalSpaceLarge,
                          ],
                        ),
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
