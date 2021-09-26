// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'room_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendMessageResponse _$SendMessageResponseFromJson(Map<String, dynamic> json) {
  return _SendMessageResponse.fromJson(json);
}

/// @nodoc
class _$SendMessageResponseTearOff {
  const _$SendMessageResponseTearOff();

  _SendMessageResponse call(
      {String status = '',
      String message_id = '',
      String room_id = '',
      String event = '',
      bool thread = false,
      required SendMessageResponseData data}) {
    return _SendMessageResponse(
      status: status,
      message_id: message_id,
      room_id: room_id,
      event: event,
      thread: thread,
      data: data,
    );
  }

  SendMessageResponse fromJson(Map<String, Object> json) {
    return SendMessageResponse.fromJson(json);
  }
}

/// @nodoc
const $SendMessageResponse = _$SendMessageResponseTearOff();

/// @nodoc
mixin _$SendMessageResponse {
  String get status => throw _privateConstructorUsedError;
  String get message_id => throw _privateConstructorUsedError;
  String get room_id => throw _privateConstructorUsedError;
  String get event => throw _privateConstructorUsedError;
  bool get thread => throw _privateConstructorUsedError;
  SendMessageResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendMessageResponseCopyWith<SendMessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageResponseCopyWith<$Res> {
  factory $SendMessageResponseCopyWith(
          SendMessageResponse value, $Res Function(SendMessageResponse) then) =
      _$SendMessageResponseCopyWithImpl<$Res>;
  $Res call(
      {String status,
      String message_id,
      String room_id,
      String event,
      bool thread,
      SendMessageResponseData data});

  $SendMessageResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$SendMessageResponseCopyWithImpl<$Res>
    implements $SendMessageResponseCopyWith<$Res> {
  _$SendMessageResponseCopyWithImpl(this._value, this._then);

  final SendMessageResponse _value;
  // ignore: unused_field
  final $Res Function(SendMessageResponse) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? message_id = freezed,
    Object? room_id = freezed,
    Object? event = freezed,
    Object? thread = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message_id: message_id == freezed
          ? _value.message_id
          : message_id // ignore: cast_nullable_to_non_nullable
              as String,
      room_id: room_id == freezed
          ? _value.room_id
          : room_id // ignore: cast_nullable_to_non_nullable
              as String,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      thread: thread == freezed
          ? _value.thread
          : thread // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SendMessageResponseData,
    ));
  }

  @override
  $SendMessageResponseDataCopyWith<$Res> get data {
    return $SendMessageResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$SendMessageResponseCopyWith<$Res>
    implements $SendMessageResponseCopyWith<$Res> {
  factory _$SendMessageResponseCopyWith(_SendMessageResponse value,
          $Res Function(_SendMessageResponse) then) =
      __$SendMessageResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String status,
      String message_id,
      String room_id,
      String event,
      bool thread,
      SendMessageResponseData data});

  @override
  $SendMessageResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$SendMessageResponseCopyWithImpl<$Res>
    extends _$SendMessageResponseCopyWithImpl<$Res>
    implements _$SendMessageResponseCopyWith<$Res> {
  __$SendMessageResponseCopyWithImpl(
      _SendMessageResponse _value, $Res Function(_SendMessageResponse) _then)
      : super(_value, (v) => _then(v as _SendMessageResponse));

  @override
  _SendMessageResponse get _value => super._value as _SendMessageResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? message_id = freezed,
    Object? room_id = freezed,
    Object? event = freezed,
    Object? thread = freezed,
    Object? data = freezed,
  }) {
    return _then(_SendMessageResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message_id: message_id == freezed
          ? _value.message_id
          : message_id // ignore: cast_nullable_to_non_nullable
              as String,
      room_id: room_id == freezed
          ? _value.room_id
          : room_id // ignore: cast_nullable_to_non_nullable
              as String,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      thread: thread == freezed
          ? _value.thread
          : thread // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SendMessageResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SendMessageResponse implements _SendMessageResponse {
  _$_SendMessageResponse(
      {this.status = '',
      this.message_id = '',
      this.room_id = '',
      this.event = '',
      this.thread = false,
      required this.data});

  factory _$_SendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SendMessageResponseFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String status;
  @JsonKey(defaultValue: '')
  @override
  final String message_id;
  @JsonKey(defaultValue: '')
  @override
  final String room_id;
  @JsonKey(defaultValue: '')
  @override
  final String event;
  @JsonKey(defaultValue: false)
  @override
  final bool thread;
  @override
  final SendMessageResponseData data;

  @override
  String toString() {
    return 'SendMessageResponse(status: $status, message_id: $message_id, room_id: $room_id, event: $event, thread: $thread, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SendMessageResponse &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message_id, message_id) ||
                const DeepCollectionEquality()
                    .equals(other.message_id, message_id)) &&
            (identical(other.room_id, room_id) ||
                const DeepCollectionEquality()
                    .equals(other.room_id, room_id)) &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)) &&
            (identical(other.thread, thread) ||
                const DeepCollectionEquality().equals(other.thread, thread)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message_id) ^
      const DeepCollectionEquality().hash(room_id) ^
      const DeepCollectionEquality().hash(event) ^
      const DeepCollectionEquality().hash(thread) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$SendMessageResponseCopyWith<_SendMessageResponse> get copyWith =>
      __$SendMessageResponseCopyWithImpl<_SendMessageResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SendMessageResponseToJson(this);
  }
}

