import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/user_avatar.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels/channels_viewmodel.dart';

class MessageReplyWidget extends StatelessWidget {
  const MessageReplyWidget({Key? key, required this.model}) : super(key: key);
  final ChannelsViewModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: Border.all(color: Colors.green, width: 20),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      hoverColor: Colors.grey[400],
      onHover: (v) {},
      onTap: () {
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AvatarPlaceHolder(h: 30, w: 25, imageUri: model.userDefaultImageUrl),
            horizontalSpaceTiny,
            AvatarPlaceHolder(h: 30, w: 25, imageUri: model.userDefaultImageUrl),
            horizontalSpaceTiny,
            AvatarPlaceHolder(h: 30, w: 25, imageUri: model.userDefaultImageUrl),
            horizontalSpaceTiny,
            AvatarPlaceHolder(h: 30, w: 25, imageUri: model.userDefaultImageUrl),
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
}
