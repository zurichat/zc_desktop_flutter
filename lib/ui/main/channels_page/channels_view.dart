import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/message.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_members_widget.dart';

import 'channels_viewmodel.dart';

class ChannelsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    leading: Text("# ${model.getChannelName()}",
                        style: TextStyle(overflow: TextOverflow.fade)),
                    trailing: WorkSpaceMembers(
                      model: model,
                    ),
                  ),
                  Expanded(
                    child: Scrollbar(
                      controller: model.controllerOne,
                      child: SingleChildScrollView(
                        physics: ScrollPhysics(),
                        controller: model.controllerOne,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MessageWidget(model: model, messageIndex: 0),
                            MessageWidget(model: model, messageIndex: 1),
                            MessageWidget(model: model, messageIndex: 2),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      viewModelBuilder: () => ChannelsViewModel(),
    );
  }
}

Widget messageReplies(ChannelsViewModel model) {
  return InkWell(
    onTap: () {
      print("Threads opened");
    },
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
    onTap: () {
      print("Threads opened");
    },
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
