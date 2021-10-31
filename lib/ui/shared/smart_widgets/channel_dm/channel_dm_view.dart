import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_members_widget.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_title.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zc_desk_send_message_field.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/channel_dm/channel_dm_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_details/channels_details_view.dart';

class ChannelDmView extends StatelessWidget {
  const ChannelDmView({
    Key? key,
    this.margin,
    this.color,
    this.leading = const SizedBox(),
    this.trailing = const SizedBox(),
    this.channel,
    this.dm,
  }) : super(key: key);

  final Widget leading;
  final Widget trailing;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final bool? channel;
  final bool? dm;

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();
    return ViewModelBuilder<ChannelDmViewModel>.reactive(
      onModelReady: (model) {
        model.setup();
      },
      builder: (context, model, child) => model.isBusy
          ? Expanded(
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
            )
          : Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    DetailedCustomAppBar(
                      color: kcPrimaryColor,
                      margin: EdgeInsets.only(left: 2.0.w),
                      leading: (channel == true)
                          ? WorkSpaceTitle(
                              channelTitle: model.currentChannel.name,
                            )
                          : Container(
                              width: 200.w,
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/pictureAvatar3.png')),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
                                    ),
                                    height: 40.h,
                                    width: 40.w,
                                  ),
                                  Text(
                                    '${model.currentChannel.name}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.sp,
                                      color: whiteColor,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: SvgPicture.asset(
                                        'assets/icons/vectordown_icon.svg'),
                                  ),
                                ],
                              ),
                            ),
                      trailing: (channel == true)
                          ? InkWell(
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (context) => ChannelsDetailsView()),
                              child: WorkSpaceMembers(
                                color: whiteColor,
                              ),
                            )
                          : SvgPicture.asset('assets/icons/Shape.svg'),
                    ),
                    Container(
                      height: 35.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kcCreateChannelHoverColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 36.0.w,
                          top: 3.0.h,
                          bottom: 3.0.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kcCreateChannelHoverColor1,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                          'assets/icons/bi_pin-angle-fill.svg'),
                                      Text(channelDm),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpaceTiny,
                            InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kcCreateChannelHoverColor1,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                          'assets/icons/carbon_add.svg'),
                                      Text(channelDm2),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    (channel == true)
                        ? Container(
                            height: 110.h,
                            decoration: BoxDecoration(
                              color: whiteColor,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 38.0),
                              child: Column(
                                children: <Widget>[
                                  verticalSpaceTiny,
                                  Row(
                                    children: [
                                      Text(
                                        channelDm3,
                                        style: messageTimeStyleNormal,
                                      ),
                                      Text(
                                        '${model.currentChannel.name}',
                                        style: messageTimeStyleNormal,
                                      ),
                                      Text(
                                        channelDm4,
                                        style: messageTimeStyleNormal,
                                      ),
                                    ],
                                  ),
                                  verticalSpaceTinyTwo,
                                  Row(
                                    children: [
                                      Text(
                                        '${model.currentChannel.name}',
                                        style: messageTimeStyleNormal,
                                      ),
                                      Text(
                                        channelDm5,
                                        style: messageTimeStyleNormal,
                                      ),
                                    ],
                                  ),
                                  verticalSpaceSmallOne,
                                  Row(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                            'assets/icons/add_member.svg'),
                                      ),
                                      Text(
                                        channelDm6,
                                        style: messageTimeStyleNormal,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Container(
                            color: kcBackgroundColor2,
                            child: Scrollbar(
                              controller: _rightSideBarController,
                              isAlwaysShown: true,
                              scrollbarOrientation: ScrollbarOrientation.right,
                              thickness: 10,
                              showTrackOnHover: true,
                              child: ListView(
                                physics: AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                controller: _rightSideBarController,
                                children: [
                                  (dm == true)
                                      ? Container(
                                          padding: EdgeInsets.only(left: 20.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  width: 40.w,
                                                  height: 55.h,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/dmConvo.png')),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  verticalSpaceTiny,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        channelDm7,
                                                        style:
                                                            messageTimeStyleNormal,
                                                      ),
                                                      Text(
                                                        '${model.currentChannel.name}',
                                                        style:
                                                            messageTimeStyleNormal,
                                                      ),
                                                      Text(
                                                        channelDm8,
                                                        style:
                                                            messageTimeStyleNormal,
                                                      ),
                                                    ],
                                                  ),
                                                  verticalSpaceTinyTwo,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        channelDm9,
                                                        style:
                                                            messageTimeStyleNormal,
                                                      ),
                                                      Text(
                                                        '${model.currentChannel.name}',
                                                        style:
                                                            messageTimeStyleNormal,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(),
                                  ListView.builder(
                                      itemCount: model.messages.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        if ((!model.isSameDate(index)) ||
                                            index == 0) {
                                          return Column(
                                            children: [
                                              DateWidget(
                                                  date: model.formatDate(model
                                                      .messages
                                                      .elementAt(index == 0
                                                          ? index
                                                          : index + 1)
                                                      .timestamp)),
                                              MessageTile(
                                                model: model,
                                                messageIndex: index,
                                                message: model.messages
                                                    .elementAt(index),
                                              ),
                                            ],
                                          );
                                        }
                                        return MessageTile(
                                          model: model,
                                          messageIndex: index,
                                          message:
                                              model.messages.elementAt(index),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SendMessageInputField(
                        sendMessage: (message) {
                          if (message.isNotEmpty) {
                            model.sendMessage(message);
                          }
                        },
                        placeHolder: '${model.currentChannel.name}',
                      ),
                    ),
                  ],
                ),
              ),
            ),
      viewModelBuilder: () => ChannelDmViewModel(),
    );
  }
}

