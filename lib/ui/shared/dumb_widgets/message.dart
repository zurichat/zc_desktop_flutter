import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/main/channels_page/channels_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/message_reply_widget.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/reaction.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/user_avatar.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({Key? key, required this.model, required this.messageIndex})
      : super(key: key);

  final ChannelsViewModel model;
  final int messageIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        hoverColor: Colors.grey[200],
        splashColor: Colors.grey[200],
        child: Container(
          margin: const EdgeInsets.all(15),
          width: fullWidth(context) / 2.5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(child: UserAvatar(imageUri: model.userDefaultImageUrl)),
              horizontalSpaceSmall,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // username and time row
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(model.userDisplayName,
                              style: messageSenderStyleBold),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                              '${model.currentMessageTime.hour}:${model.currentMessageTime.minute}',
                              style: messageTimeStyleNormal),
                        ]),
                    Text(
                      model.userPost,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.justify,
                      style: messageStyleNormal,
                    ),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ReactionWidget(model: model),
                        horizontalSpaceSmall,
                        ReactionWidget(model: model),
                        horizontalSpaceSmall,
                        ReactionWidget(model: model),
                      ],
                    ),
                    MessageReplyWidget(model: model,index: messageIndex,)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
