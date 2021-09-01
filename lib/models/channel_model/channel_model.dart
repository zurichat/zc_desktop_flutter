import 'package:freezed_annotation/freezed_annotation.dart';
part 'channel_model.freezed.dart';
part 'channel_model.g.dart';

// The channel Datamodel Generator. Using freezed to auto generate the need code
@freezed
class Channel with _$Channel {
   const factory Channel({
    required String? ownerId,
    required String? roomName,
    required String? roomType,
    required String? createdAt,
    required String? archived,
    required String? archivedBy,
    required String? archivedAt,
    required String? roomPrivacy,
    @Default([]) members,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

}
