import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/main/dm/dm_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/main/dm/hover_actions_view.dart';
import 'package:zc_desktop_flutter/ui/main/dm/new_dm_view.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zc_desk_send_message_field.dart';

class DmView extends StatelessWidget {
  const DmView({Key? key});

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();

    return ViewModelBuilder<DmViewModel>.reactive(
        viewModelBuilder: () => DmViewModel(),
        builder: (context, model, child) => Container(
              color: whiteColor,
              padding: EdgeInsets.fromLTRB(2, 0, 0, 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(alignment: Alignment.topCenter, child: TopRowActions()),
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
                                NewDmView(
                                  userName: 'userName',
                                ),
                                ListView.builder(
                                    itemCount: model.messages.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      if (index == model.messages.length - 1) {
                                        return Column(
                                          children: [
                                            NewMessageIn(),
                                            MessageTile(
                                          userDisplayName: model.messages
                                              .elementAt(index)
                                              .userDisplayName,
                                          userProfileUrl: model.messages
                                              .elementAt(index)
                                              .userProfileUrl,
                                          time: model.messages
                                              .elementAt(index)
                                              .time,
                                          message: model.messages
                                              .elementAt(index)
                                              .message,
                                        )
                                          ],
                                        );
                                      } else {
                                        return MessageTile(
                                          userDisplayName: model.messages
                                              .elementAt(index)
                                              .userDisplayName,
                                          userProfileUrl: model.messages
                                              .elementAt(index)
                                              .userProfileUrl,
                                          time: model.messages
                                              .elementAt(index)
                                              .time,
                                          message: model.messages
                                              .elementAt(index)
                                              .message,
                                        );
                                      }
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
                    ),
                  ),
                ],
              ),
            ));
  }
}

class MessageTile extends StatelessWidget {
  final String userProfileUrl;
  final String userDisplayName;
  final String message;
  final String time;

  MessageTile(
      {required this.message,
      required this.time,
      required this.userDisplayName,
      required this.userProfileUrl});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmViewModel>.reactive(
      viewModelBuilder: () => DmViewModel(),
      builder: (context, model, child) => MouseRegion(
        opaque: false,
        onHover: (event) {
          model.onMessageHovered(true);
        },
        onExit: (event) {
          model.onMessageHovered(false);
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                  color: model.onMessageTileHover
                      ? hoverColor
                      : Colors.transparent),
              color: kcBackgroundColor2,
              padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 36.h,
                      width: 35.h,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: Image.network(
                        userProfileUrl,
                        errorBuilder: (context, object, stacktrace) {
                          return Image.asset('assets/images/profile.png');
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                  userDisplayName,
                                  style:
                                      kHeading1TextStyle.copyWith(fontSize: 15),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  time,
                                  style: subtitle2.copyWith(color: timeColor),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                              child: Text(message),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
            model.onMessageTileHover
                ? Positioned(
                    top: -10,
                    right: 10,
                    child: OnHoverWidget(),
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
                style: kHeading1TextStyle.copyWith(fontSize: 10),
              ),
              SizedBox(
                width: 5.w,
              ),
              SvgPicture.asset(
                SVGAssetPaths.dropDownOpenIcon,
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
        SizedBox(width:25.h)
      ],
    );
  }
}

class OnHoverWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          HoverItem(icon: SVGAssetPaths.fluentEmoji, onTap: () {}),
          SizedBox(
            width: 10.w,
          ),
          HoverItem(icon: SVGAssetPaths.thread, onTap: () {}),
          SizedBox(
            width: 10.w,
          ),
          HoverItem(icon: SVGAssetPaths.shareIcon, onTap: () {}),
          SizedBox(
            width: 10.w,
          ),
          HoverItem(icon: SVGAssetPaths.bookmarkIcon, onTap: () {}),
          SizedBox(
            width: 10.w,
          ),
          HoverItem(
              icon: SVGAssetPaths.actionsIcon,
              onTap: () {
                showDialog(
                    context: context,
                    useSafeArea: false,
                    builder: (context) {
                      return AlertDialog(
                        content: MoreActions(),
                        contentPadding: EdgeInsets.all(20),
                        scrollable: true,
                        insetPadding: EdgeInsets.all(0),
                      );
                    });
              }),
        ],
      ),
    );
  }
}

class HoverItem extends StatelessWidget {
  final Function() onTap;
  final String icon;

  HoverItem({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmViewModel>.reactive(
        viewModelBuilder: () => DmViewModel(),
        builder: (context, model, child) => MouseRegion(
              opaque: false,
              onHover: (event) {
                model.onHoverActionsHovered(true);
              },
              onExit: (event) {
                model.onHoverActionsHovered(false);
              },
              child: GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(icon),
              ),
            ));
  }
}

class DmScreenLeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 25.h,
            width: 25.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
            ),
            child: Image.network(
              'userProfile',
              errorBuilder: (context, object, stacktrace) {
                return Image.asset('assets/images/profile.png');
              },
            ),
          ),
          SizedBox(
            width: 5.h,
          ),
          Text(
            'userName',
            style: TextStyle(color: whiteColor),
          ),
          SizedBox(
            width: 5.h,
          ),
          SvgPicture.asset('assets/icons/vectordown_icon.svg',
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
            size: 20.h,
          )),
    );
  }
}
