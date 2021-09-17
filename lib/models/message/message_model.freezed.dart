// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
class _$MessageTearOff {
  const _$MessageTearOff();

  _Message call(
      {required String? senderId,
      required String? senderName,
      required String? roomId,
      required String? createdAt,
      required String? read,
      required String? readAt,
      required String? edited,
      required String? editedAt,
      required String? deleted,
      required String? deletedAt,
      required String? status,
      required String? messageString,
      required String? messageId,
      required String? messageContent,
      dynamic reactions = const [],
      dynamic recievedBy = const []}) {
    return _Message(
      senderId: senderId,
      senderName: senderName,
      roomId: roomId,
      createdAt: createdAt,
      read: read,
      readAt: readAt,
      edited: edited,
      editedAt: editedAt,
      deleted: deleted,
      deletedAt: deletedAt,
      status: status,
      messageString: messageString,
      messageId: messageId,
      messageContent: messageContent,
      reactions: reactions,
      recievedBy: recievedBy,
    );
  }

  Message fromJson(Map<String, Object> json) {
    return Message.fromJson(json);
  }
}

/// @nodoc
const $Message = _$MessageTearOff();

/// @nodoc
mixin _$Message {
  String? get senderId => throw _privateConstructorUsedError;
  String? get senderName => throw _privateConstructorUsedError;
  String? get roomId => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get read => throw _privateConstructorUsedError;
  String? get readAt => throw _privateConstructorUsedError;
  String? get edited => throw _privateConstructorUsedError;
  String? get editedAt => throw _privateConstructorUsedError;
  String? get deleted => throw _privateConstructorUsedError;
  String? get deletedAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get messageString => throw _privateConstructorUsedError;
  String? get messageId => throw _privateConstructorUsedError;
  String? get messageContent => throw _privateConstructorUsedError;
  dynamic get reactions => throw _privateConstructorUsedError;
  dynamic get recievedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call(
      {String? senderId,
      String? senderName,
      String? roomId,
      String? createdAt,
      String? read,
      String? readAt,
      String? edited,
      String? editedAt,
      String? deleted,
      String? deletedAt,
      String? status,
      String? messageString,
      String? messageId,
      String? messageContent,
      dynamic reactions,
      dynamic recievedBy});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? senderId = freezed,
    Object? senderName = freezed,
    Object? roomId = freezed,
    Object? createdAt = freezed,
    Object? read = freezed,
    Object? readAt = freezed,
    Object? edited = freezed,
    Object? editedAt = freezed,
    Object? deleted = freezed,
    Object? deletedAt = freezed,
    Object? status = freezed,
    Object? messageString = freezed,
    Object? messageId = freezed,
    Object? messageContent = freezed,
    Object? reactions = freezed,
    Object? recievedBy = freezed,
  }) {
    return _then(_value.copyWith(
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: senderName == freezed
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as String?,
      readAt: readAt == freezed
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as String?,
      edited: edited == freezed
          ? _value.edited
          : edited // ignore: cast_nullable_to_non_nullable
              as String?,
      editedAt: editedAt == freezed
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted: deleted == freezed
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: deletedAt == freezed
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      messageString: messageString == freezed
          ? _value.messageString
          : messageString // ignore: cast_nullable_to_non_nullable
              as String?,
      messageId: messageId == freezed
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String?,
      messageContent: messageContent == freezed
          ? _value.messageContent
          : messageContent // ignore: cast_nullable_to_non_nullable
              as String?,
      reactions: reactions == freezed
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      recievedBy: recievedBy == freezed
          ? _value.recievedBy
          : recievedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) then) =
      __$MessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? senderId,
      String? senderName,
      String? roomId,
      String? createdAt,
      String? read,
      String? readAt,
      String? edited,
      String? editedAt,
      String? deleted,
      String? deletedAt,
      String? status,
      String? messageString,
      String? messageId,
      String? messageContent,
      dynamic reactions,
      dynamic recievedBy});
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(_Message _value, $Res Function(_Message) _then)
      : super(_value, (v) => _then(v as _Message));

  @override
  _Message get _value => super._value as _Message;

  @override
  $Res call({
    Object? senderId = freezed,
    Object? senderName = freezed,
    Object? roomId = freezed,
    Object? createdAt = freezed,
    Object? read = freezed,
    Object? readAt = freezed,
    Object? edited = freezed,
    Object? editedAt = freezed,
    Object? deleted = freezed,
    Object? deletedAt = freezed,
    Object? status = freezed,
    Object? messageString = freezed,
    Object? messageId = freezed,
    Object? messageContent = freezed,
    Object? reactions = freezed,
    Object? recievedBy = freezed,
  }) {
    return _then(_Message(
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: senderName == freezed
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as String?,
      readAt: readAt == freezed
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as String?,
      edited: edited == freezed
          ? _value.edited
          : edited // ignore: cast_nullable_to_non_nullable
              as String?,
      editedAt: editedAt == freezed
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted: deleted == freezed
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: deletedAt == freezed
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      messageString: messageString == freezed
          ? _value.messageString
          : messageString // ignore: cast_nullable_to_non_nullable
              as String?,
      messageId: messageId == freezed
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String?,
      messageContent: messageContent == freezed
          ? _value.messageContent
          : messageContent // ignore: cast_nullable_to_non_nullable
              as String?,
      reactions: reactions == freezed ? _value.reactions : reactions,
      recievedBy: recievedBy == freezed ? _value.recievedBy : recievedBy,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message implements _Message {
  const _$_Message(
      {required this.senderId,
      required this.senderName,
      required this.roomId,
      required this.createdAt,
      required this.read,
      required this.readAt,
      required this.edited,
      required this.editedAt,
      required this.deleted,
      required this.deletedAt,
      required this.status,
      required this.messageString,
      required this.messageId,
      required this.messageContent,
      this.reactions = const [],
      this.recievedBy = const []});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  @override
  final String? senderId;
  @override
  final String? senderName;
  @override
  final String? roomId;
  @override
  final String? createdAt;
  @override
  final String? read;
  @override
  final String? readAt;
  @override
  final String? edited;
  @override
  final String? editedAt;
  @override
  final String? deleted;
  @override
  final String? deletedAt;
  @override
  final String? status;
  @override
  final String? messageString;
  @override
  final String? messageId;
  @override
  final String? messageContent;
  @JsonKey(defaultValue: const [])
  @override
  final dynamic reactions;
  @JsonKey(defaultValue: const [])
  @override
  final dynamic recievedBy;

  @override
  String toString() {
    return 'Message(senderId: $senderId, senderName: $senderName, roomId: $roomId, createdAt: $createdAt, read: $read, readAt: $readAt, edited: $edited, editedAt: $editedAt, deleted: $deleted, deletedAt: $deletedAt, status: $status, messageString: $messageString, messageId: $messageId, messageContent: $messageContent, reactions: $reactions, recievedBy: $recievedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Message &&
            (identical(other.senderId, senderId) ||
                const DeepCollectionEquality()
                    .equals(other.senderId, senderId)) &&
            (identical(other.senderName, senderName) ||
                const DeepCollectionEquality()
                    .equals(other.senderName, senderName)) &&
            (identical(other.roomId, roomId) ||
                const DeepCollectionEquality().equals(other.roomId, roomId)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.read, read) ||
                const DeepCollectionEquality().equals(other.read, read)) &&
            (identical(other.readAt, readAt) ||
                const DeepCollectionEquality().equals(other.readAt, readAt)) &&
            (identical(other.edited, edited) ||
                const DeepCollectionEquality().equals(other.edited, edited)) &&
            (identical(other.editedAt, editedAt) ||
                const DeepCollectionEquality()
                    .equals(other.editedAt, editedAt)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.deletedAt, deletedAt) ||
                const DeepCollectionEquality()
                    .equals(other.deletedAt, deletedAt)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.messageString, messageString) ||
                const DeepCollectionEquality()
                    .equals(other.messageString, messageString)) &&
            (identical(other.messageId, messageId) ||
                const DeepCollectionEquality()
                    .equals(other.messageId, messageId)) &&
            (identical(other.messageContent, messageContent) ||
                const DeepCollectionEquality()
                    .equals(other.messageContent, messageContent)) &&
            (identical(other.reactions, reactions) ||
                const DeepCollectionEquality()
                    .equals(other.reactions, reactions)) &&
            (identical(other.recievedBy, recievedBy) ||
                const DeepCollectionEquality()
                    .equals(other.recievedBy, recievedBy)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(senderId) ^
      const DeepCollectionEquality().hash(senderName) ^
      const DeepCollectionEquality().hash(roomId) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(read) ^
      const DeepCollectionEquality().hash(readAt) ^
      const DeepCollectionEquality().hash(edited) ^
      const DeepCollectionEquality().hash(editedAt) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(deletedAt) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(messageString) ^
      const DeepCollectionEquality().hash(messageId) ^
      const DeepCollectionEquality().hash(messageContent) ^
      const DeepCollectionEquality().hash(reactions) ^
      const DeepCollectionEquality().hash(recievedBy);

  @JsonKey(ignore: true)
  @override
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(this);
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required String? senderId,
      required String? senderName,
      required String? roomId,
      required String? createdAt,
      required String? read,
      required String? readAt,
      required String? edited,
      required String? editedAt,
      required String? deleted,
      required String? deletedAt,
      required String? status,
      required String? messageString,
      required String? messageId,
      required String? messageContent,
      dynamic reactions,
      dynamic recievedBy}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String? get senderId => throw _privateConstructorUsedError;
  @override
  String? get senderName => throw _privateConstructorUsedError;
  @override
  String? get roomId => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get read => throw _privateConstructorUsedError;
  @override
  String? get readAt => throw _privateConstructorUsedError;
  @override
  String? get edited => throw _privateConstructorUsedError;
  @override
  String? get editedAt => throw _privateConstructorUsedError;
  @override
  String? get deleted => throw _privateConstructorUsedError;
  @override
  String? get deletedAt => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get messageString => throw _privateConstructorUsedError;
  @override
  String? get messageId => throw _privateConstructorUsedError;
  @override
  String? get messageContent => throw _privateConstructorUsedError;
  @override
  dynamic get reactions => throw _privateConstructorUsedError;
  @override
  dynamic get recievedBy => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessageCopyWith<_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
