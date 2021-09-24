

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/messages_media_preference/message_media_preferenceview.dart';

part 'messages_and_media.freezed.dart';
part 'messages_and_media.g.dart';

@freezed
class MessagesAndMedia with _$MessagesAndMedia {
  const factory MessagesAndMedia({
    @Default(PrefTheme.Compact) PrefTheme theme,
    @Default(PrefTheme.JustDisplayNames) PrefTheme name,
    @Default(true) bool displayInfo,
    @Default(false) bool showTime,
    @Default(true) bool disPlayColor,
    @Default(false) bool displayEmojiAsPlain,
    @Default(true) bool showJumbomoji,
    @Default(true) bool showUploadPreview,
    @Default(true) bool showLinkPreview,
    @Default(false) bool largerThan2,
    @Default(false) bool showLinkPreviewText,
  }) = _MessagesAndMedia;

  factory MessagesAndMedia.fromJson(Map<String, dynamic> json) => _$MessagesAndMediaFromJson(json);

}