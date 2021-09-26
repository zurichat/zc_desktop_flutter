// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'messages_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessagesResponse _$MessagesResponseFromJson(Map<String, dynamic> json) {
  return _MessagesResponse.fromJson(json);
}

/// @nodoc
class _$MessagesResponseTearOff {
  const _$MessagesResponseTearOff();

  _MessagesResponse call(
      {int count = 0,
      String? next,
      String? previous,
      List<Results> results = const []}) {
    return _MessagesResponse(
      count: count,
      next: next,
      previous: previous,
      results: results,
    );
  }

  MessagesResponse fromJson(Map<String, Object> json) {
    return MessagesResponse.fromJson(json);
  }
}

/// @nodoc
const $MessagesResponse = _$MessagesResponseTearOff();

/// @nodoc
mixin _$MessagesResponse {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Results> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessagesResponseCopyWith<MessagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesResponseCopyWith<$Res> {
  factory $MessagesResponseCopyWith(
          MessagesResponse value, $Res Function(MessagesResponse) then) =
      _$MessagesResponseCopyWithImpl<$Res>;
  $Res call({int count, String? next, String? previous, List<Results> results});
}

/// @nodoc
class _$MessagesResponseCopyWithImpl<$Res>
    implements $MessagesResponseCopyWith<$Res> {
  _$MessagesResponseCopyWithImpl(this._value, this._then);

  final MessagesResponse _value;
  // ignore: unused_field
  final $Res Function(MessagesResponse) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Results>,
    ));
  }
}

/// @nodoc
abstract class _$MessagesResponseCopyWith<$Res>
    implements $MessagesResponseCopyWith<$Res> {
  factory _$MessagesResponseCopyWith(
          _MessagesResponse value, $Res Function(_MessagesResponse) then) =
      __$MessagesResponseCopyWithImpl<$Res>;
  @override
  $Res call({int count, String? next, String? previous, List<Results> results});
}

