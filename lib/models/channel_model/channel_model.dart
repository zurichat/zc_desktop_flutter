import 'package:freezed_annotation/freezed_annotation.dart';
part 'channel_model.freezed.dart';
part 'channel_model.g.dart';

// The channel Datamodel Generator. Using freezed to auto generate the need code
@freezed
class Channel with _$Channel {
   const factory Channel({
    required String? id,
    required String? createdBy,
    required String? createdOn,
    @Default([]) memberId,
    @Default([]) messages,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

}