Widget messageReplies(ChannelDmViewModel model) {
  return InkWell(
    onTap: () {},
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          constructRepliesHighLightAvatars(
              userDefaultImageUrl: 'assets/images/4.png'),
          constructRepliesHighLightAvatars(
              userDefaultImageUrl: 'assets/images/mark.jpg'),
          constructRepliesHighLightAvatars(
              userDefaultImageUrl: 'assets/images/7.png'),
          constructRepliesHighLightAvatars(
              userDefaultImageUrl: model.userDefaultImageUrl),
          horizontalSpaceTiny,
          //TODO: Get message time of last reply in a thread
          Text('${ChannelDmViewModel().numberOfReplies} ${messageReply}',
              style: TextStyle(color: kcSecondaryColor)),
          horizontalSpaceTiny,
          Text(messageReply2)
        ],
      ),
    ),
  );
}

Widget constructRepliesHighLightAvatars({
  required String userDefaultImageUrl,
  int? numberOfReplies,
}) {
  return InkWell(
    onTap: () {},
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.asset(
                userDefaultImageUrl,
                height: 27,
                width: 27,
              )),
          horizontalSpaceTiny,
        ],
      ),
    ),
  );
}

class MessageTile extends StatelessWidget {
  final ChannelMessage message;
  final int messageIndex;
  final ChannelDmViewModel model;

  MessageTile({
    required this.message,
    required this.messageIndex,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: MouseRegion(
        opaque: false,
        key: UniqueKey(),
        onHover: (event) {
          model.onMessageHovered(true, messageIndex);
        },
        onExit: (event) {
          model.onMessageHovered(false, messageIndex);
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                  color: model.onMessageTileHover &&
                          model.onMessageHoveredIndex == messageIndex
                      ? hoverColor
                      : Colors.transparent),
              color: kcBackgroundColor2,
              padding: EdgeInsets.fromLTRB(3, 2, 10, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(2.0),
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: lightIconColor),
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              model.getUser(message.user_id).displayName,
                              scale: 5),
                        )),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                //u will have to change this using real data
                                model
                                        .getUser(message.user_id)
                                        .displayName
                                        .isEmpty
                                    ? messageTile
                                    : model
                                        .getUser(message.user_id)
                                        .displayName,
                                style: kHeading1TextStyle.copyWith(
                                    fontSize: 15.sp),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                model.formatTime(message.timestamp),
                                style: subtitle3b.copyWith(color: timeColor),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: Text(message.content),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SameSenderMessageTile extends StatelessWidget {
  final ChannelDmViewModel model;
  final Results message;
  final int messageIndex;

  SameSenderMessageTile(
      {required this.message, required this.model, required this.messageIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          model.onMessageTileHover &&
                  model.onMessageHoveredIndex == messageIndex
              ? Text(
                  model.formatTime(message.created_at),
                  style: subtitle2.copyWith(color: timeColor),
                )
              : SizedBox(
                  width: 60.w,
                ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message.message),
                Padding(
                  padding: EdgeInsets.all(4),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 40,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 20),
                      shrinkWrap: true,
                      itemCount: message.reactions.length + 1,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == message.reactions.length) {
                          return Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: reactionBackground,
                                borderRadius: BorderRadius.circular(25.r),
                                border: Border.all(color: reactionBackground)),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(SVGAssetPaths.fluentEmoji),
                                Text('+')
                              ],
                            )),
                          );
                        } else {
                          return SizedBox();
                          /* return EmojiReaction(
                            onTap: () {
                              model.reactToMessage(messageIndex, index);
                            },
                            model: model,
                            isReacted: false,
                            emoji: '',
                            count: 0,
                          ); */
                        }
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  final String date;

  DateWidget({required this.date});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: kcBackgroundColor2,
            shape: BoxShape.rectangle,
            border: Border.all(color: timeColor),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                date,
                style: kHeading1TextStyle.copyWith(fontSize: 10.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              SvgPicture.asset(
                DropDownOpenSvg,
                height: 5.h,
                color: bodyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
