// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sidebar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SideBar _$$_SideBarFromJson(Map<String, dynamic> json) => _$_SideBar(
      sort: _$enumDecodeNullable(_$PreBarEnumMap, json['sidebar_sort']) ??
          PreBar.Alpha,
      showPictureNextToDm:
          json['show_profile_picture_next_to_dm'] as bool? ?? true,
      listPrivateChannelSeperatley:
          json['list_private_channels_seperately'] as bool? ?? false,
      organizeExternalConversation:
          json['organize_external_conversations'] as bool? ?? true,
      showConversation: _$enumDecodeNullable(
              _$PrefSidebarEnumMap, json['show_conversations']) ??
          PrefSidebar.AllConversation,
      showInsights: json['showInsights'] as bool? ?? true,
      showThreads: json['showThreads'] as bool? ?? true,
      showAllDms: json['showAllDms'] as bool? ?? true,
      showDrafts: json['showDrafts'] as bool? ?? true,
      showFiles: json['showFiles'] as bool? ?? true,
      showIntegrate: json['showIntegrate'] as bool? ?? true,
      showToDo: json['showToDo'] as bool? ?? true,
      showFileBrowser: json['showFileBrowser'] as bool? ?? false,
      showChannelBrowser: json['showChannelBrowser'] as bool? ?? false,
    );

Map<String, dynamic> _$$_SideBarToJson(_$_SideBar instance) =>
    <String, dynamic>{
      'sidebar_sort': _$PreBarEnumMap[instance.sort],
      'show_profile_picture_next_to_dm': instance.showPictureNextToDm,
      'list_private_channels_seperately': instance.listPrivateChannelSeperatley,
      'organize_external_conversations': instance.organizeExternalConversation,
      'show_conversations': _$PrefSidebarEnumMap[instance.showConversation],
      'showInsights': instance.showInsights,
      'showThreads': instance.showThreads,
      'showAllDms': instance.showAllDms,
      'showDrafts': instance.showDrafts,
      'showFiles': instance.showFiles,
      'showIntegrate': instance.showIntegrate,
      'showToDo': instance.showToDo,
      'showFileBrowser': instance.showFileBrowser,
      'showChannelBrowser': instance.showChannelBrowser,
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

const _$PreBarEnumMap = {
  PreBar.Alpha: 'Alpha',
  PreBar.Recent: 'Recent',
  PreBar.Priority: 'Priority',
};

const _$PrefSidebarEnumMap = {
  PrefSidebar.AllConversation: 'AllConversation',
  PrefSidebar.Unread: 'Unread',
  PrefSidebar.Custom: 'Custom',
};
