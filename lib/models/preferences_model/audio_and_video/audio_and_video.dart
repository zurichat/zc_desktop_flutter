import 'package:freezed_annotation/freezed_annotation.dart';
part 'audio_and_video.freezed.dart';
part 'audio_and_video.g.dart';

@freezed
class AudioAndVideo with _$AudioAndVideo {
  const factory AudioAndVideo({
    @Default(true) bool enableMic,
    @Default(true) bool setMyStatusOnCall,
    @Default(false) bool muteOnMic,
    @Default(true) bool setMyStatusInHuddle,
    @Default(false) bool muteInHuddle,
    @Default(false) turnOnCaption,
    @Default(false) sendAWarning,
    @Default(true) setStatusZuriCall,
    @Default(false) muteMicZuriCall,
    @Default(true) playMusic,

  }) = _AudioAndVideo;

  factory AudioAndVideo.fromJson(Map<String, dynamic> json) => _$AudioAndVideoFromJson(json);
}