/// @nodoc
class __$MessagesResponseCopyWithImpl<$Res>
    extends _$MessagesResponseCopyWithImpl<$Res>
    implements _$MessagesResponseCopyWith<$Res> {
  __$MessagesResponseCopyWithImpl(
      _MessagesResponse _value, $Res Function(_MessagesResponse) _then)
      : super(_value, (v) => _then(v as _MessagesResponse));

  @override
  _MessagesResponse get _value => super._value as _MessagesResponse;

  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_MessagesResponse(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Results>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessagesResponse implements _MessagesResponse {
  _$_MessagesResponse(
      {this.count = 0, this.next, this.previous, this.results = const []});

  factory _$_MessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MessagesResponseFromJson(json);

  @JsonKey(defaultValue: 0)
  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  @JsonKey(defaultValue: const [])
  @override
  final List<Results> results;

  @override
  String toString() {
    return 'MessagesResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MessagesResponse &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results);

  @JsonKey(ignore: true)
  @override
  _$MessagesResponseCopyWith<_MessagesResponse> get copyWith =>
      __$MessagesResponseCopyWithImpl<_MessagesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessagesResponseToJson(this);
  }
}

abstract class _MessagesResponse implements MessagesResponse {
  factory _MessagesResponse(
      {int count,
      String? next,
      String? previous,
      List<Results> results}) = _$_MessagesResponse;

  factory _MessagesResponse.fromJson(Map<String, dynamic> json) =
      _$_MessagesResponse.fromJson;

  @override
  int get count => throw _privateConstructorUsedError;
  @override
  String? get next => throw _privateConstructorUsedError;
  @override
  String? get previous => throw _privateConstructorUsedError;
  @override
  List<Results> get results => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessagesResponseCopyWith<_MessagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return _Results.fromJson(json);
}

/// @nodoc
class _$ResultsTearOff {
  const _$ResultsTearOff();

  _Results call(
      {String id = '',
      String created_at = '',
      List<String> media = const [],
      String message = '',
      bool pinned = false,
      List<String> reactions = const [],
      bool read = false,
      String room_id = '',
      List<String> saved_by = const [],
      String sender_id = '',
      List<String> threads = const []}) {
    return _Results(
      id: id,
      created_at: created_at,
      media: media,
      message: message,
      pinned: pinned,
      reactions: reactions,
      read: read,
      room_id: room_id,
      saved_by: saved_by,
      sender_id: sender_id,
      threads: threads,
    );
  }

  Results fromJson(Map<String, Object> json) {
    return Results.fromJson(json);
  }
}

/// @nodoc
const $Results = _$ResultsTearOff();

/// @nodoc
mixin _$Results {
  String get id => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  List<String> get media => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get pinned => throw _privateConstructorUsedError;
  List<String> get reactions => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  String get room_id => throw _privateConstructorUsedError;
  List<String> get saved_by => throw _privateConstructorUsedError;
  String get sender_id => throw _privateConstructorUsedError;
  List<String> get threads => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultsCopyWith<Results> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsCopyWith<$Res> {
  factory $ResultsCopyWith(Results value, $Res Function(Results) then) =
      _$ResultsCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String created_at,
      List<String> media,
      String message,
      bool pinned,
      List<String> reactions,
      bool read,
      String room_id,
      List<String> saved_by,
      String sender_id,
      List<String> threads});
}

/// @nodoc
class _$ResultsCopyWithImpl<$Res> implements $ResultsCopyWith<$Res> {
  _$ResultsCopyWithImpl(this._value, this._then);

  final Results _value;
  // ignore: unused_field
  final $Res Function(Results) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? created_at = freezed,
    Object? media = freezed,
    Object? message = freezed,
    Object? pinned = freezed,
    Object? reactions = freezed,
    Object? read = freezed,
    Object? room_id = freezed,
    Object? saved_by = freezed,
    Object? sender_id = freezed,
    Object? threads = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      pinned: pinned == freezed
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      reactions: reactions == freezed
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      room_id: room_id == freezed
          ? _value.room_id
          : room_id // ignore: cast_nullable_to_non_nullable
              as String,
      saved_by: saved_by == freezed
          ? _value.saved_by
          : saved_by // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sender_id: sender_id == freezed
          ? _value.sender_id
          : sender_id // ignore: cast_nullable_to_non_nullable
              as String,
      threads: threads == freezed
          ? _value.threads
          : threads // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$ResultsCopyWith<$Res> implements $ResultsCopyWith<$Res> {
  factory _$ResultsCopyWith(_Results value, $Res Function(_Results) then) =
      __$ResultsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String created_at,
      List<String> media,
      String message,
      bool pinned,
      List<String> reactions,
      bool read,
      String room_id,
      List<String> saved_by,
      String sender_id,
      List<String> threads});
}