abstract class _SendMessageResponse implements SendMessageResponse {
  factory _SendMessageResponse(
      {String status,
      String message_id,
      String room_id,
      String event,
      bool thread,
      required SendMessageResponseData data}) = _$_SendMessageResponse;

  factory _SendMessageResponse.fromJson(Map<String, dynamic> json) =
      _$_SendMessageResponse.fromJson;

  @override
  String get status => throw _privateConstructorUsedError;
  @override
  String get message_id => throw _privateConstructorUsedError;
  @override
  String get room_id => throw _privateConstructorUsedError;
  @override
  String get event => throw _privateConstructorUsedError;
  @override
  bool get thread => throw _privateConstructorUsedError;
  @override
  SendMessageResponseData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SendMessageResponseCopyWith<_SendMessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

SendMessageResponseData _$SendMessageResponseDataFromJson(
    Map<String, dynamic> json) {
  return _SendMessageResponseData.fromJson(json);
}

/// @nodoc
class _$SendMessageResponseDataTearOff {
  const _$SendMessageResponseDataTearOff();

  _SendMessageResponseData call(
      {String sender_id = '', String message = '', String created_at = ''}) {
    return _SendMessageResponseData(
      sender_id: sender_id,
      message: message,
      created_at: created_at,
    );
  }

  SendMessageResponseData fromJson(Map<String, Object> json) {
    return SendMessageResponseData.fromJson(json);
  }
}

/// @nodoc
const $SendMessageResponseData = _$SendMessageResponseDataTearOff();

/// @nodoc
mixin _$SendMessageResponseData {
  String get sender_id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendMessageResponseDataCopyWith<SendMessageResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageResponseDataCopyWith<$Res> {
  factory $SendMessageResponseDataCopyWith(SendMessageResponseData value,
          $Res Function(SendMessageResponseData) then) =
      _$SendMessageResponseDataCopyWithImpl<$Res>;
  $Res call({String sender_id, String message, String created_at});
}

/// @nodoc
class _$SendMessageResponseDataCopyWithImpl<$Res>
    implements $SendMessageResponseDataCopyWith<$Res> {
  _$SendMessageResponseDataCopyWithImpl(this._value, this._then);

  final SendMessageResponseData _value;
  // ignore: unused_field
  final $Res Function(SendMessageResponseData) _then;

  @override
  $Res call({
    Object? sender_id = freezed,
    Object? message = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_value.copyWith(
      sender_id: sender_id == freezed
          ? _value.sender_id
          : sender_id // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SendMessageResponseDataCopyWith<$Res>
    implements $SendMessageResponseDataCopyWith<$Res> {
  factory _$SendMessageResponseDataCopyWith(_SendMessageResponseData value,
          $Res Function(_SendMessageResponseData) then) =
      __$SendMessageResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({String sender_id, String message, String created_at});
}

/// @nodoc
class __$SendMessageResponseDataCopyWithImpl<$Res>
    extends _$SendMessageResponseDataCopyWithImpl<$Res>
    implements _$SendMessageResponseDataCopyWith<$Res> {
  __$SendMessageResponseDataCopyWithImpl(_SendMessageResponseData _value,
      $Res Function(_SendMessageResponseData) _then)
      : super(_value, (v) => _then(v as _SendMessageResponseData));

  @override
  _SendMessageResponseData get _value =>
      super._value as _SendMessageResponseData;

  @override
  $Res call({
    Object? sender_id = freezed,
    Object? message = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_SendMessageResponseData(
      sender_id: sender_id == freezed
          ? _value.sender_id
          : sender_id // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SendMessageResponseData implements _SendMessageResponseData {
  _$_SendMessageResponseData(
      {this.sender_id = '', this.message = '', this.created_at = ''});

  factory _$_SendMessageResponseData.fromJson(Map<String, dynamic> json) =>
      _$$_SendMessageResponseDataFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String sender_id;
  @JsonKey(defaultValue: '')
  @override
  final String message;
  @JsonKey(defaultValue: '')
  @override
  final String created_at;

  @override
  String toString() {
    return 'SendMessageResponseData(sender_id: $sender_id, message: $message, created_at: $created_at)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SendMessageResponseData &&
            (identical(other.sender_id, sender_id) ||
                const DeepCollectionEquality()
                    .equals(other.sender_id, sender_id)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sender_id) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(created_at);

  @JsonKey(ignore: true)
  @override
  _$SendMessageResponseDataCopyWith<_SendMessageResponseData> get copyWith =>
      __$SendMessageResponseDataCopyWithImpl<_SendMessageResponseData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SendMessageResponseDataToJson(this);
  }
}

abstract class _SendMessageResponseData implements SendMessageResponseData {
  factory _SendMessageResponseData(
      {String sender_id,
      String message,
      String created_at}) = _$_SendMessageResponseData;

  factory _SendMessageResponseData.fromJson(Map<String, dynamic> json) =
      _$_SendMessageResponseData.fromJson;

  @override
  String get sender_id => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get created_at => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SendMessageResponseDataCopyWith<_SendMessageResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}
