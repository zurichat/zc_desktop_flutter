// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advanced.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Advanced _$$_AdvancedFromJson(Map<String, dynamic> json) => _$_Advanced(
      whenTypyingCode: json['whenTypyingCode'] as bool? ?? false,
      formatMessage: json['formatMessage'] as bool? ?? false,
      writingMessage: _$enumDecodeNullable(
              _$EnterButtonsChoiceEnumMap, json['writingMessage']) ??
          EnterButtonsChoice.sendMsg,
      startZuriChat: json['startZuriChat'] as bool? ?? false,
      quickSwitcher: json['quickSwitcher'] as bool? ?? false,
      excludeThisChannels: (json['excludeThisChannels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      alwaysScrollMessage: json['alwaysScrollMessage'] as bool? ?? true,
      toggleAwayStatus: json['toggleAwayStatus'] as bool? ?? true,
      sendOccasionalSurvey: json['sendOccasionalSurvey'] as bool? ?? true,
      meliciousLinkWarning: json['meliciousLinkWarning'] as bool? ?? true,
    );

Map<String, dynamic> _$$_AdvancedToJson(_$_Advanced instance) =>
    <String, dynamic>{
      'whenTypyingCode': instance.whenTypyingCode,
      'formatMessage': instance.formatMessage,
      'writingMessage': _$EnterButtonsChoiceEnumMap[instance.writingMessage],
      'startZuriChat': instance.startZuriChat,
      'quickSwitcher': instance.quickSwitcher,
      'excludeThisChannels': instance.excludeThisChannels,
      'alwaysScrollMessage': instance.alwaysScrollMessage,
      'toggleAwayStatus': instance.toggleAwayStatus,
      'sendOccasionalSurvey': instance.sendOccasionalSurvey,
      'meliciousLinkWarning': instance.meliciousLinkWarning,
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

const _$EnterButtonsChoiceEnumMap = {
  EnterButtonsChoice.sendMsg: 'sendMsg',
  EnterButtonsChoice.newLine: 'newLine',
};
