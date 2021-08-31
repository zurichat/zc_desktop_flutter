import 'package:freezed_annotation/freezed_annotation.dart';
part 'message.freezed.dart';
part 'message.g.dart';

// The channel Datamodel Generator. Using freezed to auto generate the need code
@freezed
class Message with _$Message {
   const factory Message({
    required String? id,
    required String? type,
    required String? text,
    required String? sentBy,
    required String? time,
     @Default(false) bool pinned,
    @Default([]) reactions,
    @Default([]) threadMessages,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

}
