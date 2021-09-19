import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        });
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
          Text('Input options', style: headline6.copyWith(fontSize: 15.sp)),
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
                    style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
                ShortCuts().enter(),
                Text(' should send the message',
                    style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
              ],
            ),
            subtitle: Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              runAlignment: WrapAlignment.spaceEvenly,
              children: [
                Text('With this ticked, use ',
                    style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
                ShortCuts().shift(),
                ShortCuts().enter(),
                Text(' to send', style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
              ],
            ),
          ),
          ListTile(
            leading: ZcCheckBox(
                value: model.allowMsgFormat,
                onChanged: (v) {
                  model.setAllowMsgFormat = v;
                }),
            title: Text('Format messages with markup',
                style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
            subtitle: Text(
                'The text formatting toolbar won’t show in the composer',
                style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
          ),

          verticalSpaceMedium,

          // When writing a message, press enter to :
          Wrap(
            runSpacing: 10.0,
            spacing: 10.0,
            runAlignment: WrapAlignment.spaceEvenly,
            children: [
              Text('When writing a message, press',
                  style: headline6.copyWith(fontSize: 15.sp)),
              ShortCuts().enter(),
              Text('to:', style: headline6.copyWith(fontSize: 15.sp)),
              SizedBox(
                height: 25.0,
                child: ListTile(
                  title: Text('Send the message',
                      style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
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
                          style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
                      ShortCuts().ctrl(),
                      ShortCuts().enter(),
                      Text('to send )',
                          style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
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
          Text('Search options', style: headline6.copyWith(fontSize: 15.sp)),
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
                Text('Starts a Zurichat search',
                    style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
              ],
            ),
            subtitle: Text('Overrides normal behavaiour in search behaviour',
                style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
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
                Text('Starts the quick switcher',
                    style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
              ],
            ),
            subtitle: Text('Overrides normal behavaiour in some browsers',
                style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
          ),

          Text('Exclude these channels from search results:',
              style: headline6.copyWith(fontSize: 15.sp)),
          AuthInputField(
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
          Text('Other Options', style: headline6.copyWith(fontSize: 15.sp)),
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
                Text(',', style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
                ShortCuts().pageDown(),
                Text(',', style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
                ShortCuts().home(),
                Text('and', style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
                ShortCuts().end(),
                Text('Starts a Zurichat search',
                    style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
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
                  style: kBodyTextStyle.copyWith(fontSize: 13.sp))),

          // zuri bot setting
          ListTile(
            leading: ZcCheckBox(
                value: model.option3,
                onChanged: (v) {
                  model.setOption3 = v;
                }),
            title: Text(
                'Send me occassional survey via Zurichat bot',
                style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
            subtitle: Text(
                'We’re working to make Zurichat better. We’d always love to hear your thoughts',
                style: kBodyTextStyle.copyWith(fontSize: 13.sp)),
          ),

          ListTile(
              leading: ZcCheckBox(
                  value: model.option4,
                  onChanged: (v) {
                    model.setOption4 = v;
                  }),
              title: Text(
                  'Warn me about potential malicious links',
                  style: kBodyTextStyle.copyWith(fontSize: 13.sp))),
        ],
      ),
    );
  }
}
