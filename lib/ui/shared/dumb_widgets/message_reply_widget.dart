import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/main/channels_page/channels_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/user_avatar.dart';

class MessageReplyWidget extends StatelessWidget {
  const MessageReplyWidget({Key? key, required this.model, required this.index}) : super(key: key);
  final ChannelsViewModel model;
  final int index;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: Border.all(
        color: Colors.green,
        width: 20
      ),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      hoverColor: Colors.white,
      onHover: (v) {
        model.onReplyWidgetHovered(v, index);
      },
      onTap: () {
        print("Threads opened");
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: fullWidth(context) / 2.8.w,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserAvatar(h: 20, w: 20, imageUri: model.userDefaultImageUrl),
            horizontalSpaceTiny,
            UserAvatar(h: 20, w: 20, imageUri: model.userDefaultImageUrl),
            horizontalSpaceTiny,
            UserAvatar(h: 20, w: 20, imageUri: model.userDefaultImageUrl),
            horizontalSpaceTiny,
            UserAvatar(h: 20, w: 20, imageUri: model.userDefaultImageUrl),
            horizontalSpaceTiny,

            //TODO: Get message time of last reply in a thread
            Text('${ChannelsViewModel().numberOfReplies} replies',
                style: TextStyle(color: kcSecondaryColor, fontSize: 12)),
            horizontalSpaceTiny,
            Flexible(
              flex: 1,
              child: model.onReplyWidgetHover && model.msgIndex == index
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text('View thread',
                              style: TextStyle(
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey[500])),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 13.w,
                            color: Colors.grey[500],
                          )
                        ])
                  : Text('Last reply yesterday at 9:12PM',
                      style: TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey[500])),
            )
          ],
        ),
      ),
    );
  }
}
