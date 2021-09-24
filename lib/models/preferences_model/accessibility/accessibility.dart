import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/accessibility/accessibility_viewmodel.dart';

part 'accessibility.freezed.dart';
part 'accessibility.g.dart';

@freezed
class Accessibility with _$Accessibility {
  factory Accessibility({
    @Default(false) bool animateValue,
    @Default(false) bool msgSound,
    @Default(false) bool sentMsgSound,
    @Default(false) bool receiveSound,
    @Default(false) bool readIncoming,
    @Default(UpButtonsChoice.option1) UpButtonsChoice upButtonsChoice

  }) = _Accessibility;

  factory Accessibility.fromJson(Map<String, dynamic> json) => _$AccessibilityFromJson(json);
}