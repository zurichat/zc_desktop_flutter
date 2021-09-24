import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/main/channels_display/channels_display_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_title.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesck_search_input_field.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

class ChannelsDisplayView extends StatelessWidget {
  const ChannelsDisplayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _auth = locator<AuthService>();
    Size _size = MediaQuery.of(context).size;
    final _scrollController = ScrollController();
    int selectedIndex;

    return ViewModelBuilder<ChannelsDisplayViewModel>.reactive(
      onModelReady: (model) async => await model.fetchAndSetUserData(),
      builder: (context, model, child) => Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DetailedCustomAppBar(
            margin: EdgeInsets.only(left: 2.0.w),
            leading: WorkSpaceTitle(
              channelTitle: "Announcements",
            ),
          ),
          /////////////////////////////////////////
          Padding(
            padding: EdgeInsets.only(
              top: 12.0,
              bottom: 18.0,
            ),
            child: Container(
              child: ChannelSearchInputField(
                onChanged: (value) {
                  // model.setchannelName(value);
                },
                borderColor:
                    model.searchChannel == '' ? bodyColor : kcPrimaryColor,
                borderFocusColor: model.searchChannel == ''
                    ? leftNavBarColor
                    : kcPrimaryColor,
                // errorText: model.searchChannel,
                keyboardType: TextInputType.name,
                hintPlaceHolder: model.channelText2,
              ),
            ),
          ),
          verticalSpaceSmall,
          Expanded(
            flex: 14,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              height: double.infinity,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ZcdeskText.searchChannelHeaderStyle(model.channelText3),
                      Spacer(),
                      Row(children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                SVGAssetPaths.sortIcon,
                                color: kcDisplayChannelColor,
                              ),
                              horizontalSpaceSmall,
                              ZcdeskText.searchChannelHeaderStyle(
                                  model.channelText4),
                            ],
                          ),
                        ),
                        horizontalSpaceMedium,
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                SVGAssetPaths.filterDown,
                                color: kcDisplayChannelColor,
                              ),
                              horizontalSpaceSmall,
                              ZcdeskText.searchChannelHeaderStyle(
                                  model.channelText5),
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                  verticalSpaceSmall,
                  Expanded(
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: model.sidebarItems.length,
                        itemBuilder: (context, index) {
                          return ChannelsDisplayList(
                              visibleJoined:
                                  model.sidebarItems.keys.toList()[index] ==
                                          'Annoucements'
                                      ? false
                                      : true,
                              paddingBottom2: model.paddingBottom2,
                              paddingall: model.paddingall,
                              paddingBottom3: model.paddingBottom3,
                              channelText6:
                                  model.sidebarItems.keys.toList()[index],
                              channelText7: model.channelText7,
                              channelText8:
                                  model.sidebarItems.values.toList()[index],
                              channelText9: model.channelText9,
                              channelText10: model.channelText10,
                              channelText11: model.channelText11,
                              paddingBottom4: model.paddingBottom4,
                              isChannelHover: (model.isChannelHover == false ||
                                      model.selectedind != index)
                                  ? whiteColor
                                  : kcBackgroundColor1,
                              visibleButton: (model.isChannelHover == false ||
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
      )
          //   ],
          // ),
          ),
      viewModelBuilder: () => ChannelsDisplayViewModel(),
    );
  }
}

class ChannelsDisplayList extends StatelessWidget {
  final double paddingBottom2;
  final double paddingBottom3;
  final String channelText6;
  final String channelText7;
  final String channelText8;
  final String channelText9;
  final String channelText10;
  final String channelText11;
  final double paddingall;
  final double paddingBottom4;
  final Color isChannelHover;
  final bool visibleButton;
  final Function(bool) hoverFunction;
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
    required this.visibleJoined,
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
          height: _size.height * .095,
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
                            SVGAssetPaths.channelsListIcon,
                            color: createChannelHeaderColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: paddingBottom3),
                          child: ZcdeskText.displayChannelSmallHeaderBlackStyle(
                            channelText6,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceTiny,
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
                                    SVGAssetPaths.activeIcon,
                                    color: kcPrimaryColor,
                                  ),
                                  ZcdeskText.searchChannelHeaderGreenStyle(
                                      channelText7),
                                  horizontalSpaceSmall,
                                ],
                              ),
                            ),
                            ZcdeskText.searchChannelHeaderStyle(channelText8),
                            ZcdeskText.searchChannelHeaderStyle(channelText9),
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
                      height: 40.h,
                      width: 70.w,
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
                          onPressed: () async {
                            // await model.validateAndCreateChannel();
                          },
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
                    horizontalSpaceRegular,
                    Container(
                      height: 40.h,
                      width: 70.w,
                      child: TextButton(
                        style: ButtonStyle(
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            backgroundColor: MaterialStateProperty.all(
                              kcPrimaryColor,
                            )),
                        onPressed: () async {
                          // await model.validateAndCreateChannel();
                        },
                        // child: !model.isBusy
                        //     ? Text(
                        //        'Join',
                        //         style: authBtnChannelStyle,
                        //       )
                        //     : CircularProgressIndicator(
                        //         color: whiteColor,
                        //       ),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3.0),
                          child: Text(
                            channelText11,
                            style: authBtnChannelDisplayStyle,
                          ),
                        ),
                      ),
                    ),
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
