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

class SendMessageResponse {
  final String status;
  final String messageId;
  final String roomId;
  final String event;
  final bool thread;
  final SendMessageResponseData data;

  SendMessageResponse(
      {required this.status,
      required this.messageId,
      required this.roomId,
      required this.event,
      required this.thread,
      required this.data});

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendMessageResponse(
      status: json['status'],
      messageId: json['message_id'],
      roomId: json['room_id'],
      event: json['event'],
      thread: json['thread'],
      data: SendMessageResponseData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message_id': messageId,
        'room_id': roomId,
        'event': event,
        'thread': thread,
        'data': data,
      };
}

class SendMessageResponseData {
  final String senderId;
  final String message;
  final String createdAt;

  SendMessageResponseData(
      {required this.senderId, required this.message, required this.createdAt});

  factory SendMessageResponseData.fromJson(Map<String, dynamic> json) {
    return SendMessageResponseData(
      senderId: json['sender_id'],
      message: json['message'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'sender_id': senderId,
        'message': message,
        'created_at': createdAt,
      };
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
