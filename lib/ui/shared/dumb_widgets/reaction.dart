import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels/channels_viewmodel.dart';

class ReactionWidget extends StatelessWidget {
  const ReactionWidget({ Key? key , required this.model}) : super(key: key);
    final ChannelsViewModel model;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            InkWell(
              radius: 100,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                //width: 30,
                decoration: BoxDecoration(
                    color: kcBackgroundColor1,
                    borderRadius: BorderRadius.circular(50)),
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
}