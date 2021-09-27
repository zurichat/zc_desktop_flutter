import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'channels_datamodel.freezed.dart';
part 'channels_datamodel.g.dart';

class Channel {
  String? id;
  String? name;
  String? owner;
  String? description;
  bool private;

  Channel({
    required this.id,
    required this.name,
    required this.owner,
    required this.description,
    required this.private,
  });

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      id: map['_id'],
      name: map['name'],
      owner: map['owner'],
      description: map['description'],
      private: map['private'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'owner': owner,
      'description': description,
      'private': private,
    };
  }

  String toJson() => json.encode(toMap());

  factory Channel.fromJson(String source) =>
      Channel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChannelsDataModel(id: $id, name: $name, owner: $owner, description: $description, private: $private)';
  }
}



@freezed
class ChannelMessagesResponse with _$ChannelMessagesResponse{

  factory ChannelMessagesResponse({
    int? status,
    String? message,
    @Default([]) List<ChannelMessage> data
  }) = _ChannelMessagesResponse; 
  
  factory ChannelMessagesResponse.fromJson(Map<String, dynamic> json) => _$ChannelMessagesResponseFromJson(json);
}

@freezed
class ChannelMessage with _$ChannelMessage{
  
  factory ChannelMessage(
      {@Default('') @JsonKey(name: '_id') String id,
      @Default('') String content,
      @Default('') String channel_id,
      @Default('') String timestamp,
      @Default('') String user_id,})= _ChannelMessage;

  factory ChannelMessage.fromJson(Map<String, dynamic> json) => _$ChannelMessageFromJson(json);
}