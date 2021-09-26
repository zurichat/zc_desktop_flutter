// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SendMessageResponse _$$_SendMessageResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SendMessageResponse(
      status: json['status'] as String? ?? '',
      message_id: json['message_id'] as String? ?? '',
      room_id: json['room_id'] as String? ?? '',
      event: json['event'] as String? ?? '',
      thread: json['thread'] as bool? ?? false,
      data: SendMessageResponseData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SendMessageResponseToJson(
        _$_SendMessageResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message_id': instance.message_id,
      'room_id': instance.room_id,
      'event': instance.event,
      'thread': instance.thread,
      'data': instance.data,
    };

_$_SendMessageResponseData _$$_SendMessageResponseDataFromJson(
        Map<String, dynamic> json) =>
    _$_SendMessageResponseData(
      sender_id: json['sender_id'] as String? ?? '',
      message: json['message'] as String? ?? '',
      created_at: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$$_SendMessageResponseDataToJson(
        _$_SendMessageResponseData instance) =>
    <String, dynamic>{
      'sender_id': instance.sender_id,
      'message': instance.message,
      'created_at': instance.created_at,
    };
