// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      senderId: json['senderId'] as String?,
      senderName: json['senderName'] as String?,
      roomId: json['roomId'] as String?,
      createdAt: json['createdAt'] as String?,
      read: json['read'] as String?,
      readAt: json['readAt'] as String?,
      edited: json['edited'] as String?,
      editedAt: json['editedAt'] as String?,
      deleted: json['deleted'] as String?,
      deletedAt: json['deletedAt'] as String?,
      status: json['status'] as String?,
      messageString: json['messageString'] as String?,
      messageId: json['messageId'] as String?,
      messageContent: json['messageContent'] as String?,
      reactions: json['reactions'] ?? [],
      recievedBy: json['recievedBy'] ?? [],
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'roomId': instance.roomId,
      'createdAt': instance.createdAt,
      'read': instance.read,
      'readAt': instance.readAt,
      'edited': instance.edited,
      'editedAt': instance.editedAt,
      'deleted': instance.deleted,
      'deletedAt': instance.deletedAt,
      'status': instance.status,
      'messageString': instance.messageString,
      'messageId': instance.messageId,
      'messageContent': instance.messageContent,
      'reactions': instance.reactions,
      'recievedBy': instance.recievedBy,
    };
