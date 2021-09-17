import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_model.freezed.dart';
part 'message_model.g.dart';

// The channel Datamodel Generator. Using freezed to auto generate the need code
@freezed
class Message with _$Message {
  const factory Message({
    required String? senderId,
    required String? senderName,
    required String? roomId,
    required String? createdAt,
    required String? read,
    required String? readAt,
    required String? edited,
    required String? editedAt,
    required String? deleted,
    required String? deletedAt,
    required String? status,
    required String? messageString,
    required String? messageId,
    required String? messageContent,
    @Default([]) reactions,
    @Default([]) recievedBy,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
