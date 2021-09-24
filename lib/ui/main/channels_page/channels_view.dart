import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/message.dart';
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
          : Column(
                children: [
                  DetailedCustomAppBar(
                   // margin: EdgeInsets.only(left: 2.0.w),
                    leading: Text("# ${model.getChannelName()}",
                      style: TextStyle(overflow: TextOverflow.fade)),
                    trailing: WorkSpaceMembers(model: model,),
                  ),
                   Expanded(
                     flex: 10,
                     child: Scrollbar(
                        controller: model.controllerOne,
                        child: SingleChildScrollView(
                          controller: model.controllerOne,
                          child: Container(
                            width: fullWidth(context),
                            padding: EdgeInsets.only(left: 12.0.w),
                            child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      MessageWidget(model: model,messageIndex: 0,),
                                      MessageWidget(model: model,messageIndex: 1,),
                                      MessageWidget(model: model,messageIndex: 2,),
                                      
                                    ],
                            ),
                          ),
                        ),
                      ),
                   ),
                ],
              ),
            
      viewModelBuilder: () => ChannelsViewModel(),
    );
  }
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
