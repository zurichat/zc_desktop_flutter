// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_and_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessagesAndMedia _$$_MessagesAndMediaFromJson(Map<String, dynamic> json) =>
    _$_MessagesAndMedia(
      theme: _$enumDecodeNullable(_$PrefThemeEnumMap, json['theme']) ??
          PrefTheme.Compact,
      name: _$enumDecodeNullable(_$PrefThemeEnumMap, json['name']) ??
          PrefTheme.JustDisplayNames,
      displayInfo: json['displayInfo'] as bool? ?? true,
      showTime: json['showTime'] as bool? ?? false,
      disPlayColor: json['disPlayColor'] as bool? ?? true,
      displayEmojiAsPlain: json['displayEmojiAsPlain'] as bool? ?? false,
      showJumbomoji: json['showJumbomoji'] as bool? ?? true,
      showUploadPreview: json['showUploadPreview'] as bool? ?? true,
      showLinkPreview: json['showLinkPreview'] as bool? ?? true,
      largerThan2: json['largerThan2'] as bool? ?? false,
      showLinkPreviewText: json['showLinkPreviewText'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MessagesAndMediaToJson(_$_MessagesAndMedia instance) =>
    <String, dynamic>{
      'theme': _$PrefThemeEnumMap[instance.theme],
      'name': _$PrefThemeEnumMap[instance.name],
      'displayInfo': instance.displayInfo,
      'showTime': instance.showTime,
      'disPlayColor': instance.disPlayColor,
      'displayEmojiAsPlain': instance.displayEmojiAsPlain,
      'showJumbomoji': instance.showJumbomoji,
      'showUploadPreview': instance.showUploadPreview,
      'showLinkPreview': instance.showLinkPreview,
      'largerThan2': instance.largerThan2,
      'showLinkPreviewText': instance.showLinkPreviewText,
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

const _$PrefThemeEnumMap = {
  PrefTheme.Clean: 'Clean',
  PrefTheme.Compact: 'Compact',
  PrefTheme.JustDisplayNames: 'JustDisplayNames',
  PrefTheme.FullandDisplaynames: 'FullandDisplaynames',
};
