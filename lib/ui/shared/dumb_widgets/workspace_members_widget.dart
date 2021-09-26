import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/main/channels_page/channels_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/user_avatar.dart';

class WorkSpaceMembers extends StatelessWidget {
  const WorkSpaceMembers({Key? key, required this.model}) : super(key: key);

    final ChannelsViewModel model;


  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        padding: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Row(
                children: [
                  MemberAvatar(
                  model: model,
                ),
                MemberAvatar(
                  model: model,
                ),
                MemberAvatar(
                  model: model,
                ),
                ],
              ),
            
            Flexible(child: Text('300'))
          ],
        ));
  }
}

class MemberAvatar extends StatelessWidget {
 const MemberAvatar({Key? key, required this.model}) : super(key: key);
  final ChannelsViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/1.png')),
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
      height: 25,
      width: 25,
      child: UserAvatar(imageUri: model.userDefaultImageUrl),
    );
  }
}
