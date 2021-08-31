// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message.dart';

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
      {required String? id,
      required String? type,
      required String? text,
      required String? sentBy,
      required String? time,
      bool pinned = false,
      dynamic reactions = const [],
      dynamic threadMessages = const []}) {
    return _Message(
      id: id,
      type: type,
      text: text,
      sentBy: sentBy,
      time: time,
      pinned: pinned,
      reactions: reactions,
      threadMessages: threadMessages,
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
  String? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get sentBy => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  bool get pinned => throw _privateConstructorUsedError;
  dynamic get reactions => throw _privateConstructorUsedError;
  dynamic get threadMessages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? type,
      String? text,
      String? sentBy,
      String? time,
      bool pinned,
      dynamic reactions,
      dynamic threadMessages});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? text = freezed,
    Object? sentBy = freezed,
    Object? time = freezed,
    Object? pinned = freezed,
    Object? reactions = freezed,
    Object? threadMessages = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      sentBy: sentBy == freezed
          ? _value.sentBy
          : sentBy // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      pinned: pinned == freezed
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      reactions: reactions == freezed
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      threadMessages: threadMessages == freezed
          ? _value.threadMessages
          : threadMessages // ignore: cast_nullable_to_non_nullable
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
      {String? id,
      String? type,
      String? text,
      String? sentBy,
      String? time,
      bool pinned,
      dynamic reactions,
      dynamic threadMessages});
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
    Object? id = freezed,
    Object? type = freezed,
    Object? text = freezed,
    Object? sentBy = freezed,
    Object? time = freezed,
    Object? pinned = freezed,
    Object? reactions = freezed,
    Object? threadMessages = freezed,
  }) {
    return _then(_Message(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      sentBy: sentBy == freezed
          ? _value.sentBy
          : sentBy // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      pinned: pinned == freezed
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      reactions: reactions == freezed ? _value.reactions : reactions,
      threadMessages:
          threadMessages == freezed ? _value.threadMessages : threadMessages,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message implements _Message {
  const _$_Message(
      {required this.id,
      required this.type,
      required this.text,
      required this.sentBy,
      required this.time,
      this.pinned = false,
      this.reactions = const [],
      this.threadMessages = const []});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  @override
  final String? id;
  @override
  final String? type;
  @override
  final String? text;
  @override
  final String? sentBy;
  @override
  final String? time;
  @JsonKey(defaultValue: false)
  @override
  final bool pinned;
  @JsonKey(defaultValue: const [])
  @override
  final dynamic reactions;
  @JsonKey(defaultValue: const [])
  @override
  final dynamic threadMessages;

  @override
  String toString() {
    return 'Message(id: $id, type: $type, text: $text, sentBy: $sentBy, time: $time, pinned: $pinned, reactions: $reactions, threadMessages: $threadMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Message &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.sentBy, sentBy) ||
                const DeepCollectionEquality().equals(other.sentBy, sentBy)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.pinned, pinned) ||
                const DeepCollectionEquality().equals(other.pinned, pinned)) &&
            (identical(other.reactions, reactions) ||
                const DeepCollectionEquality()
                    .equals(other.reactions, reactions)) &&
            (identical(other.threadMessages, threadMessages) ||
                const DeepCollectionEquality()
                    .equals(other.threadMessages, threadMessages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(sentBy) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(pinned) ^
      const DeepCollectionEquality().hash(reactions) ^
      const DeepCollectionEquality().hash(threadMessages);

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
      {required String? id,
      required String? type,
      required String? text,
      required String? sentBy,
      required String? time,
      bool pinned,
      dynamic reactions,
      dynamic threadMessages}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  String? get text => throw _privateConstructorUsedError;
  @override
  String? get sentBy => throw _privateConstructorUsedError;
  @override
  String? get time => throw _privateConstructorUsedError;
  @override
  bool get pinned => throw _privateConstructorUsedError;
  @override
  dynamic get reactions => throw _privateConstructorUsedError;
  @override
  dynamic get threadMessages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessageCopyWith<_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
