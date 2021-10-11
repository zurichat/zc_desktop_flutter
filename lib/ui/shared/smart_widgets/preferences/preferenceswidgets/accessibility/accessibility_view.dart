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
       onModelReady: (model)=>model.fetchAndSetSetting(),
        onDispose: (model)=>model.saveSettings(),
        viewModelBuilder: () => AccessibilityViewModel(),
        builder: (context, model, _) {
          return Scrollbar(
            controller: _rightSideBarController,
            isAlwaysShown: true,
            scrollbarOrientation: ScrollbarOrientation.right,
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
        });
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
          Text('Animation', style: preferenceStyleBold),
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
                      style: preferenceStyleNormal)),
            ],
          ),
          verticalSpaceRegular,

          //messaging setting
          Text('Direct message announcements', style: preferenceStyleBold),

          verticalSpaceSmall,
          Text.rich(TextSpan(style: preferenceStyleNormal, children: [
            TextSpan(text: model.msg),
            TextSpan(text: ' ' + model.boldMsg, style: preferenceStyleBold)
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
                      Text(model.sentMsgSound, style: preferenceStyleNormal)),
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
                      style: preferenceStyleNormal)),
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
                      style: preferenceStyleNormal)),
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
                style: preferenceStyleBold, children: [
              TextSpan(text: model.shortCutMsg),
              TextSpan(
                  text: ' ' + model.boldShortCutMsg,
                  style: TextStyle(color: kcSecondaryColor, fontSize: 15.sp))
            ])),
          ),
          verticalSpaceRegular,

          // desc2
          Row(
            children: [
              Text('Press', style: preferenceStyleBold),
              horizontalSpaceTiny,
              ShortCuts().up(),
              horizontalSpaceTiny,
              Text('in the empty message field to:', style: preferenceStyleBold)
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
              style: preferenceStyleBold),
          subtitle: Text(
              'The last visible message in the list will be selected',
              style: preferenceStyleNormal),
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
          title: Text('Edit your last message', style: preferenceStyleBold),
          subtitle: Text(
              'The last message you sent will be selected and in editing mode',
              style: preferenceStyleNormal),
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
            Text('Note: press ', style: preferenceStyleNormal),
            ShortCuts().ctrl(),
            Text(' + ', style: preferenceStyleNormal),
            ShortCuts().up(),
            Flexible(
                child: Text(' to edit your last message, with either option',
                    style: preferenceStyleNormal)),
          ],
        )
      ],
    );
  }
}
