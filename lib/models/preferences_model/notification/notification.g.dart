// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      notifyMe: _$enumDecodeNullable(
              _$PrefMessageNotificationEnumMap, json['notifyMe']) ??
          PrefMessageNotification.DirectMessages,
      differentSettingsForMobile:
          json['differentSettingsForMobile'] as bool? ?? false,
      meetingStart: json['meetingStart'] as bool? ?? false,
      repliesToThread: json['repliesToThread'] as bool? ?? false,
      keyword: (json['keyword'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      duration: json['duration'] as String? ?? 'Duration',
      from: json['from'] as String? ?? 'From',
      to: json['to'] as String? ?? 'To',
      includePreview: json['includePreview'] as bool? ?? true,
      muteAll: json['muteAll'] as bool? ?? false,
      messageSound: json['messageSound'] as String? ?? 'Pick sound',
      loungeSound: json['loungeSound'] as String? ?? 'Pick sound',
      flashOnNotification: _$enumDecodeNullable(
              _$FlashWindowsEnumMap, json['flashOnNotification']) ??
          FlashWindows.WhenIdle,
      deliverSound: json['deliverSound'] as String? ?? 'Pick sound',
      notActiveOnDesktop:
          json['notActiveOnDesktop'] as String? ?? 'When I am online',
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'notifyMe': _$PrefMessageNotificationEnumMap[instance.notifyMe],
      'differentSettingsForMobile': instance.differentSettingsForMobile,
      'meetingStart': instance.meetingStart,
      'repliesToThread': instance.repliesToThread,
      'keyword': instance.keyword,
      'duration': instance.duration,
      'from': instance.from,
      'to': instance.to,
      'includePreview': instance.includePreview,
      'muteAll': instance.muteAll,
      'messageSound': instance.messageSound,
      'loungeSound': instance.loungeSound,
      'flashOnNotification':
          _$FlashWindowsEnumMap[instance.flashOnNotification],
      'deliverSound': instance.deliverSound,
      'notActiveOnDesktop': instance.notActiveOnDesktop,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$PrefMessageNotificationEnumMap = {
  PrefMessageNotification.AllMessages: 'AllMessages',
  PrefMessageNotification.DirectMessages: 'DirectMessages',
  PrefMessageNotification.None: 'None',
};

const _$FlashWindowsEnumMap = {
  FlashWindows.Never: 'Never',
  FlashWindows.WhenIdle: 'WhenIdle',
  FlashWindows.Always: 'Always',
};
