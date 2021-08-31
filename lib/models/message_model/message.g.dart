// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as String?,
      type: json['type'] as String?,
      text: json['text'] as String?,
      sentBy: json['sentBy'] as String?,
      time: json['time'] as String?,
      pinned: json['pinned'] as bool? ?? false,
      reactions: json['reactions'] ?? [],
      threadMessages: json['threadMessages'] ?? [],
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'text': instance.text,
      'sentBy': instance.sentBy,
      'time': instance.time,
      'pinned': instance.pinned,
      'reactions': instance.reactions,
      'threadMessages': instance.threadMessages,
    };
