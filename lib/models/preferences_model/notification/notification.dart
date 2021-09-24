import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zc_desktop_flutter/core/enums/flash_windows.dart';
import 'package:zc_desktop_flutter/core/enums/pref_message.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    @Default(PrefMessageNotification.DirectMessages) PrefMessageNotification notifyMe,
    @Default(false) bool differentSettingsForMobile,
    @Default(false)  bool meetingStart,
    @Default(false) bool repliesToThread,
    @Default([]) List<String> keyword,
    @Default('Duration') String duration,
    @Default('From') String from,
    @Default('To') String to,
    @Default(false) isEmail,
    @Default('as soon as I\'m inactive') String notificationValue,
    @Default(true) bool includePreview,
    @Default(false) bool muteAll,
    @Default('Pick sound') String messageSound,
    @Default('Pick sound') String loungeSound,
    @Default(FlashWindows.WhenIdle) FlashWindows flashOnNotification,
    @Default('Pick sound') String deliverSound,
    @Default('When I am online') String notActiveOnDesktop,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}