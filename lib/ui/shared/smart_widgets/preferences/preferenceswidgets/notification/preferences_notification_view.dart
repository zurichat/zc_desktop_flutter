import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/enums/flash_windows.dart';
import 'package:zc_desktop_flutter/core/enums/pref_message.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/radio_button.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_checkbox.dart';
import '../../../../const_app_colors.dart';
import 'preferences_notification_viewmodel.dart';
class NotificationView extends StatelessWidget {
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
                            notifyAbout,
                            style: prefHeaderTextStyle,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    aboutNotifications,
                                    style: prefHeaderTextStyle.copyWith(
                                        color: kcPrimaryColor),
                                  ),
                                  Icon(
                                    Icons.help_outline_rounded,
                                    color: kcPrimaryColor,
                                  )
                                ],
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          BuildRadio(
                              groupValue: model.messageNotification,
                              value: PrefMessageNotification.AllMessages,
                              txt: allMessages,
                              onChanged: (value) {
                                model.setMessageNotification((value));
                              }),
                          BuildRadio(
                              groupValue: model.messageNotification,
                              value: PrefMessageNotification.DirectMessages,
                              txt: directMessages,
                              onChanged: (value) {
                                model.setMessageNotification((value));
                              }),
                          BuildRadio(
                              groupValue: model.messageNotification,
                              value: PrefMessageNotification.None,
                              txt: none,
                              onChanged: (value) {
                                model.setMessageNotification((value));
                              }),
                        ],
                      ),
                      Divider(
                        color: kcViewColor,
                        thickness: 0.5,
                      ),
                      Column(children: [
                        BuildCheckBox(useDiffSettings,
                            model.isSameForMobile, (_) {
                          model.setIsSameForMobile();
                        }),
                        BuildCheckBox(notifyMe,
                            model.isMeetingSet, (_) {
                          model.setIsmeetingSet();
                        }),
                        BuildCheckBox(notifyMeOfReplies,
                            model.isRepliedInThred, (_) {
                          model.setISRepliedInThread();
                        }),
                      ]),
                      verticalSpaceMediumTwo,
                      Text(keywords, style: prefHeaderTextStyle),
                      verticalSpaceSmall,
                      Text(
                        keywordNotification,
                        style: prefSubTitleTextStyle,
                      ),
                      verticalSpaceRegularOne,
                      TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kcDisplayChannelColor, width: 1)),
                        ),
                      ),
                      verticalSpaceMediumTwo,
                      Text(
                        scheduleNotification,
                        style: prefHeaderTextStyle,
                      ),
                      verticalSpaceSmall,
                      GestureDetector(
                        onTap: () {},
                        child: RichText(
                            softWrap: true,
                            text: TextSpan(
                                text:
                                    activeHoursNotification,
                                style: prefSubTitleTextStyle,
                                children: [
                                  TextSpan(
                                    text: learnMore,
                                    style: prefSubTitleTextStyle.copyWith(
                                        color: kcPrimaryColor),
                                  )
                                ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             BuildDropDown(
                                model.scheduleList, model.scheduleValue,
                                (value) {
                              model.setScheduleValue(value);
                            }),
                            BuildDropDown(
                                model.timeSchedule, model.schedule1Value,
                                (value) {
                              model.setSchedule1Value(value);
                            }),
                            BuildDropDown(
                                model.timeSchedule, model.schedule2Value,
                                (value) {
                              model.setSchedule2Value(value);
                            }),
                          ],
                           ),
                      ),
                     verticalSpaceRegular,
                      Divider(
                        color: kcViewColor,
                        thickness: 0.5,
                      ),
                      verticalSpaceSmall,
                      Text(
                        soundChecks,
                        style: prefHeaderTextStyle,
                      ),
                      verticalSpaceSmall,
                      Text(
                        chooseNotificationSound,
                        style: prefSubTitleTextStyle,
                      ),
                      verticalSpaceRegular,
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 117,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: kcDisplayChannelColor)),
                          child: Center(
                              child: Text(
                            exampleSound,
                            style: prefSubTitleTextStyle,
                          )),
                        ),
                      ),
                     verticalSpaceMedium,
                      BuildCheckBox(includePreviewMessage,
                          model.isPreviewMessage, (_) {
                        model.setIsPreviewMessage();
                      }),
                     verticalSpaceRegularOne,
                      BuildCheckBox(muteAll, model.isMute, (_) {
                        model.setIsMute();
                      }),
                      verticalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            setNotification,
                            style: prefBodyTextStyle,
                          )),
                          Expanded(
                              child: Text(
                            setNotificationLounge,
                            style: prefBodyTextStyle,
                          ))
                        ],
                      ),
                     verticalSpaceTiny,
                      Row(
                        children: [
                          Container(
                            width: 192.w,
                            child: BuildDropDown(
                                model.sound, model.messageSoundValue, (value) {
                              model.setMessageSoundValue(value);
                            }),
                          ),
                         horizontalSpaceLarge,
                          Container(
                            width: 192.w,
                            child: BuildDropDown(
                                model.sound, model.lougeSoundValue, (value) {
                              model.setLougeSoundValue(value);
                            }),
                          ),
                        ],
                      ),
                     verticalSpaceMediumTwo,
                      Text(flashWindow,
                          style: prefHeaderTextStyle),
                      verticalSpaceRegularOne,
                      Column(
                        children: [
                          BuildRadio(
                              value: FlashWindows.Never,
                              groupValue: model.flashWindows,
                              txt: never,
                              onChanged: (value) {
                                model.setFlashWindows(value);
                              }),
                          BuildRadio(
                              value: FlashWindows.WhenIdle,
                              groupValue: model.flashWindows,
                              txt: whenIdle,
                              onChanged: (value) {
                                model.setFlashWindows(value);
                              }),
                          BuildRadio(
                              value: FlashWindows.Always,
                              groupValue: model.flashWindows,
                              txt: always,
                              onChanged: (value) {
                                model.setFlashWindows(value);
                              })
                        ],
                      ),
                    verticalSpaceMedium,
                      Text(
                        deliverNotifications,
                        style: prefHeaderTextStyle,
                      ),
                     verticalSpaceTinyTwo,
                      Container(
                          width: 273.w,
                          height: 39,
                          child: BuildDropDown(
                              model.sound, model.notificationSoundValue,
                              (value) {
                            model.setNotificationSoundValue(value);
                          })),
                     verticalSpaceMediumTwo,
                      Text(notActiveOnDesktop,
                          style: prefHeaderTextStyle),
                     verticalSpaceRegular,
                      Text(
                        notificationsToMobile,
                        style: prefSubTitleTextStyle,
                      ),
                     verticalSpaceTinyTwo,
                      Container(
                        height: 39,
                        width: 273.w,
                        child: BuildDropDown(model.sendNotificationTo,
                            model.sendNotificationValue, (value) {
                          model.setNotificationValue(value);
                        }),
                      ),
                     verticalSpaceRegularOne,
                      BuildCheckBox(sendEmailNotifications,
                          model.isEmail, (_) {
                        model.setIsEmail();
                      })
                    ],
                  ),
                ), ),
            ),
            viewModelBuilder: () => NotificationViewModel(),
        onModelReady: (model) => model.fetchAndSetSetting(),
        onDispose: (model) => model.saveSettings());
  }
}


class BuildDropDown extends StatelessWidget {
  final List<String> items;
  final String value;
  final void Function(dynamic)? onChange;
  const BuildDropDown(
    this.items,
    this.value,
    this.onChange, {
    Key? key,
  }) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Container(
      height: 39.h,
      width: 129.w,
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: kcDisplayChannelColor)),
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
                      (String value) => DropdownMenuItem( child: Text(value, style: prefBodyTextStyle),
                            value: value,
                          ))
                  .toList()),

      ),));
  }
}
class BuildCheckBox extends StatelessWidget {
  final String txt;
  final bool value;
  final void Function(bool? value)? onChange;
  const BuildCheckBox(
    this.txt,
    this.value,
    this.onChange, {
    Key? key,
  }) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          ZcCheckBox(
          value: value,
          onChanged: onChange,
             ),
        Text(
          txt,
           style: prefBodyTextStyle,
        ),
      ],
    );
  }
  }