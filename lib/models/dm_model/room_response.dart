import 'package:freezed_annotation/freezed_annotation.dart';
part 'room_response.freezed.dart';
part 'room_response.g.dart';

class CreateRoomResponse {
  final String roomId;

  CreateRoomResponse({
    required this.roomId,
  });

  factory CreateRoomResponse.fromMap(Map<String, dynamic> map) {
    return CreateRoomResponse(
      roomId: map['room_id'],
    );
  }

  Map<String, dynamic> toMap() => {
        "room_id": roomId,
      };

  @override
  String toString() => 'CreateRoomResponse(sessionID: $roomId)';
}

@freezed
class SendMessageResponse with _$SendMessageResponse {

  factory SendMessageResponse({ 
      @Default('') String status,
  @Default('') String message_id,
  @Default('') String room_id,
  @Default('') String event,
  @Default(false) bool thread,
  required SendMessageResponseData data,})= _SendMessageResponse;

factory SendMessageResponse.fromJson(Map<String, dynamic> json) => _$SendMessageResponseFromJson(json);
}

@freezed
class SendMessageResponseData with _$SendMessageResponseData {

  factory SendMessageResponseData(
      {
       @Default('') String sender_id,
  @Default('') String message,
  @Default('') String created_at,})= _SendMessageResponseData;

  factory SendMessageResponseData.fromJson(Map<String, dynamic> json) => _$SendMessageResponseDataFromJson(json);
}

class RoomInfoResponse {
  final String roomId;
  final String orgId;
  final String createdAt;
  final String description;
  final String numberOfUsers;
  final List<String> roomUserIds;

  RoomInfoResponse(
      {required this.createdAt,
      required this.description,
      required this.numberOfUsers,
      required this.orgId,
      required this.roomId,
      required this.roomUserIds});

      factory RoomInfoResponse.fromJson(Map<String, dynamic> json) {
    return RoomInfoResponse(
      description: json['description'],
      numberOfUsers: json['Number of users'],
      roomId: json['room_id'],
      orgId: json['org_id'],
      createdAt: json['created_at'],
      roomUserIds: json['room_user_ids'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() => {
        'room_user_ids': roomUserIds,
        'org_id': orgId,
        'room_id': roomId,
        'created_at': createdAt,
        'description': description,
        'Number of users': numberOfUsers,
      };
}
