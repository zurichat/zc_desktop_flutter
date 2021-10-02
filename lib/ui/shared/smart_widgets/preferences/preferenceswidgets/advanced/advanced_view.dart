import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
          Text('Input options', style: preferenceStyleBold),
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
                Text('When typing code with ````, ',
                    style: preferenceStyleBold),
                ShortCuts().enter(),
                Text(' should send the message', style: preferenceStyleBold),
              ],
            ),
            subtitle: Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              runAlignment: WrapAlignment.spaceEvenly,
              children: [
                Text('With this ticked, use ', style: preferenceStyleNormal),
                ShortCuts().shift(),
                ShortCuts().enter(),
                Text(' to send', style: preferenceStyleNormal),
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
                Text('Format messages with markup', style: preferenceStyleBold),
            subtitle: Text(
                'The text formatting toolbar won’t show in the composer',
                style: preferenceStyleNormal),
          ),

          verticalSpaceMedium,

          // When writing a message, press enter to :
          Wrap(
            runSpacing: 10.0,
            spacing: 10.0,
            runAlignment: WrapAlignment.spaceEvenly,
            children: [
              Text('When writing a message, press', style: preferenceStyleBold),
              ShortCuts().enter(),
              Text('to:', style: preferenceStyleBold),
              SizedBox(
                height: 25.0,
                child: ListTile(
                  title: Text('Send the message', style: preferenceStyleBold),
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
                      Text('Start a new line ( use',
                          style: preferenceStyleBold),
                      ShortCuts().ctrl(),
                      ShortCuts().enter(),
                      Text('to send )', style: preferenceStyleBold),
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
          Text('Search options', style: preferenceStyleBold),
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
                Text('Starts a Zurichat search', style: preferenceStyleBold),
              ],
            ),
            subtitle: Text('Overrides normal behavaiour in search behaviour',
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
                Text('Starts the quick switcher', style: preferenceStyleBold),
              ],
            ),
            subtitle: Text('Overrides normal behavaiour in some browsers',
                style: preferenceStyleNormal),
          ),

          Text('Exclude these channels from search results:',
              style: preferenceStyleBold),
          ZuriDeskInputField(
            hintPlaceHolder: 'Type a channel name...',
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
          Text('Other Options', style: preferenceStyleBold),
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
                Text('and', style: preferenceStyleNormal),
                ShortCuts().end(),
                Text('Starts a Zurichat search', style: preferenceStyleNormal),
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
                  'Ask if I want to toggle my away status when I log in after having set myself away ',
                  style: preferenceStyleNormal)),

          // zuri bot setting
          ListTile(
            leading: ZcCheckBox(
                value: model.option3,
                onChanged: (v) {
                  model.setOption3 = v;
                }),
            title: Text('Send me occassional survey via Zurichat bot',
                style: preferenceStyleBold),
            subtitle: Text(
                'We’re working to make Zurichat better. We’d always love to hear your thoughts',
                style: preferenceStyleNormal),
          ),

          ListTile(
              leading: ZcCheckBox(
                  value: model.option4,
                  onChanged: (v) {
                    model.setOption4 = v;
                  }),
              title: Text('Warn me about potential malicious links',
                  style: preferenceStyleNormal)),
        ],
      ),
    );
  }
}
