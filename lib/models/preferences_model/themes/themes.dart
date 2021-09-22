import 'package:freezed_annotation/freezed_annotation.dart';
part 'themes.freezed.dart';
part 'themes.g.dart';

@freezed
class Themes with _$Themes {
  const factory Themes({
    @Default(false) bool syncWithOS,
    @Default('Light') String themes,
    @Default('Aubergine') String colors,
  }) = _Themes;

  factory Themes.fromJson(Map<String, dynamic> json) => _$ThemesFromJson(json);

}