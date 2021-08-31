// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Channel _$$_ChannelFromJson(Map<String, dynamic> json) => _$_Channel(
      id: json['id'] as String?,
      createdBy: json['createdBy'] as String?,
      createdOn: json['createdOn'] as String?,
      memberId: json['memberId'] ?? [],
      messages: json['messages'] ?? [],
    );

Map<String, dynamic> _$$_ChannelToJson(_$_Channel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdBy': instance.createdBy,
      'createdOn': instance.createdOn,
      'memberId': instance.memberId,
      'messages': instance.messages,
    };
