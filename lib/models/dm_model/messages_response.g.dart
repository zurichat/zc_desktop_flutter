// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessagesResponse _$$_MessagesResponseFromJson(Map<String, dynamic> json) =>
    _$_MessagesResponse(
      count: json['count'] as int? ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MessagesResponseToJson(_$_MessagesResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_$_Results _$$_ResultsFromJson(Map<String, dynamic> json) => _$_Results(
      id: json['id'] as String? ?? '',
      created_at: json['created_at'] as String? ?? '',
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      message: json['message'] as String? ?? '',
      pinned: json['pinned'] as bool? ?? false,
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      read: json['read'] as bool? ?? false,
      room_id: json['room_id'] as String? ?? '',
      saved_by: (json['saved_by'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      sender_id: json['sender_id'] as String? ?? '',
      threads: (json['threads'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ResultsToJson(_$_Results instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'media': instance.media,
      'message': instance.message,
      'pinned': instance.pinned,
      'reactions': instance.reactions,
      'read': instance.read,
      'room_id': instance.room_id,
      'saved_by': instance.saved_by,
      'sender_id': instance.sender_id,
      'threads': instance.threads,
    };
