import 'package:freezed_annotation/freezed_annotation.dart';
part 'messages_response.freezed.dart';
part 'messages_response.g.dart';

@freezed
class MessagesResponse with _$MessagesResponse{

  factory MessagesResponse({
    @Default(0) int count,
    String? next,
    String? previous,
    @Default([]) List<Results> results
  }) = _MessagesResponse; 
  
  factory MessagesResponse.fromJson(Map<String, dynamic> json) => _$MessagesResponseFromJson(json);
}

@freezed
class Results with _$Results{
  
  factory Results(
      {@Default('') String id,
      @Default('') String created_at,
      @Default([]) List<String> media,
      @Default('') String message,
      @Default(false) bool pinned,
      @Default([]) List<String> reactions,
      @Default(false) bool read,
      @Default('') String room_id,
      @Default([]) List<String> saved_by,
      @Default('') String sender_id,
      @Default([]) List<String> threads})= _Results;

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
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
