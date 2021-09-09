// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'channel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return _Channel.fromJson(json);
}

/// @nodoc
class _$ChannelTearOff {
  const _$ChannelTearOff();

  _Channel call(
      {required String? ownerId,
      required String? roomName,
      required String? roomType,
      required String? createdAt,
      required String? archived,
      required String? archivedBy,
      required String? archivedAt,
      required String? roomPrivacy,
      dynamic members = const []}) {
    return _Channel(
      ownerId: ownerId,
      roomName: roomName,
      roomType: roomType,
      createdAt: createdAt,
      archived: archived,
      archivedBy: archivedBy,
      archivedAt: archivedAt,
      roomPrivacy: roomPrivacy,
      members: members,
    );
  }

  Channel fromJson(Map<String, Object> json) {
    return Channel.fromJson(json);
  }
}

/// @nodoc
const $Channel = _$ChannelTearOff();

/// @nodoc
mixin _$Channel {
  String? get ownerId => throw _privateConstructorUsedError;
  String? get roomName => throw _privateConstructorUsedError;
  String? get roomType => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get archived => throw _privateConstructorUsedError;
  String? get archivedBy => throw _privateConstructorUsedError;
  String? get archivedAt => throw _privateConstructorUsedError;
  String? get roomPrivacy => throw _privateConstructorUsedError;
  dynamic get members => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelCopyWith<Channel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelCopyWith<$Res> {
  factory $ChannelCopyWith(Channel value, $Res Function(Channel) then) =
      _$ChannelCopyWithImpl<$Res>;
  $Res call(
      {String? ownerId,
      String? roomName,
      String? roomType,
      String? createdAt,
      String? archived,
      String? archivedBy,
      String? archivedAt,
      String? roomPrivacy,
      dynamic members});
}

/// @nodoc
class _$ChannelCopyWithImpl<$Res> implements $ChannelCopyWith<$Res> {
  _$ChannelCopyWithImpl(this._value, this._then);

  final Channel _value;
  // ignore: unused_field
  final $Res Function(Channel) _then;

  @override
  $Res call({
    Object? ownerId = freezed,
    Object? roomName = freezed,
    Object? roomType = freezed,
    Object? createdAt = freezed,
    Object? archived = freezed,
    Object? archivedBy = freezed,
    Object? archivedAt = freezed,
    Object? roomPrivacy = freezed,
    Object? members = freezed,
  }) {
    return _then(_value.copyWith(
      ownerId: ownerId == freezed
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      roomName: roomName == freezed
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String?,
      roomType: roomType == freezed
          ? _value.roomType
          : roomType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      archived: archived == freezed
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as String?,
      archivedBy: archivedBy == freezed
          ? _value.archivedBy
          : archivedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      archivedAt: archivedAt == freezed
          ? _value.archivedAt
          : archivedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      roomPrivacy: roomPrivacy == freezed
          ? _value.roomPrivacy
          : roomPrivacy // ignore: cast_nullable_to_non_nullable
              as String?,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$ChannelCopyWith<$Res> implements $ChannelCopyWith<$Res> {
  factory _$ChannelCopyWith(_Channel value, $Res Function(_Channel) then) =
      __$ChannelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? ownerId,
      String? roomName,
      String? roomType,
      String? createdAt,
      String? archived,
      String? archivedBy,
      String? archivedAt,
      String? roomPrivacy,
      dynamic members});
}

/// @nodoc
class __$ChannelCopyWithImpl<$Res> extends _$ChannelCopyWithImpl<$Res>
    implements _$ChannelCopyWith<$Res> {
  __$ChannelCopyWithImpl(_Channel _value, $Res Function(_Channel) _then)
      : super(_value, (v) => _then(v as _Channel));

  @override
  _Channel get _value => super._value as _Channel;

  @override
  $Res call({
    Object? ownerId = freezed,
    Object? roomName = freezed,
    Object? roomType = freezed,
    Object? createdAt = freezed,
    Object? archived = freezed,
    Object? archivedBy = freezed,
    Object? archivedAt = freezed,
    Object? roomPrivacy = freezed,
    Object? members = freezed,
  }) {
    return _then(_Channel(
      ownerId: ownerId == freezed
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      roomName: roomName == freezed
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String?,
      roomType: roomType == freezed
          ? _value.roomType
          : roomType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      archived: archived == freezed
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as String?,
      archivedBy: archivedBy == freezed
          ? _value.archivedBy
          : archivedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      archivedAt: archivedAt == freezed
          ? _value.archivedAt
          : archivedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      roomPrivacy: roomPrivacy == freezed
          ? _value.roomPrivacy
          : roomPrivacy // ignore: cast_nullable_to_non_nullable
              as String?,
      members: members == freezed ? _value.members : members,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Channel implements _Channel {
  const _$_Channel(
      {required this.ownerId,
      required this.roomName,
      required this.roomType,
      required this.createdAt,
      required this.archived,
      required this.archivedBy,
      required this.archivedAt,
      required this.roomPrivacy,
      this.members = const []});

  factory _$_Channel.fromJson(Map<String, dynamic> json) =>
      _$$_ChannelFromJson(json);

  @override
  final String? ownerId;
  @override
  final String? roomName;
  @override
  final String? roomType;
  @override
  final String? createdAt;
  @override
  final String? archived;
  @override
  final String? archivedBy;
  @override
  final String? archivedAt;
  @override
  final String? roomPrivacy;
  @JsonKey(defaultValue: const [])
  @override
  final dynamic members;

  @override
  String toString() {
    return 'Channel(ownerId: $ownerId, roomName: $roomName, roomType: $roomType, createdAt: $createdAt, archived: $archived, archivedBy: $archivedBy, archivedAt: $archivedAt, roomPrivacy: $roomPrivacy, members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Channel &&
            (identical(other.ownerId, ownerId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerId, ownerId)) &&
            (identical(other.roomName, roomName) ||
                const DeepCollectionEquality()
                    .equals(other.roomName, roomName)) &&
            (identical(other.roomType, roomType) ||
                const DeepCollectionEquality()
                    .equals(other.roomType, roomType)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.archived, archived) ||
                const DeepCollectionEquality()
                    .equals(other.archived, archived)) &&
            (identical(other.archivedBy, archivedBy) ||
                const DeepCollectionEquality()
                    .equals(other.archivedBy, archivedBy)) &&
            (identical(other.archivedAt, archivedAt) ||
                const DeepCollectionEquality()
                    .equals(other.archivedAt, archivedAt)) &&
            (identical(other.roomPrivacy, roomPrivacy) ||
                const DeepCollectionEquality()
                    .equals(other.roomPrivacy, roomPrivacy)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality().equals(other.members, members)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ownerId) ^
      const DeepCollectionEquality().hash(roomName) ^
      const DeepCollectionEquality().hash(roomType) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(archived) ^
      const DeepCollectionEquality().hash(archivedBy) ^
      const DeepCollectionEquality().hash(archivedAt) ^
      const DeepCollectionEquality().hash(roomPrivacy) ^
      const DeepCollectionEquality().hash(members);

  @JsonKey(ignore: true)
  @override
  _$ChannelCopyWith<_Channel> get copyWith =>
      __$ChannelCopyWithImpl<_Channel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChannelToJson(this);
  }
}

abstract class _Channel implements Channel {
  const factory _Channel(
      {required String? ownerId,
      required String? roomName,
      required String? roomType,
      required String? createdAt,
      required String? archived,
      required String? archivedBy,
      required String? archivedAt,
      required String? roomPrivacy,
      dynamic members}) = _$_Channel;

  factory _Channel.fromJson(Map<String, dynamic> json) = _$_Channel.fromJson;

  @override
  String? get ownerId => throw _privateConstructorUsedError;
  @override
  String? get roomName => throw _privateConstructorUsedError;
  @override
  String? get roomType => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get archived => throw _privateConstructorUsedError;
  @override
  String? get archivedBy => throw _privateConstructorUsedError;
  @override
  String? get archivedAt => throw _privateConstructorUsedError;
  @override
  String? get roomPrivacy => throw _privateConstructorUsedError;
  @override
  dynamic get members => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChannelCopyWith<_Channel> get copyWith =>
      throw _privateConstructorUsedError;
}
