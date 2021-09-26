import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/core/enums/pref_message.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/notification/preferences_notification_viewmodel.dart';

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
                      style: preferenceStyleBold,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'About notifications',
                              style: kHeading4TextStyle.copyWith(
                                  color: Colors.green,
                                  fontSize: 16.sp,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
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
                Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                ),
                buildCheckBoxColumn(model),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  'Keywords',
                  style: preferenceStyleBold,
                ),
                SizedBox(height: 5.h),
                Text(
                    'You will be notified anytime someone uses these keyword in thread',
                    style: preferenceStyleNormal),
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
                  style: preferenceStyleNormal,
                ),
                SizedBox(height: 5.h),
                GestureDetector(
                  onTap: () {},
                  child: RichText(
                      softWrap: true,
                      text: TextSpan(
                          text:
                              'You\'ll only receive notifications in the hours that you choose. Outside of those times, notifications will be paused ',
                          style: preferenceStyleNormal,
                          children: [
                            TextSpan(
                              text: 'Learn more',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                  color: Colors.green),
                            )
                          ])),
                ),
                buildScheduleDropDownRow(model)
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => NotificationViewModel(),
    );
  }

  buildRadio(
      {required PrefMessageNotification value,
      required Object groupValue,
      void Function(Object? value)? onChanged,
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
          style: preferenceStyleNormal,
        )
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
              value: value,
              menuMaxHeight: 400.h,
              onChanged: onChange,
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(10),
              items: items
                  .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem(
                            child: Text(value, style: preferenceStyleNormal),
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
          style: preferenceStyleNormal,
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
}
