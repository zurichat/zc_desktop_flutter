import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_checkbox.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

import 'advanced_viewmodel.dart';

class AdvancedView extends StatelessWidget {
  const AdvancedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();
    return ViewModelBuilder<AdvancedViewModel>.reactive(
        viewModelBuilder: () => AdvancedViewModel(),
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
                    AdvancedViewInputOptions(model: model),
                    verticalSpaceMedium,
                    Divider(
                      color: Colors.black54,
                    ),
                    verticalSpaceMedium,
                    AdvancedViewSearchOptions(model: model),
                    verticalSpaceMedium,
                    Divider(
                      color: Colors.black54,
                    ),
                    verticalSpaceRegular,
                    AdvancedViewMoreOptions(model: model)
                  ],
                ),
              ),
            ),
          );
        },
        onModelReady: (model) => model.fetchAndSetFromDisk(),
        onDispose:  (model) => model.saveToStorage(),
        );
  }
}

class AdvancedViewInputOptions extends StatelessWidget {
  const AdvancedViewInputOptions({Key? key, required this.model})
      : super(key: key);

  final AdvancedViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Input options
          Text(inputOptions, style: preferenceStyleBold),
          ListTile(
            leading: ZcCheckBox(
                value: model.onEnter,
                onChanged: (v) {
                  model.setOnEnter = v;
                }),
            title: Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              runAlignment: WrapAlignment.spaceEvenly,
              children: [
                Text(whenTyping,
                    style: preferenceStyleBold),
                ShortCuts().enter(),
                Text(sendMessage, style: preferenceStyleBold),
              ],
            ),
            subtitle: Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              runAlignment: WrapAlignment.spaceEvenly,
              children: [
                Text(thisTicked, style: preferenceStyleNormal),
                ShortCuts().shift(),
                ShortCuts().enter(),
                Text(toSend, style: preferenceStyleNormal),
              ],
            ),
          ),
          ListTile(
            leading: ZcCheckBox(
                value: model.allowMsgFormat,
                onChanged: (v) {
                  model.setAllowMsgFormat = v;
                }),
            title:
                Text(formatMessages, style: preferenceStyleBold),
            subtitle: Text(
                textFormatting,
                style: preferenceStyleNormal),
          ),

          verticalSpaceMedium,

          // When writing a message, press enter to :
          Wrap(
            runSpacing: 10.0,
            spacing: 10.0,
            runAlignment: WrapAlignment.spaceEvenly,
            children: [
              Text(writingMessage, style: preferenceStyleBold),
              ShortCuts().enter(),
              Text(toText, style: preferenceStyleBold),
              SizedBox(
                height: 25.0,
                child: ListTile(
                  title: Text(sendTheMessage, style: preferenceStyleBold),
                  leading: Radio(
                    value: EnterButtonsChoice.sendMsg,
                    groupValue: model.enterButtonsChoice,
                    onChanged: (EnterButtonsChoice? val) {
                      model.setCheckVal = val;
                    },
                    activeColor: kcPrimaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
                child: ListTile(
                  title: Wrap(
                    runSpacing: 10.0,
                    spacing: 10.0,
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: [
                      Text(startNewLine,
                          style: preferenceStyleBold),
                      ShortCuts().ctrl(),
                      ShortCuts().enter(),
                      Text(toSendParenthesis, style: preferenceStyleBold),
                    ],
                  ),
                  leading: Radio(
                    value: EnterButtonsChoice.newLine,
                    groupValue: model.enterButtonsChoice,
                    onChanged: (EnterButtonsChoice? val) {
                      model.setCheckVal = val;
                    },
                    activeColor: kcPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AdvancedViewSearchOptions extends StatelessWidget {
  const AdvancedViewSearchOptions({Key? key, required this.model})
      : super(key: key);

  final AdvancedViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Input options
          Text(searchOptions, style: preferenceStyleBold),
          ListTile(
            leading: ZcCheckBox(
                value: model.ctrlF,
                onChanged: (v) {
                  model.setCtrlF = v;
                }),
            title: Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              runAlignment: WrapAlignment.spaceEvenly,
              children: [
                ShortCuts().ctrl(),
                ShortCuts().fKey(),
                Text(startZuriChatSearch, style: preferenceStyleBold),
              ],
            ),
            subtitle: Text(overrideNormal,
                style: preferenceStyleNormal),
          ),
          ListTile(
            leading: ZcCheckBox(
                value: model.ctrlK,
                onChanged: (v) {
                  model.setCtrlK = v;
                }),
            title: Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              runAlignment: WrapAlignment.spaceEvenly,
              children: [
                ShortCuts().ctrl(),
                ShortCuts().kKey(),
                Text(startQuickSwitcher, style: preferenceStyleBold),
              ],
            ),
            subtitle: Text(overrideNormalBehaviour,
                style: preferenceStyleNormal),
          ),

          Text(excludeChannels,
              style: preferenceStyleBold),
          ZuriDeskInputField(
            hintPlaceHolder: typeAChannel
          )
        ],
      ),
    );
  }
}

class AdvancedViewMoreOptions extends StatelessWidget {
  const AdvancedViewMoreOptions({Key? key, required this.model})
      : super(key: key);

  final AdvancedViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(otherOptions, style: preferenceStyleBold),
          verticalSpaceRegular,
          ListTile(
            leading: ZcCheckBox(
                value: model.option1,
                onChanged: (v) {
                  model.setOption1 = v;
                }),
            title: Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              runAlignment: WrapAlignment.spaceEvenly,
              children: [
                ShortCuts().pageUp(),
                Text(',', style: preferenceStyleNormal),
                ShortCuts().pageDown(),
                Text(',', style: preferenceStyleNormal),
                ShortCuts().home(),
                Text(andText, style: preferenceStyleNormal),
                ShortCuts().end(),
                Text(startZuriChatSearch, style: preferenceStyleNormal),
              ],
            ),
          ),

          // Ask if I want to toggle my away status when I log in after having set myself away
          ListTile(
              leading: ZcCheckBox(
                  value: model.option2,
                  onChanged: (v) {
                    model.setOption2 = v;
                  }),
              title: Text(
                  askToToggleAway,
                  style: preferenceStyleNormal)),

          // zuri bot setting
          ListTile(
            leading: ZcCheckBox(
                value: model.option3,
                onChanged: (v) {
                  model.setOption3 = v;
                }),
            title: Text(sendOccassionalSurvey,
                style: preferenceStyleBold),
            subtitle: Text(
                makingZuriChatBetterText,
                style: preferenceStyleNormal),
          ),

          ListTile(
              leading: ZcCheckBox(
                  value: model.option4,
                  onChanged: (v) {
                    model.setOption4 = v;
                  }),
              title: Text(warnAboutMaliciousLinks,
                  style: preferenceStyleNormal)),
        ],
      ),
    );
  }
}
