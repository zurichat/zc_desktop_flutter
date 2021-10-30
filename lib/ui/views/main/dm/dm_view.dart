import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:popover/popover.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zc_desk_send_message_field.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/bookmark_and_pinned_bar/bookmark_and_pinned_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/emoji_widget.dart';
import 'package:zc_desktop_flutter/ui/views/main/dm/dm_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/dm/hover_actions_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/dm/new_dm_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/profile_modal/profile_modal_view.dart';

class DmView extends StatelessWidget {
  const DmView({Key? key});

  @override
  Widget build(BuildContext context) {
    

    return ViewModelBuilder<DmViewModel>.reactive(
        onModelReady: (model) {
          model.setup();
        },
        onDispose: (model) {
          model.onDispose();
        },
        viewModelBuilder: () => DmViewModel(),
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
                color: whiteColor,
                padding: EdgeInsets.fromLTRB(2, 0, 0, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DetailedCustomAppBar(
                      margin: EdgeInsets.only(left: 2.0.w),
                      leading: DmScreenLeading(model),
                      trailing: DmScreenTrailing(),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: BookmarkAndPinnedMessagesView(
                          dmViewModel: model,
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Container(
                                  color: kcBackgroundColor2,
                                  child: Scrollbar(
                                    controller: model.rightSideBarController,
                                    isAlwaysShown: true,
                                    scrollbarOrientation:
                                        ScrollbarOrientation.right,
                                    thickness: 10,
                                    showTrackOnHover: true,
                                    child: ListView(
                                      physics: AlwaysScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      controller: model.rightSideBarController,
                                      children: [
                                        NewDmView(
                                          model: model,
                                        ),
                                        ListView.builder(
                                            itemCount: model.messages.length,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              if (model.messages
                                                          .elementAt(index)
                                                          .sender_id !=
                                                      model.currentLoggedInUser
                                                          .id &&
                                                  !model.messages
                                                      .elementAt(index)
                                                      .read &&
                                                  !model.showingNewMessageIn) {
                                                model.toggleShowingNewMessageIn(
                                                    true);
                                                return Column(
                                                  children: [
                                                    NewMessageIn(),
                                                    MessageTile(
                                                      model: model,
                                                      messageIndex: index,
                                                      message: model.messages
                                                          .elementAt(index),
                                                    ),
                                                  ],
                                                );
                                              } else if (index == 0) {
                                                return Column(
                                                  children: [
                                                    DateWidget(
                                                        date: model.formatDate(
                                                            model
                                                                .messages
                                                                .elementAt(index)
                                                                .created_at)),
                                                    MessageTile(
                                                      model: model,
                                                      messageIndex: index,
                                                      message: model.messages
                                                          .elementAt(index),
                                                    ),
                                                  ],
                                                );
                                              } else if ((!model
                                                  .isSameDate(index))) {
                                                return Column(
                                                  children: [
                                                    MessageTile(
                                                      model: model,
                                                      messageIndex: index,
                                                      message: model.messages
                                                          .elementAt(index),
                                                    ),
                                                    DateWidget(
                                                        date: model.formatDate(
                                                            model
                                                                .messages
                                                                .elementAt(
                                                                    index + 1)
                                                                .created_at)),
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
                  ],
                ),
              ));
  }
}

class MessageTile extends StatelessWidget {
  final Results message;
  final int messageIndex;
  final DmViewModel model;

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
              child: messageIndex != 0 &&
                      message.sender_id ==
                          model.messages
                              .elementAt(messageIndex - 1)
                              .sender_id &&
                      model.formatTime(message.created_at) ==
                          model.formatTime(model.messages
                              .elementAt(messageIndex - 1)
                              .created_at)
                  ? SameSenderMessageTile(
                      message: message,
                      model: model,
                      messageIndex: messageIndex,
                    )
                  : Row(
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
                                    model.getUser(message.sender_id).imageUrl,
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
                                              .getUser(message.sender_id)
                                              .displayName
                                              .isEmpty
                                          ? 'Abohdanga'
                                          : model
                                              .getUser(message.sender_id)
                                              .displayName,
                                      style: kHeading1TextStyle.copyWith(
                                          fontSize: 15.sp),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      model.formatTime(message.created_at),
                                      style: messageTimeStyleNormal.copyWith(
                                          color: timeColor),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                  child: Text(message.message),
                                ),

                                
                                Padding(
                                  padding: EdgeInsets.all(4),
                                  child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 40,
                                              childAspectRatio: 3 / 2,
                                              crossAxisSpacing: 15,
                                              mainAxisSpacing: 20),
                                      shrinkWrap: true,
                                      itemCount: message.reactions.length + 1,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        if (index == message.reactions.length) {
                                          return GestureDetector(
                                            onTap: () {
                                              model.newReactionToMessage(
                                                  messageIndex);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color: reactionBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.r),
                                                  border: Border.all(
                                                      color:
                                                          reactionBackground)),
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(SVGAssetPaths
                                                      .fluentEmoji),
                                                  Text('+')
                                                ],
                                              )),
                                            ),
                                          );
                                        } else {
                                          return EmojiReaction(
                                            onTap: () {
                                              model.reactToMessage(
                                                  messageIndex, index);
                                            },
                                            model: model,
                                            isReacted: false,
                                            emoji: '',
                                            count: 0,
                                          );
                                        }
                                      }),
                                )
                              ]),
                        )
                      ],
                    ),
            ),
            model.onMessageTileHover &&
                    model.onMessageHoveredIndex == messageIndex
                ? Positioned(
                    top: -10,
                    right: 10,
                    child: OnHoverWidget(
                      model: model,
                      message: message,
                    ),
                  )
                : SizedBox()
          ],
        ),
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

class NewMessageIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Divider(
            color: kcAccentColor,
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        Center(
            child: Text(
          'New',
          style: subtitle2.copyWith(color: kcAccentColor),
        )),
        SizedBox(width: 25.h)
      ],
    );
  }
}

class OnHoverWidget extends StatelessWidget {
  final DmViewModel model;
  final Results message;
  // final int messageIndex;

  OnHoverWidget({
    required this.model,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 40.h,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: kcBackgroundColor2,
            shape: BoxShape.rectangle,
            border: Border.all(color: timeColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HoverItem(
                  model: model,
                  icon: SVGAssetPaths.fluentEmoji,
                  onHover: (event) {
                    model.onHoverActionsHovered(
                        true, SVGAssetPaths.add_reaction_container, -45);
                  },
                  onTap: () {
                    showPopover(
                      key: UniqueKey(),
                      context: context,
                      barrierColor: Colors.transparent,
                      transitionDuration: const Duration(milliseconds: 150),
                      bodyBuilder: (BuildContext context) => EmojiWidget(
                        onEmojiSelected: (emoji) {},
                      ),
                      direction: PopoverDirection.bottom,
                      arrowHeight: 0,
                      arrowWidth: 0,
                    );
                  }),
              SizedBox(
                width: 10.w,
              ),
              HoverItem(
                  model: model,
                  icon: SVGAssetPaths.thread,
                  onHover: (event) {
                    model.onHoverActionsHovered(
                        true, SVGAssetPaths.reply_thread_container, -15);
                  },
                  onTap: () {}),
              SizedBox(
                width: 10.w,
              ),
              HoverItem(
                  model: model,
                  icon: SVGAssetPaths.shareIcon,
                  onHover: (event) {
                    model.onHoverActionsHovered(
                        true, SVGAssetPaths.share_message_container, 15);
                  },
                  onTap: () {}),
              SizedBox(
                width: 10.w,
              ),
              HoverItem(
                  model: model,
                  icon: SVGAssetPaths.bookmarkIcon,
                  onHover: (event) {
                    model.onHoverActionsHovered(
                        true, SVGAssetPaths.add_saved_container, 45);
                  },
                  onTap: () {}),
              SizedBox(
                width: 10.w,
              ),
              HoverItem(
                  model: model,
                  icon: SVGAssetPaths.actionsIcon,
                  onHover: (event) {
                    model.onHoverActionsHovered(
                        true, SVGAssetPaths.more_actions_container, 50);
                  },
                  onTap: () {
                    showDialog(
                        context: context,
                        useSafeArea: false,
                        builder: (context) {
                          return AlertDialog(
                            content: MoreActions(
                              message: message,
                              //messageIndex: null,
                              model: model,
                            ),
                            contentPadding: EdgeInsets.all(20),
                            scrollable: true,
                            insetPadding: EdgeInsets.all(0),
                          );
                        });
                  }),
            ],
          ),
        ),
        model.onHoverActionsHover
            ? Positioned(
                top: -40,
                left: model.hoverWidth,
                child: HoverInfo(
                    action: model.hoverAction, width: model.hoverWidth))
            : SizedBox()
      ],
    );
  }
}

class HoverItem extends StatelessWidget {
  final Function() onTap;
  final Function(PointerHoverEvent event) onHover;
  final String icon;
  final DmViewModel model;

  HoverItem(
      {required this.icon,
      required this.onHover,
      required this.model,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      key: UniqueKey(),
      onHover: onHover,
      onExit: (event) {
        model.onHoverActionsHovered(false, '', 0);
      },
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            foregroundDecoration: BoxDecoration(color: Colors.transparent),
            child: SvgPicture.asset(
              icon,
              height: 20.h,
              width: 20.w,
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}

class DmScreenLeading extends StatelessWidget {
  final DmViewModel? model;

  DmScreenLeading(this.model);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (_) => ProfileModalView());
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              //border: Border.all(color:lightIconColor),
              borderRadius: BorderRadius.circular(4.r),
              image: DecorationImage(
                fit: BoxFit.fill,
                image:
                    NetworkImage(model!.dmRoomInfo.otherUserProfile.imageUrl),
              ),
            ),
          ),
          SizedBox(
            width: 5.h,
          ),
          Text(
            model!.dmRoomInfo.otherUserProfile.displayName,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            width: 5.h,
          ),
          SvgPicture.asset(
            'assets/icons/vectordown_icon.svg',
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}

class DmScreenTrailing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.phone_outlined,
            color: whiteColor,
            size: 25.sp,
          )),
    );
  }
}

class EmojiReaction extends StatelessWidget {
  final int count;
  final String emoji;
  final bool isReacted;
  final DmViewModel model;
  final Function() onTap;

  EmojiReaction(
      {required this.isReacted,
      required this.count,
      required this.emoji,
      required this.onTap,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20.h,
        width: 45.w,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: isReacted ? emojiBackground : reactionBackground,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(
                color: isReacted ? Colors.blue : reactionBackground)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: subtitle2),
              SizedBox(
                width: 4.w,
              ),
              Text(
                count.toString(),
                style: subtitle2.copyWith(
                  color: isReacted ? Colors.blue : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SameSenderMessageTile extends StatelessWidget {
  final DmViewModel model;
  final Results message;
  final int messageIndex;
  SameSenderMessageTile(
      {required this.message, required this.model, required this.messageIndex});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 0, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          model.onMessageTileHover &&
                  model.onMessageHoveredIndex == messageIndex
              ? Text(
                  model.formatTime(message.created_at),
                  style: messageTimeStyleNormal.copyWith(color: timeColor),
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
                          return EmojiReaction(
                            onTap: () {
                              model.reactToMessage(messageIndex, index);
                            },
                            model: model,
                            isReacted: false,
                            emoji: '',
                            count: 0,
                          );
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
