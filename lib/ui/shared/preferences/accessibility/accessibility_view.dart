import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/accessibility/accessibility_viewmodel.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

class AccessibilityView extends StatelessWidget {
  const AccessibilityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();

    return ViewModelBuilder<AccessibilityViewModel>.reactive(
        viewModelBuilder: ()=>AccessibilityViewModel(),
        builder: (context,model,_){
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

                    msgAnimationSection(model),

                    verticalSpaceRegular,

                    keyboardSettingSection(model)

                  ],
                ),
              ),
            ),
          );
        });
  }


  Widget msgAnimationSection(AccessibilityViewModel model){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // animation setting
          ZcdeskText.boldCaption('Animation'),
          Row(
            children: [
              ZcCheckBox(
                  value: model.animateValue,
                  fillColor: MaterialStateProperty.resolveWith(model.getColor),
                  onChanged: (v){
                    model.setAnimateValue = v;
                  }
              ),
              horizontalSpaceTiny,
              Flexible(child: ZcdeskText.lightCaption('Allow animated images and emoji')),
            ],
          ),
          verticalSpaceRegular,

          //messaging setting
          ZcdeskText.boldCaption('Direct message announcements'),
          verticalSpaceSmall,
          Text.rich(
              TextSpan(
                  style: TextStyle(
                      color: bodyColor,
                      fontFamily: 'Lato',
                      fontSize: 13
                  ),
                  children: [
                    TextSpan(text: model.msg),
                    TextSpan(
                        text:' '+ model.boldMsg,
                        style: TextStyle(fontWeight: FontWeight.bold)
                    )
                  ]
              )
          ),
          verticalSpaceRegular,

          // Play a sound when a message is sent
          Row(
            children: [
              ZcCheckBox(
                  value: model.msgSound,
                  fillColor: MaterialStateProperty.resolveWith(model.getColor),
                  onChanged: (v){
                    model.setMsgSound = v;
                  }
              ),
              horizontalSpaceTiny,
              Flexible(child: ZcdeskText.lightCaption(model.sentMsgSound)),
            ],
          ),
          verticalSpaceSmall,

          // Play a sound when a message is received
          Row(
            children: [
              ZcCheckBox(
                  value: model.receiveSound,
                  fillColor: MaterialStateProperty.resolveWith(model.getColor),
                  onChanged: (v){
                    model.setReceiveSound = v;
                  }
              ),
              horizontalSpaceTiny,
              Flexible(child: ZcdeskText.lightCaption(model.receiveMsgSound)),
            ],
          ),
          verticalSpaceSmall,

          // Read incoming message out loud
          Row(
            children: [
              ZcCheckBox(
                  value: model.readIncoming,
                  fillColor: MaterialStateProperty.resolveWith(model.getColor),
                  onChanged: (v){
                    model.setReadIncoming = v;
                  }
              ),
              horizontalSpaceTiny,
              Flexible(child: ZcdeskText.lightCaption(model.readIncomingMsg)),
            ],
          ),
          verticalSpaceSmall,

        ],
      ),
    );
  }

  Widget keyboardSettingSection(AccessibilityViewModel model){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // key short cut setting
          ZcdeskText.boldCaption('Keyboard'),
          verticalSpaceRegular,

          // desc
          Text.rich(
              TextSpan(
                  style: TextStyle(
                      color: bodyColor,
                      fontFamily: 'Lato',
                      fontSize: 13
                  ),
                  children: [
                    TextSpan(text: model.shortCutMsg),
                    TextSpan(
                        text:' '+ model.boldShortCutMsg,
                        style: TextStyle(
                          color: kcPrimaryColor,
                          decoration: TextDecoration.underline,
                        )
                    )
                  ]
              )
          ),
          verticalSpaceRegular,

          // desc2
           Row(
              children: [
                ZcdeskText.boldCaption('Press'),
                horizontalSpaceTiny,
                ShortCuts().up(),
                horizontalSpaceTiny,
                 ZcdeskText.boldCaption('in the empty message field to:'),
              ],
            ),
          verticalSpaceSmall,

          shortcutActions(model)

        ],
      ),
    );
  }

  Widget shortcutActions(AccessibilityViewModel model){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: ZcdeskText.boldCaption('Move focus to the message list'),
          subtitle:  ZcdeskText.lightCaption('The last visible message in the list will be selected'),
          leading: Radio(
            value: UpButtonsChoice.option1,
            groupValue:model.upButtonsChoice,
            onChanged: (UpButtonsChoice? val){
              model.setCheckVal = val;
            },
            activeColor: kcPrimaryColor,
          ),
        ),
        ListTile(
          title: ZcdeskText.boldCaption('Edit your last message'),
          subtitle:  ZcdeskText.lightCaption('The last message you sent will be selected and in editing mode'),
          leading: Radio(
            value: UpButtonsChoice.option2,
            groupValue: model.upButtonsChoice,
            onChanged: (UpButtonsChoice? val){
              model.setCheckVal = val;
            },
            activeColor: kcPrimaryColor,
          ),
        ),

        verticalSpaceRegular,

        //notice
        Row(
          children: [
            ZcdeskText.extraSmallText('Note: press '),
            ShortCuts().ctrl(),
            ZcdeskText.extraSmallText(' + '),
            ShortCuts().up(),
            Flexible(child: ZcdeskText.extraSmallText(' to edit your last message, with either option')),
          ],

        )
      ],
    );
  }

}
