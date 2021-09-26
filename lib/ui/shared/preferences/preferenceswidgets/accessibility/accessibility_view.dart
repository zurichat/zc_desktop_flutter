import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_checkbox.dart';

import 'accessibility_viewmodel.dart';

class AccessibilityView extends StatelessWidget {
  const AccessibilityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();

    return ViewModelBuilder<AccessibilityViewModel>.reactive(
        viewModelBuilder: () => AccessibilityViewModel(),
        builder: (context, model, _) {
          return Scrollbar(
            controller: _rightSideBarController,
            isAlwaysShown: true,
            thickness: 8,
            showTrackOnHover: true,
            child: SingleChildScrollView(
              controller: _rightSideBarController,
              child: Container(
                width: fullWidth(context),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MessageAnimationSection(model: model),
                    verticalSpaceRegular,
                    KeyBoardSettingsSection(model: model)
                  ],
                ),
              ),
            ),
          );
        },
        onModelReady: (model)=>model.fetchAndSetSetting(),
        onDispose: (model)=>model.saveSettings(),
        );
  }
}

class MessageAnimationSection extends StatelessWidget {
  const MessageAnimationSection({Key? key, required this.model})
      : super(key: key);

  final AccessibilityViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // animation setting
          Text('Animation', style: prefHeaderTextStyle),
          Row(
            children: [
              ZcCheckBox(
                  value: model.animateValue,
                  onChanged: (v) {
                    model.setAnimateValue = v;
                  }),
              horizontalSpaceTiny,
              Flexible(
                  child: Text('Allow animated images and emoji',
                      style: prefBodyTextStyle)),
            ],
          ),
          verticalSpaceRegular,

          //messaging setting
          Text('Direct message announcements', style: prefHeaderTextStyle),

          verticalSpaceSmall,
          Text.rich(TextSpan(style: prefBodyTextStyle, children: [
            TextSpan(text: model.msg),
            TextSpan(text: ' ' + model.boldMsg, style: prefHeaderTextStyle)
          ])),
          verticalSpaceRegular,

          // Play a sound when a message is sent
          Row(
            children: [
              ZcCheckBox(
                  value: model.msgSound,
                  onChanged: (v) {
                    model.setMsgSound = v;
                  }),
              horizontalSpaceTiny,
              Flexible(
                  child:
                      Text(model.sentMsgSound, style: prefBodyTextStyle)),
            ],
          ),

          verticalSpaceSmall,

          // Play a sound when a message is received
          Row(
            children: [
              ZcCheckBox(
                  value: model.receiveSound,
                  onChanged: (v) {
                    model.setReceiveSound = v;
                  }),
              horizontalSpaceTiny,
              Flexible(
                  child: Text(model.receiveMsgSound,
                      style: prefBodyTextStyle)),
            ],
          ),
          verticalSpaceSmall,

          // Read incoming message out loud
          Row(
            children: [
              ZcCheckBox(
                  value: model.readIncoming,
                  onChanged: (v) {
                    model.setReadIncoming = v;
                  }),
              horizontalSpaceTiny,
              Flexible(
                  child: Text(model.readIncomingMsg,
                      style: prefBodyTextStyle)),
            ],
          ),
          verticalSpaceSmall,
        ],
      ),
    );
  }
}

class KeyBoardSettingsSection extends StatelessWidget {
  const KeyBoardSettingsSection({Key? key, required this.model})
      : super(key: key);

  final AccessibilityViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // key short cut setting
          Text('Keyboard', style: headline6.copyWith(fontSize: 15.sp)),
          verticalSpaceRegular,

          // desc
          GestureDetector(
            onTap: () {},
            child: Text.rich(TextSpan(
                style: prefHeaderTextStyle,
                children: [
                  TextSpan(text: model.shortCutMsg),
                  TextSpan(
                      text: ' ' + model.boldShortCutMsg,
                      style:
                          TextStyle(color: kcSecondaryColor, fontSize: 15.sp))
                ])),
          ),
          verticalSpaceRegular,

          // desc2
          Row(
            children: [
              Text('Press', style: prefHeaderTextStyle),
              horizontalSpaceTiny,
              ShortCuts().up(),
              horizontalSpaceTiny,
              Text('in the empty message field to:',
                  style: prefHeaderTextStyle)
            ],
          ),
          verticalSpaceSmall,

          ShortCutDescription(model: model)
        ],
      ),
    );
  }
}

class ShortCutDescription extends StatelessWidget {
  const ShortCutDescription({Key? key, required this.model}) : super(key: key);

  final AccessibilityViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text('Move focus to the message list',
              style: prefHeaderTextStyle),
          subtitle: Text(
              'The last visible message in the list will be selected',
              style: prefBodyTextStyle),
          leading: Radio(
            value: UpButtonsChoice.option1,
            groupValue: model.upButtonsChoice,
            onChanged: (UpButtonsChoice? val) {
              model.setCheckVal = val;
            },
            activeColor: kcPrimaryColor,
          ),
        ),
        ListTile(
          title: Text('Edit your last message',
              style: prefHeaderTextStyle),
          subtitle: Text(
              'The last message you sent will be selected and in editing mode',
              style: prefBodyTextStyle),
          leading: Radio(
            value: UpButtonsChoice.option2,
            groupValue: model.upButtonsChoice,
            onChanged: (UpButtonsChoice? val) {
              model.setCheckVal = val;
            },
            activeColor: kcPrimaryColor,
          ),
        ),

        verticalSpaceRegular,

        //notice
        Wrap(
          children: [
            Text('Note: press ',
                style: prefBodyTextStyle),
            ShortCuts().ctrl(),
            Text(' + ', style: prefBodyTextStyle),
            ShortCuts().up(),
            Flexible(
                child: Text(' to edit your last message, with either option',
                    style: prefBodyTextStyle)),
          ],
        )
      ],
    );
  }
}
