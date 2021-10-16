import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_title.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_list/channels_list_viewmodel.dart';

class ChannelsListView extends StatelessWidget {
  const ChannelsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();

    return ViewModelBuilder<ChannelsListViewModel>.reactive(
      onModelReady: (model) => model.performGetChannel(),
      builder: (context, model, child) => Container(
        color: whiteColor,
        child: model.isBusy
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
          : Padding(
          padding: EdgeInsets.only(
            left: 15.0.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DetailedCustomAppBar(
                // margin: EdgeInsets.only(left: 1.0.w),
                leading: WorkSpaceTitle(
                  channelTitle: 'Channel Browser',
                ),
              ),
              verticalSpaceRegular,
              Expanded(
                flex: 14,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  height: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          // Text('${model.channels.length == 0 ? '0' : model.channels.length} ${channelText3}', style: searchChannelHeaderStyle,),
                          Text('${model.channels.length} ${channelText3}', style: searchChannelHeaderStyle,),
                          Spacer(),
                          Text(''),
                          // Row(children: <Widget>[
                          //   InkWell(
                          //     onTap: () {},
                          //     child: Row(
                          //       children: [
                          //         SvgPicture.asset(
                          //           SVGAssetPaths.sortIcon,
                          //           color: kcDisplayChannelColor,
                          //         ),
                          //         horizontalSpaceSmall,
                          //         Text(channelText4, style: searchChannelHeaderStyle,),
                          //       ],
                          //     ),
                          //   ),
                          //   horizontalSpaceMedium,
                          //   InkWell(
                          //     onTap: () {},
                          //     child: Row(
                          //       children: [
                          //         SvgPicture.asset(
                          //           SVGAssetPaths.filterDown,
                          //           color: kcDisplayChannelColor,
                          //         ),
                          //         horizontalSpaceSmall,
                          //         // ZcdeskText.searchChannelHeaderStyle(
                          //         //     channelText5),
                          //         Text(channelText5, style: searchChannelHeaderStyle,)
                          //       ],
                          //     ),
                          //   ),
                          // ]),
                        ],
                      ),
                      verticalSpaceSmall,
                      Expanded(
                        child: ListView.builder(
                            controller: _scrollController,
                            itemCount: model.channels.length,
                            // itemCount: model.channelsList!.length,
                            itemBuilder: (context, index) {
                              return ChannelsDisplayList(
                                  index: index,
                                  viewPressed: (index) {
                                    model.goToChannelsView(index: index);
                                  },
                                  // visibleJoined:
                                  //     model.sidebarItems.keys.toList()[index] ==
                                  //             'Annoucements'
                                  //         ? false
                                  //         : true,
                                  visibleJoined: false,
                                  paddingBottom2: 6.0.h,
                                  paddingall: 7.0,
                                  paddingBottom3: 2.5.h,

                                  channelText6: model.channels[index].name,
                                  channelText7: channelText7,

                                  channelText8: model.channels[index].member,
                                  channelText9: channelText9,
                                  channelText10: channelText10,
                                  channelText11: channelText11,
                                  paddingBottom4: 3.0.h,
                                  isChannelHover:
                                      (model.isChannelHover == false ||
                                              model.selectedind != index)
                                          ? whiteColor
                                          : kcBackgroundColor1,
                                  visibleButton:
                                      (model.isChannelHover == false ||
                                              model.selectedind != index)
                                          ? false
                                          : true,
                                  hoverFunction: (val) {
                                    model.setIsChannelHover();
                                    model.setIsselectedind(index);
                                  });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //   ],
      // ),
      viewModelBuilder: () => ChannelsListViewModel(),
    );
  }
}

class ChannelsDisplayList extends StatelessWidget {
  final double paddingBottom2;
  final double paddingBottom3;
  final String channelText6;
  final String channelText7;
  final int channelText8;
  final String channelText9;
  final String channelText10;
  final String channelText11;
  final double paddingall;
  final double paddingBottom4;
  final Color isChannelHover;
  final bool visibleButton;
  final Function(bool) hoverFunction;
  final int index;
  final void Function(int index)? viewPressed;
  final bool visibleJoined;

  ChannelsDisplayList({
    required this.paddingBottom2,
    required this.paddingBottom3,
    required this.channelText6,
    required this.channelText7,
    required this.channelText8,
    required this.channelText9,
    required this.channelText10,
    required this.channelText11,
    required this.paddingall,
    required this.paddingBottom4,
    required this.isChannelHover,
    required this.hoverFunction,
    required this.visibleButton,
    required this.index,
    required this.visibleJoined,
    required this.viewPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom2),
      child: InkWell(
        autofocus: true,
        onHover: hoverFunction,
        onTap: () {},
        child: Container(
          width: _size.width * .7,
          height: (_size.height * .1).h,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: _size.width * .0009,
                color: kcDisplayChannelColor2,
              ),
            ),
            color: isChannelHover,
          ),
          child: Padding(
            padding: EdgeInsets.all(paddingall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          height: _size.height * .02,
                          child: SvgPicture.asset(
                            ChannelsListSvg,
                            color: createChannelHeaderColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: paddingBottom3),
                          // child: ZcdeskText.displayChannelSmallHeaderBlackStyle(
                          //   channelText6,
                          child: Text(channelText6, style: displayChannelSmallHeaderBlackStyle,),
                        ),
                      ],
                    ),
                    verticalSpaceTinyThree,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: visibleJoined,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    ActiveSvg,
                                    color: kcPrimaryColor,
                                  ),
                                  // ZcdeskText.searchChannelHeaderGreenStyle(
                                  //     channelText7),
                                  Text(channelText7, style: searchChannelHeaderGreenStyle,),
                                  horizontalSpaceSmall,
                                ],
                              ),
                            ),
                            // ZcdeskText.searchChannelHeaderStyle(channelText8),
                            Text('${channelText8}', style: searchChannelHeaderStyle,),
                            // ZcdeskText.searchChannelHeaderStyle(channelText9),
                            Text(channelText9, style: searchChannelHeaderStyle,),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Visibility(
                  visible: visibleButton,
                  child: Row(children: <Widget>[
                    Container(
                      height: 35.h,
                      width: 65.w,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: kcBorderColor,
                            ),
                            bottom: BorderSide(
                              color: kcBorderColor,
                            ),
                            left: BorderSide(
                              color: kcBorderColor,
                            ),
                            right: BorderSide(
                              color: kcBorderColor,
                            ),
                          ),
                          color: kcViewColor,
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                              mouseCursor: MaterialStateMouseCursor.clickable,
                              backgroundColor: MaterialStateProperty.all(
                                kcBackgroundColor1,
                              )),
                          onPressed: () => viewPressed!(index),
                          // child: !model.isBusy
                          //     ? Text(
                          //        'Join',
                          //         style: authBtnChannelStyle,
                          //       )
                          //     : CircularProgressIndicator(
                          //         color: whiteColor,
                          //       ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: paddingBottom4,
                            ),
                            child: Text(
                              channelText10,
                              style: authBtnChannelDisplayBlackStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // horizontalSpaceRegular,
                    // Container(
                    //   height: 35.h,
                    //   width: 65.w,
                    //   child: TextButton(
                    //     style: ButtonStyle(
                    //         mouseCursor: MaterialStateMouseCursor.clickable,
                    //         backgroundColor: MaterialStateProperty.all(
                    //           kcPrimaryColor,
                    //         )),
                    //     onPressed: () async {
                    //       // await model.validateAndCreateChannel();
                    //     },
                    //     // child: !model.isBusy
                    //     //     ? Text(
                    //     //        'Join',
                    //     //         style: authBtnChannelStyle,
                    //     //       )
                    //     //     : CircularProgressIndicator(
                    //     //         color: whiteColor,
                    //     //       ),
                    //     child: Padding(
                    //       padding: EdgeInsets.only(bottom: 3.0.h),
                    //       child: Text(
                    //         channelText11,
                    //         style: authBtnChannelDisplayStyle,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    horizontalSpaceTiny,
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
