class MessagesResponse {
  int count;
  String? next;
  String? previous;
  List<Results> results;

  MessagesResponse(
      {required this.count, this.next, this.previous, required this.results});

  factory MessagesResponse.fromMap(Map<String, dynamic> json) {
    return MessagesResponse(
        count: json['count'],
        next: json['next'],
        results: json['results'].cast<Results>(),
        previous: json['previous']);
  }

  Map<String, dynamic> toMap() => {
        'count': count,
        'next': next,
        'results': results,
        'previous': previous,
      };
  
  
}

class Results {
  String id;
  String createdAt;
  List<String> media;
  String message;
  bool pinned;
  List<String> reactions;
  bool read;
  String roomId;
  List<String> savedBy;
  String senderId;
  List<String> threads;

  Results(
      {required this.id,
      required this.createdAt,
      required this.media,
      required this.message,
      required this.pinned,
      required this.reactions,
      required this.read,
      required this.roomId,
      required this.savedBy,
      required this.senderId,
      required this.threads});

  factory Results.fromMap(Map<String, dynamic> json) {
    return Results(
      id: json['_id'],
      createdAt: json['created_at'],
      media: json['media'].cast<String>(),
      message: json['message'],
      pinned: json['pinned'],
      reactions: json['reactions'].cast<String>(),
      read: json['read'],
      roomId: json['room_id'],
      savedBy: json['saved_by'].cast<String>(),
      senderId: json['sender_id'],
      threads: json['threads'].cast<String>(),
    );
  }

  Map<String, dynamic> toMap() => {
        '_id': id,
        'created_at': createdAt,
        'room_id': roomId,
        'media': media,
        'message': message,
        'pinned': pinned,
        'reactions': reactions,
        'read': read,
        'saved_by': savedBy,
        'sender_id': senderId,
        'threads': threads,
      };
}

class MarkMessageAsReadResponse {
  final bool read;
  MarkMessageAsReadResponse({required this.read});

  factory MarkMessageAsReadResponse.fromJson(Map<String, dynamic> json) {
    return MarkMessageAsReadResponse(
      read: json['read'],
    );
  }

  Map<String, dynamic> toJson() => {
        'read': read,
      };
}
