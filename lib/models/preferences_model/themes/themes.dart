import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/theme/theme_viewmodel.dart';
part 'themes.freezed.dart';
part 'themes.g.dart';

@freezed
class Themes with _$Themes {
  const factory Themes({
    @Default(false) bool isChecked,
    @Default(themeAccross.directMessage) themeAccross allWorkSpace,
    @Default(toggleBtwTheme.LightTheme) toggleBtwTheme switchLightDark,
    @Default(darkDramaticTheme.Null) darkDramaticTheme darkDramaTheme,
    @Default(cleanThemes.aubergine) cleanThemes cleanTheme,
  }) = _Themes;

  factory Themes.fromJson(Map<String, dynamic> json) => _$ThemesFromJson(json);

}