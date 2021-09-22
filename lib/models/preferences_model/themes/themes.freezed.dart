// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'themes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Themes _$ThemesFromJson(Map<String, dynamic> json) {
  return _Themes.fromJson(json);
}

/// @nodoc
class _$ThemesTearOff {
  const _$ThemesTearOff();

  _Themes call(
      {bool syncWithOS = false,
      String themes = 'Light',
      String colors = 'Aubergine'}) {
    return _Themes(
      syncWithOS: syncWithOS,
      themes: themes,
      colors: colors,
    );
  }

  Themes fromJson(Map<String, Object> json) {
    return Themes.fromJson(json);
  }
}

/// @nodoc
const $Themes = _$ThemesTearOff();

/// @nodoc
mixin _$Themes {
  bool get syncWithOS => throw _privateConstructorUsedError;
  String get themes => throw _privateConstructorUsedError;
  String get colors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThemesCopyWith<Themes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemesCopyWith<$Res> {
  factory $ThemesCopyWith(Themes value, $Res Function(Themes) then) =
      _$ThemesCopyWithImpl<$Res>;
  $Res call({bool syncWithOS, String themes, String colors});
}

/// @nodoc
class _$ThemesCopyWithImpl<$Res> implements $ThemesCopyWith<$Res> {
  _$ThemesCopyWithImpl(this._value, this._then);

  final Themes _value;
  // ignore: unused_field
  final $Res Function(Themes) _then;

  @override
  $Res call({
    Object? syncWithOS = freezed,
    Object? themes = freezed,
    Object? colors = freezed,
  }) {
    return _then(_value.copyWith(
      syncWithOS: syncWithOS == freezed
          ? _value.syncWithOS
          : syncWithOS // ignore: cast_nullable_to_non_nullable
              as bool,
      themes: themes == freezed
          ? _value.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as String,
      colors: colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ThemesCopyWith<$Res> implements $ThemesCopyWith<$Res> {
  factory _$ThemesCopyWith(_Themes value, $Res Function(_Themes) then) =
      __$ThemesCopyWithImpl<$Res>;
  @override
  $Res call({bool syncWithOS, String themes, String colors});
}

/// @nodoc
class __$ThemesCopyWithImpl<$Res> extends _$ThemesCopyWithImpl<$Res>
    implements _$ThemesCopyWith<$Res> {
  __$ThemesCopyWithImpl(_Themes _value, $Res Function(_Themes) _then)
      : super(_value, (v) => _then(v as _Themes));

  @override
  _Themes get _value => super._value as _Themes;

  @override
  $Res call({
    Object? syncWithOS = freezed,
    Object? themes = freezed,
    Object? colors = freezed,
  }) {
    return _then(_Themes(
      syncWithOS: syncWithOS == freezed
          ? _value.syncWithOS
          : syncWithOS // ignore: cast_nullable_to_non_nullable
              as bool,
      themes: themes == freezed
          ? _value.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as String,
      colors: colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Themes implements _Themes {
  const _$_Themes(
      {this.syncWithOS = false,
      this.themes = 'Light',
      this.colors = 'Aubergine'});

  factory _$_Themes.fromJson(Map<String, dynamic> json) =>
      _$$_ThemesFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool syncWithOS;
  @JsonKey(defaultValue: 'Light')
  @override
  final String themes;
  @JsonKey(defaultValue: 'Aubergine')
  @override
  final String colors;

  @override
  String toString() {
    return 'Themes(syncWithOS: $syncWithOS, themes: $themes, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Themes &&
            (identical(other.syncWithOS, syncWithOS) ||
                const DeepCollectionEquality()
                    .equals(other.syncWithOS, syncWithOS)) &&
            (identical(other.themes, themes) ||
                const DeepCollectionEquality().equals(other.themes, themes)) &&
            (identical(other.colors, colors) ||
                const DeepCollectionEquality().equals(other.colors, colors)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(syncWithOS) ^
      const DeepCollectionEquality().hash(themes) ^
      const DeepCollectionEquality().hash(colors);

  @JsonKey(ignore: true)
  @override
  _$ThemesCopyWith<_Themes> get copyWith =>
      __$ThemesCopyWithImpl<_Themes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThemesToJson(this);
  }
}

abstract class _Themes implements Themes {
  const factory _Themes({bool syncWithOS, String themes, String colors}) =
      _$_Themes;

  factory _Themes.fromJson(Map<String, dynamic> json) = _$_Themes.fromJson;

  @override
  bool get syncWithOS => throw _privateConstructorUsedError;
  @override
  String get themes => throw _privateConstructorUsedError;
  @override
  String get colors => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ThemesCopyWith<_Themes> get copyWith => throw _privateConstructorUsedError;
}
