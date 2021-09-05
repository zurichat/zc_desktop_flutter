// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/views/leftSideBar/leftSideBarViewModel.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zcdesk_ui/src/widgets/zcdesk_drop_down_menu.dart';

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
                          ZcdeskReusableDropDownMenu(
                            menuKey: model.channelsMenuKey,
                            dropDownMainTitle: 'Chan',
                            onDropDownTapped: () {
                              RenderBox? renderBox = model.channelsMenuKey.currentContext!.findRenderObject() as RenderBox?;
                              Size? boxSize = renderBox!.size;
                              Offset? boxPosition = renderBox.localToGlobal(Offset.zero);

                              if (model.isChannelsDropDownMenuOpen) {
                                model.channelsDropDownMenu.remove();
                              } else {
                                model.channelsDropDownMenu = createDropDown(
                                  listItemIcon: Icons.add,
                                  listItemCount: 3,
                                  itemBackGroundColor: Colors.white,
                                  boxSize: boxSize,
                                  boxPosition: boxPosition,
                                  renderBox: renderBox,
                                  listItemText: 'announcements',
                                  onItemTapped: () {},
                                );
                                Overlay.of(context)!.insert(model.channelsDropDownMenu);
                              }
                              model.openChannelsDropDownMenu();
                            },
                            isDropDownOpen: model.isChannelsDropDownMenuOpen,
                            backGroundColor: Colors.white,
                            onTrailingIconTapped: () {},
                          ),
                          verticalSpaceMedium,
                          ZcdeskReusableDropDownMenu(
                            menuKey: model.dMsMenuKey,
                            dropDownMainTitle: 'DMs',
                            onDropDownTapped: () {
                              RenderBox? renderBox = model.dMsMenuKey.currentContext!.findRenderObject() as RenderBox?;
                              Size? boxSize = renderBox!.size;
                              Offset? boxPosition = renderBox.localToGlobal(Offset.zero);

                              if (model.isDMsDropDownMenuOpen) {
                                model.dMsDropDownMenu.remove();
                              } else {
                                model.dMsDropDownMenu = createDropDown(
                                  listItemIcon: Icons.add,
                                  listItemCount: 3,
                                  itemBackGroundColor: Colors.white,
                                  boxSize: boxSize,
                                  boxPosition: boxPosition,
                                  renderBox: renderBox,
                                  listItemText: 'John Doe',
                                  onItemTapped: () {},
                                );
                                Overlay.of(context)!.insert(model.dMsDropDownMenu);
                              }
                              model.openDMsDropDownMenu();
                            },
                            isDropDownOpen: model.isDMsDropDownMenuOpen,
                            backGroundColor: Colors.white,
                            onTrailingIconTapped: () {},
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
