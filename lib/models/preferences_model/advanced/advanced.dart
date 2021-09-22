import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/advanced/advanced_viewmodel.dart';

part 'advanced.freezed.dart';
part 'advanced.g.dart';

@freezed
class Advanced with _$Advanced {
  const factory Advanced({
    @Default(false) bool whenTypyingCode,
    @Default(false) bool formatMessage,
    @Default(EnterButtonsChoice.sendMsg) EnterButtonsChoice writingMessage,
    @Default(false) bool startZuriChat,
    @Default(false) bool quickSwitcher,
    @Default([]) List<String> excludeThisChannels,
    @Default(true) bool alwaysScrollMessage,
    @Default(true) bool toggleAwayStatus,
    @Default(true) bool sendOccasionalSurvey,
    @Default(true) bool meliciousLinkWarning,
  }) = _Advanced;

  factory Advanced.fromJson(Map<String, dynamic> json) => _$AdvancedFromJson(json);
}