// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_and_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AudioAndVideo _$$_AudioAndVideoFromJson(Map<String, dynamic> json) =>
    _$_AudioAndVideo(
      enableMic: json['enableMic'] as bool? ?? true,
      setMyStatusOnCall: json['setMyStatusOnCall'] as bool? ?? true,
      muteOnMic: json['muteOnMic'] as bool? ?? false,
      setMyStatusInHuddle: json['setMyStatusInHuddle'] as bool? ?? true,
      muteInHuddle: json['muteInHuddle'] as bool? ?? false,
      turnOnCaption: json['turnOnCaption'] ?? false,
      sendAWarning: json['sendAWarning'] ?? false,
      setStatusZuriCall: json['setStatusZuriCall'] ?? true,
      muteMicZuriCall: json['muteMicZuriCall'] ?? false,
      playMusic: json['playMusic'] ?? true,
    );

Map<String, dynamic> _$$_AudioAndVideoToJson(_$_AudioAndVideo instance) =>
    <String, dynamic>{
      'enableMic': instance.enableMic,
      'setMyStatusOnCall': instance.setMyStatusOnCall,
      'muteOnMic': instance.muteOnMic,
      'setMyStatusInHuddle': instance.setMyStatusInHuddle,
      'muteInHuddle': instance.muteInHuddle,
      'turnOnCaption': instance.turnOnCaption,
      'sendAWarning': instance.sendAWarning,
      'setStatusZuriCall': instance.setStatusZuriCall,
      'muteMicZuriCall': instance.muteMicZuriCall,
      'playMusic': instance.playMusic,
    };
