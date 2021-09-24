import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/core/enums/flash_windows.dart';
import 'package:zc_desktop_flutter/core/enums/pref_message.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/notification/preferences_notification_viewmodel.dart';

import '../../../const_text_styles.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    return ViewModelBuilder<NotificationViewModel>.reactive(
      builder: (context, model, child) => Scrollbar(
        controller: _controller,
        isAlwaysShown: true,
        interactive: true,
        scrollbarOrientation: ScrollbarOrientation.right,
        hoverThickness: 8,
        thickness: 5,
        child: SingleChildScrollView(
          controller: _controller,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nofity me about',
                      style: prefHeaderTextStyle,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'About notifications',
                              style: prefHeaderTextStyle.copyWith(color: Colors.green),
                            ),
                            Icon(
                              Icons.help_outline_rounded,
                              color: Colors.green,
                            )
                          ],
                        ))
                  ],
                ),
                buildMessageRadioColumn(model),
                buildDivider(),
                buildCheckBoxColumn(model),
                SizedBox(
                  height: 32.h,
                ),
                Text('Keywords', style: prefHeaderTextStyle),
                headerSpacer(),
                Text(
                  'You will be notified anything, someone uses these keyword in thread',
                  style: prefSubTitleTextStyle,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Schedule Notification',
                  style: prefHeaderTextStyle,
                ),
                headerSpacer(),
                GestureDetector(
                  onTap: () {},
                  child: RichText(
                      softWrap: true,
                      text: TextSpan(
                          text:
                              'You\'ll only receive notifications in the hours that you choose. Outside of those times, notifications will be paused ',
                          style: prefSubTitleTextStyle,
                          children: [
                            TextSpan(
                              text: 'Learn more',
                              style: prefSubTitleTextStyle.copyWith(color: Colors.green),
                            )
                          ])),
                ),
                buildScheduleDropDownRow(model),
                SizedBox(
                  height: 20,
                ),
                buildDivider(),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Sound Checks',
                  style: prefHeaderTextStyle,
                ),
                headerSpacer(),
                Text(
                  'Choose your notification sound.',
                  style: prefSubTitleTextStyle,
                ),
                SizedBox(
                  height: 21,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 117,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)),
                    child: Center(
                        child: Text(
                      'Example Sound',
                      style: prefSubTitleTextStyle,
                    )),
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                buildCheckBox('Include preview message in notification',
                    model.isPreviewMessage, (_) {
                  model.setIsPreviewMessage();
                }),
                SizedBox(
                  height: 16,
                ),
                buildCheckBox('Mute all', model.isMute, (_) {
                  model.setIsMute();
                }),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      'Set your notifications right (Messages)',
                      style: prefBodyTextStyle,
                    )),
                    Expanded(
                        child: Text(
                      'Set your notifications right (Lounge)',
                      style: prefBodyTextStyle,
                    ))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      width: 192.w,
                      child: buildDropDown(model.sound, model.messageSoundValue,
                          (value) {
                        model.setMessageSoundValue(value);
                      }),
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    Container(
                      width: 192.w,
                      child: buildDropDown(model.sound, model.lougeSoundValue,
                          (value) {
                        model.setLougeSoundValue(value);
                      }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 33,
                ),
                Text('Flash windows when notification comes',
                    style: prefHeaderTextStyle),
                SizedBox(
                  height: 16,
                ),
                buildWindowFlashesRadioGroup(model),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Deliver notification via',
                  style: prefHeaderTextStyle,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    width: 273.w,
                    height: 39,
                    child: buildDropDown(
                        model.sound, model.notificationSoundValue, (value) {
                      model.setNotificationSoundValue(value);
                    })),
                SizedBox(height: 33.h),
                Text('When I am not active on desktop',
                    style: prefHeaderTextStyle),
                SizedBox(
                  height: 21.h,
                ),
                Text(
                  'Send notifications to my mobile',
                  style: prefSubTitleTextStyle,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 39,
                  width: 273.w,
                  
                  child: buildDropDown(
                      model.sendNotificationTo, model.sendNotificationValue,
                      (value) {
                    model.setNotificationValue(value);
                  }),
                ),
                SizedBox(
                  height: 16.h,
                ),
                buildCheckBox(
                    'Send me email notifications for mentions', model.isEmail,
                    (_) {
                  model.setIsEmail();
                })
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => NotificationViewModel(),
      onModelReady: (model) => model.fetchAndSetSetting(),
      onDispose: (model) => model.saveSettings()
    );
  }

  buildRadio(
      {required dynamic value,
      required Object groupValue,
      void Function(dynamic value)? onChanged,
      required String txt}) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.green,
        ),
        Text(
          txt,
          style: prefBodyTextStyle,
        )
      ],
    );
  }

  buildWindowFlashesRadioGroup(NotificationViewModel model) {
    return Column(
      children: [
        buildRadio(
            value: FlashWindows.Never,
            groupValue: model.flashWindows,
            txt: 'Never',
            onChanged: (value) {
              model.setFlashWindows(value);
            }),
        buildRadio(
            value: FlashWindows.WhenIdle,
            groupValue: model.flashWindows,
            txt: 'When idle',
            onChanged: (value) {
              model.setFlashWindows(value);
            }),
        buildRadio(
            value: FlashWindows.Always,
            groupValue: model.flashWindows,
            txt: 'Always',
            onChanged: (value) {
              model.setFlashWindows(value);
            })
      ],
    );
  }

  buildMessageRadioColumn(NotificationViewModel model) {
    return Column(
      children: [
        buildRadio(
            groupValue: model.messageNotification,
            value: PrefMessageNotification.AllMessages,
            txt: 'All messages',
            onChanged: (value) {
              model.setMessageNotification((value));
            }),
        buildRadio(
            groupValue: model.messageNotification,
            value: PrefMessageNotification.DirectMessages,
            txt: 'Direct messages',
            onChanged: (value) {
              model.setMessageNotification((value));
            }),
        buildRadio(
            groupValue: model.messageNotification,
            value: PrefMessageNotification.None,
            txt: 'None',
            onChanged: (value) {
              model.setMessageNotification((value));
            }),
      ],
    );
  }

  buildDropDown(
      List<String> items, String value, void Function(dynamic)? onChange) {
    return Container(
      height: 39.h,
      width: 129.w,
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
              value: value,
              isExpanded: true,
              isDense: true,
              onChanged: onChange,
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(10),
              items: items
                  .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem(
                            child: Text(value, style: prefBodyTextStyle),
                            value: value,
                          ))
                  .toList()),
        ),
      ),
    );
  }

  buildScheduleDropDownRow(NotificationViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildDropDown(model.scheduleList, model.scheduleValue, (value) {
            model.setScheduleValue(value);
          }),
          buildDropDown(model.timeSchedule, model.schedule1Value, (value) {
            model.setSchedule1Value(value);
          }),
          buildDropDown(model.timeSchedule, model.schedule2Value, (value) {
            model.setSchedule2Value(value);
          }),
        ],
      ),
    );
  }

  buildCheckBox(String txt, bool value, void Function(bool? value)? onChange) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChange,
          activeColor: Colors.green,
        ),
        Text(
          txt,
          style: prefBodyTextStyle,
        ),
      ],
    );
  }

  buildCheckBoxColumn(NotificationViewModel model) {
    return Column(children: [
      buildCheckBox('Use different seetings for mobile', model.isSameForMobile,
          (_) {
        model.setIsSameForMobile();
      }),
      buildCheckBox('Notify me when a meeting is set', model.isMeetingSet, (_) {
        model.setIsmeetingSet();
      }),
      buildCheckBox('Notify me of replies to thread', model.isRepliedInThred,
          (_) {
        model.setISRepliedInThread();
      }),
    ]);
  }


  

  headerSpacer() {
    return SizedBox(
      height: 3,
    );
  }

  buildHeaderAndSubTitle(String header, String subheader) {
    return Column(
      children: [
        Text(
          header,
          style: prefHeaderTextStyle,
        ),
        headerSpacer(),
        Text(
          'Choose your notification sound.',
          style: prefSubTitleTextStyle,
        ),
      ],
    );
  }

  buildDivider() {
    return Divider(
      color: Colors.grey,
      thickness: 0.5,
    );
  }
}