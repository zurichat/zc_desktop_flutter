// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'themes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Themes _$$_ThemesFromJson(Map<String, dynamic> json) => _$_Themes(
      syncWithOS: json['syncWithOS'] as bool? ?? false,
      themes: json['themes'] as String? ?? 'Light',
      colors: json['colors'] as String? ?? 'Aubergine',
    );

Map<String, dynamic> _$$_ThemesToJson(_$_Themes instance) => <String, dynamic>{
      'syncWithOS': instance.syncWithOS,
      'themes': instance.themes,
      'colors': instance.colors,
    };
