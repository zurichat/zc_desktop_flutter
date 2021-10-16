import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_members_widget.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_title.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zc_desk_send_message_field.dart';

import 'package:zc_desktop_flutter/ui/views/main/add_user_channel/add_user_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels/channels_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_details/channels_details_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/dm/dm_view.dart';

class ChannelsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();
    return ViewModelBuilder<ChannelsViewModel>.reactive(
      onModelReady: (model) {
        model.setup();
      },
      builder: (context, model, child) => model.isBusy
          ? Center(
              child: Container(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                  strokeWidth: 3.0.r,
                  valueColor: AlwaysStoppedAnimation(Colors.grey),
                ),
              ),
            )
          : Container(
              child: Column(
                children: [
                  DetailedCustomAppBar(
                    margin: EdgeInsets.only(left: 2.0.w),
                    leading: WorkSpaceTitle(
                      channelTitle: model.currentChannel.name,
                    ),
                    trailing: InkWell(
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) => ChannelsDetailsView()),
                        child: WorkSpaceMembers()),
                  ),
                  // Align(alignment: Alignment.topCenter, child: TopRowActions()),
                  Container(
                    height: 110.h,
                    decoration: BoxDecoration(
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 38.0),
                      child: Column(
                        children: <Widget>[
                          verticalSpaceTiny,
                          Row(
                            children: [
                              Text(
                                'This is the very beginning of the ',
                                style: messageTimeStyleNormal,
                              ),
                              Text(
                                '${model.currentChannel.name}',
                                style: messageTimeStyleNormal,
                              ),
                              Text(
                                ' channel',
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
                                ' created this channel on Aug 30th.',
                                style: messageTimeStyleNormal,
                              ),
                            ],
                          ),
                          verticalSpaceSmallOne,
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AddUserView(),
                                  );
                                },
                                child: SvgPicture.asset(
                                    'assets/icons/add_member.svg'),
                              ),
                              Text(
                                ' Add members',
                                style: messageTimeStyleNormal,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
                                  scrollbarOrientation:
                                      ScrollbarOrientation.right,
                                  thickness: 10,
                                  showTrackOnHover: true,
                                  child: ListView(
                                    physics: AlwaysScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    controller: _rightSideBarController,
                                    children: [
                                      ListView.builder(
                                          itemCount: model.messages.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            if ((!model.isSameDate(index)) ||
                                                index == 0) {
                                              return Column(
                                                children: [
                                                  DateWidget(
                                                      date: model.formatDate(
                                                          model
                                                              .messages
                                                              .elementAt(
                                                                  index ==
                                                                          0
                                                                      ? index
                                                                      : index +
                                                                          1)
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
                                              message: model.messages
                                                  .elementAt(index),
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                              )))),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SendMessageInputField(
                      placeHolder: '',
                      sendMessage: (message) {
                        if (message.isNotEmpty) {
                          model.sendMessage(message);
                        }
                      },
                    ),
                  ),
                  verticalSpaceRegular,
                ],
              ),
            ),
      viewModelBuilder: () => ChannelsViewModel(),
    );
  }
}

Widget messageReplies(ChannelsViewModel model) {
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
          Text('${ChannelsViewModel().numberOfReplies} replies',
              style: TextStyle(color: kcSecondaryColor)),
          horizontalSpaceTiny,
          Text('Last reply yesterday at 9:12PM')
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
  final ChannelsViewModel model;

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
              padding: EdgeInsets.fromLTRB(0, 2, 10, 2),
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
                                    ? 'Zuri Me'
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
                                style: subtitle2.copyWith(color: timeColor),
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

class TopRowActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcPrimaryLight,
      child: Row(
        children: [
          TopRowItem(
            label: 'Pinned',
            icon: SVGAssetPaths.pinnedIcon,
          ),
          TopRowItem(
            label: 'Add to bookmarks',
            icon: SVGAssetPaths.addIcon,
          )
        ],
      ),
    );
  }
}

class TopRowItem extends StatelessWidget {
  final String icon;
  final String label;

  TopRowItem({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            color: bodyColor,
          ),
          SizedBox(
            width: 5.h,
          ),
          Text(
            label,
            style: boldCaptionStyle,
          )
        ],
      ),
    );
  }
}

class SameSenderMessageTile extends StatelessWidget {
  final ChannelsViewModel model;
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