/// @nodoc
class __$ResultsCopyWithImpl<$Res> extends _$ResultsCopyWithImpl<$Res>
    implements _$ResultsCopyWith<$Res> {
  __$ResultsCopyWithImpl(_Results _value, $Res Function(_Results) _then)
      : super(_value, (v) => _then(v as _Results));

  @override
  _Results get _value => super._value as _Results;

  @override
  $Res call({
    Object? id = freezed,
    Object? created_at = freezed,
    Object? media = freezed,
    Object? message = freezed,
    Object? pinned = freezed,
    Object? reactions = freezed,
    Object? read = freezed,
    Object? room_id = freezed,
    Object? saved_by = freezed,
    Object? sender_id = freezed,
    Object? threads = freezed,
  }) {
    return _then(_Results(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      pinned: pinned == freezed
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      reactions: reactions == freezed
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      room_id: room_id == freezed
          ? _value.room_id
          : room_id // ignore: cast_nullable_to_non_nullable
              as String,
      saved_by: saved_by == freezed
          ? _value.saved_by
          : saved_by // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sender_id: sender_id == freezed
          ? _value.sender_id
          : sender_id // ignore: cast_nullable_to_non_nullable
              as String,
      threads: threads == freezed
          ? _value.threads
          : threads // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Results implements _Results {
  _$_Results(
      {this.id = '',
      this.created_at = '',
      this.media = const [],
      this.message = '',
      this.pinned = false,
      this.reactions = const [],
      this.read = false,
      this.room_id = '',
      this.saved_by = const [],
      this.sender_id = '',
      this.threads = const []});

  factory _$_Results.fromJson(Map<String, dynamic> json) =>
      _$$_ResultsFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String id;
  @JsonKey(defaultValue: '')
  @override
  final String created_at;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> media;
  @JsonKey(defaultValue: '')
  @override
  final String message;
  @JsonKey(defaultValue: false)
  @override
  final bool pinned;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> reactions;
  @JsonKey(defaultValue: false)
  @override
  final bool read;
  @JsonKey(defaultValue: '')
  @override
  final String room_id;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> saved_by;
  @JsonKey(defaultValue: '')
  @override
  final String sender_id;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> threads;

  @override
  String toString() {
    return 'Results(id: $id, created_at: $created_at, media: $media, message: $message, pinned: $pinned, reactions: $reactions, read: $read, room_id: $room_id, saved_by: $saved_by, sender_id: $sender_id, threads: $threads)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Results &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.media, media) ||
                const DeepCollectionEquality().equals(other.media, media)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.pinned, pinned) ||
                const DeepCollectionEquality().equals(other.pinned, pinned)) &&
            (identical(other.reactions, reactions) ||
                const DeepCollectionEquality()
                    .equals(other.reactions, reactions)) &&
            (identical(other.read, read) ||
                const DeepCollectionEquality().equals(other.read, read)) &&
            (identical(other.room_id, room_id) ||
                const DeepCollectionEquality()
                    .equals(other.room_id, room_id)) &&
            (identical(other.saved_by, saved_by) ||
                const DeepCollectionEquality()
                    .equals(other.saved_by, saved_by)) &&
            (identical(other.sender_id, sender_id) ||
                const DeepCollectionEquality()
                    .equals(other.sender_id, sender_id)) &&
            (identical(other.threads, threads) ||
                const DeepCollectionEquality().equals(other.threads, threads)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(media) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(pinned) ^
      const DeepCollectionEquality().hash(reactions) ^
      const DeepCollectionEquality().hash(read) ^
      const DeepCollectionEquality().hash(room_id) ^
      const DeepCollectionEquality().hash(saved_by) ^
      const DeepCollectionEquality().hash(sender_id) ^
      const DeepCollectionEquality().hash(threads);

  @JsonKey(ignore: true)
  @override
  _$ResultsCopyWith<_Results> get copyWith =>
      __$ResultsCopyWithImpl<_Results>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultsToJson(this);
  }
}

abstract class _Results implements Results {
  factory _Results(
      {String id,
      String created_at,
      List<String> media,
      String message,
      bool pinned,
      List<String> reactions,
      bool read,
      String room_id,
      List<String> saved_by,
      String sender_id,
      List<String> threads}) = _$_Results;

  factory _Results.fromJson(Map<String, dynamic> json) = _$_Results.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get created_at => throw _privateConstructorUsedError;
  @override
  List<String> get media => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  bool get pinned => throw _privateConstructorUsedError;
  @override
  List<String> get reactions => throw _privateConstructorUsedError;
  @override
  bool get read => throw _privateConstructorUsedError;
  @override
  String get room_id => throw _privateConstructorUsedError;
  @override
  List<String> get saved_by => throw _privateConstructorUsedError;
  @override
  String get sender_id => throw _privateConstructorUsedError;
  @override
  List<String> get threads => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ResultsCopyWith<_Results> get copyWith =>
      throw _privateConstructorUsedError;
}
