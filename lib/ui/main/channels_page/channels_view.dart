import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/main/profile_modal/profile_modal_view.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_members_widget.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_title.dart';

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
                    margin: EdgeInsets.only(left: 2.0.w),
                    leading: WorkSpaceTitle(
                      channelTitle: model.getChannelName(),
                    ),
                    trailing: WorkSpaceMembers(),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0.w, vertical: 10.h),
                      child: Scrollbar(
                        controller: model.controllerOne,
                        child: SingleChildScrollView(
                          physics: ScrollPhysics(),
                          controller: model.controllerOne,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              messageHeader(context, model),
                              horizontalSpaceTiny,
                              Padding(
                                  padding: EdgeInsets.only(left: 51),
                                  child: InkWell(
                                      onTap: () {
                                        print("Thread opened");
                                      },
                                      onLongPress: () {
                                        print("More options menu opened");
                                      },
                                      child: SelectableText(model.userPost))),
                              verticalSpaceSmall,
                              Padding(
                                padding: const EdgeInsets.only(left: 51.0),
                                child: Row(
                                  children: [
                                    messageReactions(model),
                                    horizontalSpaceSmall,
                                    messageReactions(model),
                                    horizontalSpaceSmall,
                                    messageReactions(model),
                                  ],
                                ),
                              ),
                              verticalSpaceMedium,
                              messageHeader(context, model),
                              horizontalSpaceTiny,
                              Padding(
                                  padding: const EdgeInsets.only(left: 51),
                                  child: InkWell(
                                      onTap: () {
                                        print("Thread opened");
                                      },
                                      onLongPress: () {
                                        print("More options menu opened");
                                      },
                                      child: SelectableText(model.userPost))),
                              verticalSpaceMedium,
                              messageHeader(context, model),
                              horizontalSpaceTiny,
                              Padding(
                                  padding: const EdgeInsets.only(left: 51),
                                  child: InkWell(
                                      onTap: () {
                                        print("Thread opened");
                                      },
                                      onLongPress: () {
                                        print("More options menu opened");
                                      },
                                      child: SelectableText(model.userPost))),
                              verticalSpaceSmall,
                              Padding(
                                padding: const EdgeInsets.only(left: 51.0),
                                child: Row(
                                  children: [
                                    messageReactions(model),
                                    horizontalSpaceSmall,
                                    messageReactions(model),
                                    horizontalSpaceSmall,
                                    messageReactions(model),
                                  ],
                                ),
                              ),
                            ],
                          ),
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

Widget messageHeader(BuildContext context, ChannelsViewModel model) {
  return Container(
    child: Row(children: [
      GestureDetector(
        onTap: () {
          showDialog(context: context, builder: (_) => ProfileModalView());
        },
        child: CircleAvatar(
          backgroundImage: AssetImage(model.userDefaultImageUrl),
          radius: 22,
        ),
      ),
      SizedBox(
        width: 6.w,
      ),
      Text(model.userDisplayName,
          style: TextStyle(
              fontSize: 20.sp, color: headerColor, fontFamily: 'Lato')),
      SizedBox(
        width: 6.w,
      ),
      Text(
          '${model.currentMessageTime.hour}:${model.currentMessageTime.minute}',
          style:
              TextStyle(fontSize: 20.sp, color: timeColor, fontFamily: 'Lato')),
    ]),
  );
}

Widget messageReactions(ChannelsViewModel model) {
  return Container(
    child: Column(children: [
      Row(
        children: [
          InkWell(
            child: Container(
              //width: 30,
              decoration: BoxDecoration(
                  color: kcBackgroundColor1,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(children: [
                  Image.asset(model.emojiIconPath, height: 15, width: 15),
                  horizontalSpaceTiny,
                  Text('${model.numberOfReactions}'),
                ]),
              ),
            ),
            onTap: () {
              print("reaction incremented");
              model.increaseReactionNumber();
              //increment reaction
            },
          ),
        ],
      ),
      verticalSpaceSmall,
    ]),
  );
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
