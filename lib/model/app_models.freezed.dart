// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String id,
      @JsonKey(name: 'first_name') required String firstName,
      @JsonKey(name: 'last_name') required String lastName,
      @JsonKey(name: 'display_name') required String displayName,
      required String email,
      required String phone,
      required int status,
      @JsonKey(name: 'time_zone') required String timeZone,
      @JsonKey(name: 'created_at') required String createdAt,
      @JsonKey(name: 'updated_at') required String updatedAt,
      required String token}) {
    return _User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      displayName: displayName,
      email: email,
      phone: phone,
      status: status,
      timeZone: timeZone,
      createdAt: createdAt,
      updatedAt: updatedAt,
      token: token,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_zone')
  String get timeZone => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'display_name') String displayName,
      String email,
      String phone,
      int status,
      @JsonKey(name: 'time_zone') String timeZone,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      String token});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? status = freezed,
    Object? timeZone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      timeZone: timeZone == freezed
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'display_name') String displayName,
      String email,
      String phone,
      int status,
      @JsonKey(name: 'time_zone') String timeZone,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      String token});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? status = freezed,
    Object? timeZone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? token = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      timeZone: timeZone == freezed
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {required this.id,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      @JsonKey(name: 'display_name') required this.displayName,
      required this.email,
      required this.phone,
      required this.status,
      @JsonKey(name: 'time_zone') required this.timeZone,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.token});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'display_name')
  final String displayName;
  @override
  final String email;
  @override
  final String phone;
  @override
  final int status;
  @override
  @JsonKey(name: 'time_zone')
  final String timeZone;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  final String token;

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, displayName: $displayName, email: $email, phone: $phone, status: $status, timeZone: $timeZone, createdAt: $createdAt, updatedAt: $updatedAt, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.timeZone, timeZone) ||
                const DeepCollectionEquality()
                    .equals(other.timeZone, timeZone)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(timeZone) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(token);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {required String id,
      @JsonKey(name: 'first_name') required String firstName,
      @JsonKey(name: 'last_name') required String lastName,
      @JsonKey(name: 'display_name') required String displayName,
      required String email,
      required String phone,
      required int status,
      @JsonKey(name: 'time_zone') required String timeZone,
      @JsonKey(name: 'created_at') required String createdAt,
      @JsonKey(name: 'updated_at') required String updatedAt,
      required String token}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get phone => throw _privateConstructorUsedError;
  @override
  int get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'time_zone')
  String get timeZone => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @override
  String get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
class _$AuthResponseTearOff {
  const _$AuthResponseTearOff();

  _AuthResponse call(
      {@JsonKey(name: 'session_id') required String sessionID,
      required User user}) {
    return _AuthResponse(
      sessionID: sessionID,
      user: user,
    );
  }

  AuthResponse fromJson(Map<String, Object> json) {
    return AuthResponse.fromJson(json);
  }
}

/// @nodoc
const $AuthResponse = _$AuthResponseTearOff();

/// @nodoc
mixin _$AuthResponse {
  @JsonKey(name: 'session_id')
  String get sessionID => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
          AuthResponse value, $Res Function(AuthResponse) then) =
      _$AuthResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'session_id') String sessionID, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res> implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  final AuthResponse _value;
  // ignore: unused_field
  final $Res Function(AuthResponse) _then;

  @override
  $Res call({
    Object? sessionID = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      sessionID: sessionID == freezed
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$AuthResponseCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$AuthResponseCopyWith(
          _AuthResponse value, $Res Function(_AuthResponse) then) =
      __$AuthResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'session_id') String sessionID, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$AuthResponseCopyWithImpl<$Res> extends _$AuthResponseCopyWithImpl<$Res>
    implements _$AuthResponseCopyWith<$Res> {
  __$AuthResponseCopyWithImpl(
      _AuthResponse _value, $Res Function(_AuthResponse) _then)
      : super(_value, (v) => _then(v as _AuthResponse));

  @override
  _AuthResponse get _value => super._value as _AuthResponse;

  @override
  $Res call({
    Object? sessionID = freezed,
    Object? user = freezed,
  }) {
    return _then(_AuthResponse(
      sessionID: sessionID == freezed
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthResponse implements _AuthResponse {
  _$_AuthResponse(
      {@JsonKey(name: 'session_id') required this.sessionID,
      required this.user});

  factory _$_AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AuthResponseFromJson(json);

  @override
  @JsonKey(name: 'session_id')
  final String sessionID;
  @override
  final User user;

  @override
  String toString() {
    return 'AuthResponse(sessionID: $sessionID, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthResponse &&
            (identical(other.sessionID, sessionID) ||
                const DeepCollectionEquality()
                    .equals(other.sessionID, sessionID)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sessionID) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$AuthResponseCopyWith<_AuthResponse> get copyWith =>
      __$AuthResponseCopyWithImpl<_AuthResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthResponseToJson(this);
  }
}

abstract class _AuthResponse implements AuthResponse {
  factory _AuthResponse(
      {@JsonKey(name: 'session_id') required String sessionID,
      required User user}) = _$_AuthResponse;

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$_AuthResponse.fromJson;

  @override
  @JsonKey(name: 'session_id')
  String get sessionID => throw _privateConstructorUsedError;
  @override
  User get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthResponseCopyWith<_AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

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

MarkMessageAsReadResponse _$MarkMessageAsReadResponseFromJson(
    Map<String, dynamic> json) {
  return _MarkMessageAsReadResponse.fromJson(json);
}

/// @nodoc
class _$MarkMessageAsReadResponseTearOff {
  const _$MarkMessageAsReadResponseTearOff();

  _MarkMessageAsReadResponse call({bool read = false}) {
    return _MarkMessageAsReadResponse(
      read: read,
    );
  }

  MarkMessageAsReadResponse fromJson(Map<String, Object> json) {
    return MarkMessageAsReadResponse.fromJson(json);
  }
}

/// @nodoc
const $MarkMessageAsReadResponse = _$MarkMessageAsReadResponseTearOff();

/// @nodoc
mixin _$MarkMessageAsReadResponse {
  bool get read => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarkMessageAsReadResponseCopyWith<MarkMessageAsReadResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkMessageAsReadResponseCopyWith<$Res> {
  factory $MarkMessageAsReadResponseCopyWith(MarkMessageAsReadResponse value,
          $Res Function(MarkMessageAsReadResponse) then) =
      _$MarkMessageAsReadResponseCopyWithImpl<$Res>;
  $Res call({bool read});
}

/// @nodoc
class _$MarkMessageAsReadResponseCopyWithImpl<$Res>
    implements $MarkMessageAsReadResponseCopyWith<$Res> {
  _$MarkMessageAsReadResponseCopyWithImpl(this._value, this._then);

  final MarkMessageAsReadResponse _value;
  // ignore: unused_field
  final $Res Function(MarkMessageAsReadResponse) _then;

  @override
  $Res call({
    Object? read = freezed,
  }) {
    return _then(_value.copyWith(
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MarkMessageAsReadResponseCopyWith<$Res>
    implements $MarkMessageAsReadResponseCopyWith<$Res> {
  factory _$MarkMessageAsReadResponseCopyWith(_MarkMessageAsReadResponse value,
          $Res Function(_MarkMessageAsReadResponse) then) =
      __$MarkMessageAsReadResponseCopyWithImpl<$Res>;
  @override
  $Res call({bool read});
}

/// @nodoc
class __$MarkMessageAsReadResponseCopyWithImpl<$Res>
    extends _$MarkMessageAsReadResponseCopyWithImpl<$Res>
    implements _$MarkMessageAsReadResponseCopyWith<$Res> {
  __$MarkMessageAsReadResponseCopyWithImpl(_MarkMessageAsReadResponse _value,
      $Res Function(_MarkMessageAsReadResponse) _then)
      : super(_value, (v) => _then(v as _MarkMessageAsReadResponse));

  @override
  _MarkMessageAsReadResponse get _value =>
      super._value as _MarkMessageAsReadResponse;

  @override
  $Res call({
    Object? read = freezed,
  }) {
    return _then(_MarkMessageAsReadResponse(
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MarkMessageAsReadResponse implements _MarkMessageAsReadResponse {
  _$_MarkMessageAsReadResponse({this.read = false});

  factory _$_MarkMessageAsReadResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MarkMessageAsReadResponseFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool read;

  @override
  String toString() {
    return 'MarkMessageAsReadResponse(read: $read)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MarkMessageAsReadResponse &&
            (identical(other.read, read) ||
                const DeepCollectionEquality().equals(other.read, read)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(read);

  @JsonKey(ignore: true)
  @override
  _$MarkMessageAsReadResponseCopyWith<_MarkMessageAsReadResponse>
      get copyWith =>
          __$MarkMessageAsReadResponseCopyWithImpl<_MarkMessageAsReadResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarkMessageAsReadResponseToJson(this);
  }
}

abstract class _MarkMessageAsReadResponse implements MarkMessageAsReadResponse {
  factory _MarkMessageAsReadResponse({bool read}) =
      _$_MarkMessageAsReadResponse;

  factory _MarkMessageAsReadResponse.fromJson(Map<String, dynamic> json) =
      _$_MarkMessageAsReadResponse.fromJson;

  @override
  bool get read => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MarkMessageAsReadResponseCopyWith<_MarkMessageAsReadResponse>
      get copyWith => throw _privateConstructorUsedError;
}

CreateRoomResponse _$CreateRoomResponseFromJson(Map<String, dynamic> json) {
  return _CreateRoomResponse.fromJson(json);
}

/// @nodoc
class _$CreateRoomResponseTearOff {
  const _$CreateRoomResponseTearOff();

  _CreateRoomResponse call({@JsonKey(name: 'room_id') required String roomId}) {
    return _CreateRoomResponse(
      roomId: roomId,
    );
  }

  CreateRoomResponse fromJson(Map<String, Object> json) {
    return CreateRoomResponse.fromJson(json);
  }
}

/// @nodoc
const $CreateRoomResponse = _$CreateRoomResponseTearOff();

/// @nodoc
mixin _$CreateRoomResponse {
  @JsonKey(name: 'room_id')
  String get roomId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateRoomResponseCopyWith<CreateRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRoomResponseCopyWith<$Res> {
  factory $CreateRoomResponseCopyWith(
          CreateRoomResponse value, $Res Function(CreateRoomResponse) then) =
      _$CreateRoomResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'room_id') String roomId});
}

/// @nodoc
class _$CreateRoomResponseCopyWithImpl<$Res>
    implements $CreateRoomResponseCopyWith<$Res> {
  _$CreateRoomResponseCopyWithImpl(this._value, this._then);

  final CreateRoomResponse _value;
  // ignore: unused_field
  final $Res Function(CreateRoomResponse) _then;

  @override
  $Res call({
    Object? roomId = freezed,
  }) {
    return _then(_value.copyWith(
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CreateRoomResponseCopyWith<$Res>
    implements $CreateRoomResponseCopyWith<$Res> {
  factory _$CreateRoomResponseCopyWith(
          _CreateRoomResponse value, $Res Function(_CreateRoomResponse) then) =
      __$CreateRoomResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'room_id') String roomId});
}

/// @nodoc
class __$CreateRoomResponseCopyWithImpl<$Res>
    extends _$CreateRoomResponseCopyWithImpl<$Res>
    implements _$CreateRoomResponseCopyWith<$Res> {
  __$CreateRoomResponseCopyWithImpl(
      _CreateRoomResponse _value, $Res Function(_CreateRoomResponse) _then)
      : super(_value, (v) => _then(v as _CreateRoomResponse));

  @override
  _CreateRoomResponse get _value => super._value as _CreateRoomResponse;

  @override
  $Res call({
    Object? roomId = freezed,
  }) {
    return _then(_CreateRoomResponse(
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateRoomResponse implements _CreateRoomResponse {
  _$_CreateRoomResponse({@JsonKey(name: 'room_id') required this.roomId});

  factory _$_CreateRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CreateRoomResponseFromJson(json);

  @override
  @JsonKey(name: 'room_id')
  final String roomId;

  @override
  String toString() {
    return 'CreateRoomResponse(roomId: $roomId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreateRoomResponse &&
            (identical(other.roomId, roomId) ||
                const DeepCollectionEquality().equals(other.roomId, roomId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(roomId);

  @JsonKey(ignore: true)
  @override
  _$CreateRoomResponseCopyWith<_CreateRoomResponse> get copyWith =>
      __$CreateRoomResponseCopyWithImpl<_CreateRoomResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateRoomResponseToJson(this);
  }
}

abstract class _CreateRoomResponse implements CreateRoomResponse {
  factory _CreateRoomResponse(
          {@JsonKey(name: 'room_id') required String roomId}) =
      _$_CreateRoomResponse;

  factory _CreateRoomResponse.fromJson(Map<String, dynamic> json) =
      _$_CreateRoomResponse.fromJson;

  @override
  @JsonKey(name: 'room_id')
  String get roomId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CreateRoomResponseCopyWith<_CreateRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

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

RoomInfoResponse _$RoomInfoResponseFromJson(Map<String, dynamic> json) {
  return _RoomInfoResponse.fromJson(json);
}

/// @nodoc
class _$RoomInfoResponseTearOff {
  const _$RoomInfoResponseTearOff();

  _RoomInfoResponse call(
      {@JsonKey(name: 'created_at') required String createdAt,
      required String description,
      @JsonKey(name: 'Number of users') required String numberOfUsers,
      @JsonKey(name: 'org_id') required String orgId,
      @JsonKey(name: 'room_id') required String roomId,
      @JsonKey(name: 'room_user_ids') required List<String> roomUserIds}) {
    return _RoomInfoResponse(
      createdAt: createdAt,
      description: description,
      numberOfUsers: numberOfUsers,
      orgId: orgId,
      roomId: roomId,
      roomUserIds: roomUserIds,
    );
  }

  RoomInfoResponse fromJson(Map<String, Object> json) {
    return RoomInfoResponse.fromJson(json);
  }
}

/// @nodoc
const $RoomInfoResponse = _$RoomInfoResponseTearOff();

/// @nodoc
mixin _$RoomInfoResponse {
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Number of users')
  String get numberOfUsers => throw _privateConstructorUsedError;
  @JsonKey(name: 'org_id')
  String get orgId => throw _privateConstructorUsedError;
  @JsonKey(name: 'room_id')
  String get roomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'room_user_ids')
  List<String> get roomUserIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomInfoResponseCopyWith<RoomInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomInfoResponseCopyWith<$Res> {
  factory $RoomInfoResponseCopyWith(
          RoomInfoResponse value, $Res Function(RoomInfoResponse) then) =
      _$RoomInfoResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'created_at') String createdAt,
      String description,
      @JsonKey(name: 'Number of users') String numberOfUsers,
      @JsonKey(name: 'org_id') String orgId,
      @JsonKey(name: 'room_id') String roomId,
      @JsonKey(name: 'room_user_ids') List<String> roomUserIds});
}

/// @nodoc
class _$RoomInfoResponseCopyWithImpl<$Res>
    implements $RoomInfoResponseCopyWith<$Res> {
  _$RoomInfoResponseCopyWithImpl(this._value, this._then);

  final RoomInfoResponse _value;
  // ignore: unused_field
  final $Res Function(RoomInfoResponse) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? description = freezed,
    Object? numberOfUsers = freezed,
    Object? orgId = freezed,
    Object? roomId = freezed,
    Object? roomUserIds = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfUsers: numberOfUsers == freezed
          ? _value.numberOfUsers
          : numberOfUsers // ignore: cast_nullable_to_non_nullable
              as String,
      orgId: orgId == freezed
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      roomUserIds: roomUserIds == freezed
          ? _value.roomUserIds
          : roomUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$RoomInfoResponseCopyWith<$Res>
    implements $RoomInfoResponseCopyWith<$Res> {
  factory _$RoomInfoResponseCopyWith(
          _RoomInfoResponse value, $Res Function(_RoomInfoResponse) then) =
      __$RoomInfoResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'created_at') String createdAt,
      String description,
      @JsonKey(name: 'Number of users') String numberOfUsers,
      @JsonKey(name: 'org_id') String orgId,
      @JsonKey(name: 'room_id') String roomId,
      @JsonKey(name: 'room_user_ids') List<String> roomUserIds});
}

/// @nodoc
class __$RoomInfoResponseCopyWithImpl<$Res>
    extends _$RoomInfoResponseCopyWithImpl<$Res>
    implements _$RoomInfoResponseCopyWith<$Res> {
  __$RoomInfoResponseCopyWithImpl(
      _RoomInfoResponse _value, $Res Function(_RoomInfoResponse) _then)
      : super(_value, (v) => _then(v as _RoomInfoResponse));

  @override
  _RoomInfoResponse get _value => super._value as _RoomInfoResponse;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? description = freezed,
    Object? numberOfUsers = freezed,
    Object? orgId = freezed,
    Object? roomId = freezed,
    Object? roomUserIds = freezed,
  }) {
    return _then(_RoomInfoResponse(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfUsers: numberOfUsers == freezed
          ? _value.numberOfUsers
          : numberOfUsers // ignore: cast_nullable_to_non_nullable
              as String,
      orgId: orgId == freezed
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      roomUserIds: roomUserIds == freezed
          ? _value.roomUserIds
          : roomUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoomInfoResponse implements _RoomInfoResponse {
  _$_RoomInfoResponse(
      {@JsonKey(name: 'created_at') required this.createdAt,
      required this.description,
      @JsonKey(name: 'Number of users') required this.numberOfUsers,
      @JsonKey(name: 'org_id') required this.orgId,
      @JsonKey(name: 'room_id') required this.roomId,
      @JsonKey(name: 'room_user_ids') required this.roomUserIds});

  factory _$_RoomInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RoomInfoResponseFromJson(json);

  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final String description;
  @override
  @JsonKey(name: 'Number of users')
  final String numberOfUsers;
  @override
  @JsonKey(name: 'org_id')
  final String orgId;
  @override
  @JsonKey(name: 'room_id')
  final String roomId;
  @override
  @JsonKey(name: 'room_user_ids')
  final List<String> roomUserIds;

  @override
  String toString() {
    return 'RoomInfoResponse(createdAt: $createdAt, description: $description, numberOfUsers: $numberOfUsers, orgId: $orgId, roomId: $roomId, roomUserIds: $roomUserIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RoomInfoResponse &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.numberOfUsers, numberOfUsers) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfUsers, numberOfUsers)) &&
            (identical(other.orgId, orgId) ||
                const DeepCollectionEquality().equals(other.orgId, orgId)) &&
            (identical(other.roomId, roomId) ||
                const DeepCollectionEquality().equals(other.roomId, roomId)) &&
            (identical(other.roomUserIds, roomUserIds) ||
                const DeepCollectionEquality()
                    .equals(other.roomUserIds, roomUserIds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(numberOfUsers) ^
      const DeepCollectionEquality().hash(orgId) ^
      const DeepCollectionEquality().hash(roomId) ^
      const DeepCollectionEquality().hash(roomUserIds);

  @JsonKey(ignore: true)
  @override
  _$RoomInfoResponseCopyWith<_RoomInfoResponse> get copyWith =>
      __$RoomInfoResponseCopyWithImpl<_RoomInfoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoomInfoResponseToJson(this);
  }
}

abstract class _RoomInfoResponse implements RoomInfoResponse {
  factory _RoomInfoResponse(
          {@JsonKey(name: 'created_at') required String createdAt,
          required String description,
          @JsonKey(name: 'Number of users') required String numberOfUsers,
          @JsonKey(name: 'org_id') required String orgId,
          @JsonKey(name: 'room_id') required String roomId,
          @JsonKey(name: 'room_user_ids') required List<String> roomUserIds}) =
      _$_RoomInfoResponse;

  factory _RoomInfoResponse.fromJson(Map<String, dynamic> json) =
      _$_RoomInfoResponse.fromJson;

  @override
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Number of users')
  String get numberOfUsers => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'org_id')
  String get orgId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'room_id')
  String get roomId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'room_user_ids')
  List<String> get roomUserIds => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RoomInfoResponseCopyWith<_RoomInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

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

SideBar _$SideBarFromJson(Map<String, dynamic> json) {
  return _SideBar.fromJson(json);
}

/// @nodoc
class _$SideBarTearOff {
  const _$SideBarTearOff();

  _SideBar call(
      {@JsonKey(name: 'sidebar_sort')
          PreBar sort = PreBar.Alpha,
      @JsonKey(name: 'show_profile_picture_next_to_dm')
          bool showPictureNextToDm = true,
      @JsonKey(name: 'list_private_channels_seperately')
          bool listPrivateChannelSeperatley = false,
      @JsonKey(name: 'organize_external_conversations')
          bool organizeExternalConversation = true,
      @JsonKey(name: 'show_conversations')
          PrefSidebar showConversation = PrefSidebar.AllConversation,
      bool showInsights = true,
      bool showThreads = true,
      bool showAllDms = true,
      bool showDrafts = true,
      bool showFiles = true,
      bool showIntegrate = true,
      bool showToDo = true,
      bool showFileBrowser = false,
      bool showChannelBrowser = false}) {
    return _SideBar(
      sort: sort,
      showPictureNextToDm: showPictureNextToDm,
      listPrivateChannelSeperatley: listPrivateChannelSeperatley,
      organizeExternalConversation: organizeExternalConversation,
      showConversation: showConversation,
      showInsights: showInsights,
      showThreads: showThreads,
      showAllDms: showAllDms,
      showDrafts: showDrafts,
      showFiles: showFiles,
      showIntegrate: showIntegrate,
      showToDo: showToDo,
      showFileBrowser: showFileBrowser,
      showChannelBrowser: showChannelBrowser,
    );
  }

  SideBar fromJson(Map<String, Object> json) {
    return SideBar.fromJson(json);
  }
}

/// @nodoc
const $SideBar = _$SideBarTearOff();

/// @nodoc
mixin _$SideBar {
  @JsonKey(name: 'sidebar_sort')
  PreBar get sort => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_profile_picture_next_to_dm')
  bool get showPictureNextToDm => throw _privateConstructorUsedError;
  @JsonKey(name: 'list_private_channels_seperately')
  bool get listPrivateChannelSeperatley => throw _privateConstructorUsedError;
  @JsonKey(name: 'organize_external_conversations')
  bool get organizeExternalConversation => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_conversations')
  PrefSidebar get showConversation => throw _privateConstructorUsedError;
  bool get showInsights => throw _privateConstructorUsedError;
  bool get showThreads => throw _privateConstructorUsedError;
  bool get showAllDms => throw _privateConstructorUsedError;
  bool get showDrafts => throw _privateConstructorUsedError;
  bool get showFiles => throw _privateConstructorUsedError;
  bool get showIntegrate => throw _privateConstructorUsedError;
  bool get showToDo => throw _privateConstructorUsedError;
  bool get showFileBrowser => throw _privateConstructorUsedError;
  bool get showChannelBrowser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SideBarCopyWith<SideBar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SideBarCopyWith<$Res> {
  factory $SideBarCopyWith(SideBar value, $Res Function(SideBar) then) =
      _$SideBarCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'sidebar_sort')
          PreBar sort,
      @JsonKey(name: 'show_profile_picture_next_to_dm')
          bool showPictureNextToDm,
      @JsonKey(name: 'list_private_channels_seperately')
          bool listPrivateChannelSeperatley,
      @JsonKey(name: 'organize_external_conversations')
          bool organizeExternalConversation,
      @JsonKey(name: 'show_conversations')
          PrefSidebar showConversation,
      bool showInsights,
      bool showThreads,
      bool showAllDms,
      bool showDrafts,
      bool showFiles,
      bool showIntegrate,
      bool showToDo,
      bool showFileBrowser,
      bool showChannelBrowser});
}

/// @nodoc
class _$SideBarCopyWithImpl<$Res> implements $SideBarCopyWith<$Res> {
  _$SideBarCopyWithImpl(this._value, this._then);

  final SideBar _value;
  // ignore: unused_field
  final $Res Function(SideBar) _then;

  @override
  $Res call({
    Object? sort = freezed,
    Object? showPictureNextToDm = freezed,
    Object? listPrivateChannelSeperatley = freezed,
    Object? organizeExternalConversation = freezed,
    Object? showConversation = freezed,
    Object? showInsights = freezed,
    Object? showThreads = freezed,
    Object? showAllDms = freezed,
    Object? showDrafts = freezed,
    Object? showFiles = freezed,
    Object? showIntegrate = freezed,
    Object? showToDo = freezed,
    Object? showFileBrowser = freezed,
    Object? showChannelBrowser = freezed,
  }) {
    return _then(_value.copyWith(
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as PreBar,
      showPictureNextToDm: showPictureNextToDm == freezed
          ? _value.showPictureNextToDm
          : showPictureNextToDm // ignore: cast_nullable_to_non_nullable
              as bool,
      listPrivateChannelSeperatley: listPrivateChannelSeperatley == freezed
          ? _value.listPrivateChannelSeperatley
          : listPrivateChannelSeperatley // ignore: cast_nullable_to_non_nullable
              as bool,
      organizeExternalConversation: organizeExternalConversation == freezed
          ? _value.organizeExternalConversation
          : organizeExternalConversation // ignore: cast_nullable_to_non_nullable
              as bool,
      showConversation: showConversation == freezed
          ? _value.showConversation
          : showConversation // ignore: cast_nullable_to_non_nullable
              as PrefSidebar,
      showInsights: showInsights == freezed
          ? _value.showInsights
          : showInsights // ignore: cast_nullable_to_non_nullable
              as bool,
      showThreads: showThreads == freezed
          ? _value.showThreads
          : showThreads // ignore: cast_nullable_to_non_nullable
              as bool,
      showAllDms: showAllDms == freezed
          ? _value.showAllDms
          : showAllDms // ignore: cast_nullable_to_non_nullable
              as bool,
      showDrafts: showDrafts == freezed
          ? _value.showDrafts
          : showDrafts // ignore: cast_nullable_to_non_nullable
              as bool,
      showFiles: showFiles == freezed
          ? _value.showFiles
          : showFiles // ignore: cast_nullable_to_non_nullable
              as bool,
      showIntegrate: showIntegrate == freezed
          ? _value.showIntegrate
          : showIntegrate // ignore: cast_nullable_to_non_nullable
              as bool,
      showToDo: showToDo == freezed
          ? _value.showToDo
          : showToDo // ignore: cast_nullable_to_non_nullable
              as bool,
      showFileBrowser: showFileBrowser == freezed
          ? _value.showFileBrowser
          : showFileBrowser // ignore: cast_nullable_to_non_nullable
              as bool,
      showChannelBrowser: showChannelBrowser == freezed
          ? _value.showChannelBrowser
          : showChannelBrowser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SideBarCopyWith<$Res> implements $SideBarCopyWith<$Res> {
  factory _$SideBarCopyWith(_SideBar value, $Res Function(_SideBar) then) =
      __$SideBarCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'sidebar_sort')
          PreBar sort,
      @JsonKey(name: 'show_profile_picture_next_to_dm')
          bool showPictureNextToDm,
      @JsonKey(name: 'list_private_channels_seperately')
          bool listPrivateChannelSeperatley,
      @JsonKey(name: 'organize_external_conversations')
          bool organizeExternalConversation,
      @JsonKey(name: 'show_conversations')
          PrefSidebar showConversation,
      bool showInsights,
      bool showThreads,
      bool showAllDms,
      bool showDrafts,
      bool showFiles,
      bool showIntegrate,
      bool showToDo,
      bool showFileBrowser,
      bool showChannelBrowser});
}

/// @nodoc
class __$SideBarCopyWithImpl<$Res> extends _$SideBarCopyWithImpl<$Res>
    implements _$SideBarCopyWith<$Res> {
  __$SideBarCopyWithImpl(_SideBar _value, $Res Function(_SideBar) _then)
      : super(_value, (v) => _then(v as _SideBar));

  @override
  _SideBar get _value => super._value as _SideBar;

  @override
  $Res call({
    Object? sort = freezed,
    Object? showPictureNextToDm = freezed,
    Object? listPrivateChannelSeperatley = freezed,
    Object? organizeExternalConversation = freezed,
    Object? showConversation = freezed,
    Object? showInsights = freezed,
    Object? showThreads = freezed,
    Object? showAllDms = freezed,
    Object? showDrafts = freezed,
    Object? showFiles = freezed,
    Object? showIntegrate = freezed,
    Object? showToDo = freezed,
    Object? showFileBrowser = freezed,
    Object? showChannelBrowser = freezed,
  }) {
    return _then(_SideBar(
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as PreBar,
      showPictureNextToDm: showPictureNextToDm == freezed
          ? _value.showPictureNextToDm
          : showPictureNextToDm // ignore: cast_nullable_to_non_nullable
              as bool,
      listPrivateChannelSeperatley: listPrivateChannelSeperatley == freezed
          ? _value.listPrivateChannelSeperatley
          : listPrivateChannelSeperatley // ignore: cast_nullable_to_non_nullable
              as bool,
      organizeExternalConversation: organizeExternalConversation == freezed
          ? _value.organizeExternalConversation
          : organizeExternalConversation // ignore: cast_nullable_to_non_nullable
              as bool,
      showConversation: showConversation == freezed
          ? _value.showConversation
          : showConversation // ignore: cast_nullable_to_non_nullable
              as PrefSidebar,
      showInsights: showInsights == freezed
          ? _value.showInsights
          : showInsights // ignore: cast_nullable_to_non_nullable
              as bool,
      showThreads: showThreads == freezed
          ? _value.showThreads
          : showThreads // ignore: cast_nullable_to_non_nullable
              as bool,
      showAllDms: showAllDms == freezed
          ? _value.showAllDms
          : showAllDms // ignore: cast_nullable_to_non_nullable
              as bool,
      showDrafts: showDrafts == freezed
          ? _value.showDrafts
          : showDrafts // ignore: cast_nullable_to_non_nullable
              as bool,
      showFiles: showFiles == freezed
          ? _value.showFiles
          : showFiles // ignore: cast_nullable_to_non_nullable
              as bool,
      showIntegrate: showIntegrate == freezed
          ? _value.showIntegrate
          : showIntegrate // ignore: cast_nullable_to_non_nullable
              as bool,
      showToDo: showToDo == freezed
          ? _value.showToDo
          : showToDo // ignore: cast_nullable_to_non_nullable
              as bool,
      showFileBrowser: showFileBrowser == freezed
          ? _value.showFileBrowser
          : showFileBrowser // ignore: cast_nullable_to_non_nullable
              as bool,
      showChannelBrowser: showChannelBrowser == freezed
          ? _value.showChannelBrowser
          : showChannelBrowser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SideBar implements _SideBar {
  const _$_SideBar(
      {@JsonKey(name: 'sidebar_sort')
          this.sort = PreBar.Alpha,
      @JsonKey(name: 'show_profile_picture_next_to_dm')
          this.showPictureNextToDm = true,
      @JsonKey(name: 'list_private_channels_seperately')
          this.listPrivateChannelSeperatley = false,
      @JsonKey(name: 'organize_external_conversations')
          this.organizeExternalConversation = true,
      @JsonKey(name: 'show_conversations')
          this.showConversation = PrefSidebar.AllConversation,
      this.showInsights = true,
      this.showThreads = true,
      this.showAllDms = true,
      this.showDrafts = true,
      this.showFiles = true,
      this.showIntegrate = true,
      this.showToDo = true,
      this.showFileBrowser = false,
      this.showChannelBrowser = false});

  factory _$_SideBar.fromJson(Map<String, dynamic> json) =>
      _$$_SideBarFromJson(json);

  @override
  @JsonKey(name: 'sidebar_sort')
  final PreBar sort;
  @override
  @JsonKey(name: 'show_profile_picture_next_to_dm')
  final bool showPictureNextToDm;
  @override
  @JsonKey(name: 'list_private_channels_seperately')
  final bool listPrivateChannelSeperatley;
  @override
  @JsonKey(name: 'organize_external_conversations')
  final bool organizeExternalConversation;
  @override
  @JsonKey(name: 'show_conversations')
  final PrefSidebar showConversation;
  @JsonKey(defaultValue: true)
  @override
  final bool showInsights;
  @JsonKey(defaultValue: true)
  @override
  final bool showThreads;
  @JsonKey(defaultValue: true)
  @override
  final bool showAllDms;
  @JsonKey(defaultValue: true)
  @override
  final bool showDrafts;
  @JsonKey(defaultValue: true)
  @override
  final bool showFiles;
  @JsonKey(defaultValue: true)
  @override
  final bool showIntegrate;
  @JsonKey(defaultValue: true)
  @override
  final bool showToDo;
  @JsonKey(defaultValue: false)
  @override
  final bool showFileBrowser;
  @JsonKey(defaultValue: false)
  @override
  final bool showChannelBrowser;

  @override
  String toString() {
    return 'SideBar(sort: $sort, showPictureNextToDm: $showPictureNextToDm, listPrivateChannelSeperatley: $listPrivateChannelSeperatley, organizeExternalConversation: $organizeExternalConversation, showConversation: $showConversation, showInsights: $showInsights, showThreads: $showThreads, showAllDms: $showAllDms, showDrafts: $showDrafts, showFiles: $showFiles, showIntegrate: $showIntegrate, showToDo: $showToDo, showFileBrowser: $showFileBrowser, showChannelBrowser: $showChannelBrowser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SideBar &&
            (identical(other.sort, sort) ||
                const DeepCollectionEquality().equals(other.sort, sort)) &&
            (identical(other.showPictureNextToDm, showPictureNextToDm) ||
                const DeepCollectionEquality()
                    .equals(other.showPictureNextToDm, showPictureNextToDm)) &&
            (identical(other.listPrivateChannelSeperatley, listPrivateChannelSeperatley) ||
                const DeepCollectionEquality().equals(
                    other.listPrivateChannelSeperatley,
                    listPrivateChannelSeperatley)) &&
            (identical(other.organizeExternalConversation,
                    organizeExternalConversation) ||
                const DeepCollectionEquality().equals(
                    other.organizeExternalConversation,
                    organizeExternalConversation)) &&
            (identical(other.showConversation, showConversation) ||
                const DeepCollectionEquality()
                    .equals(other.showConversation, showConversation)) &&
            (identical(other.showInsights, showInsights) ||
                const DeepCollectionEquality()
                    .equals(other.showInsights, showInsights)) &&
            (identical(other.showThreads, showThreads) ||
                const DeepCollectionEquality()
                    .equals(other.showThreads, showThreads)) &&
            (identical(other.showAllDms, showAllDms) ||
                const DeepCollectionEquality()
                    .equals(other.showAllDms, showAllDms)) &&
            (identical(other.showDrafts, showDrafts) ||
                const DeepCollectionEquality()
                    .equals(other.showDrafts, showDrafts)) &&
            (identical(other.showFiles, showFiles) ||
                const DeepCollectionEquality()
                    .equals(other.showFiles, showFiles)) &&
            (identical(other.showIntegrate, showIntegrate) ||
                const DeepCollectionEquality()
                    .equals(other.showIntegrate, showIntegrate)) &&
            (identical(other.showToDo, showToDo) ||
                const DeepCollectionEquality()
                    .equals(other.showToDo, showToDo)) &&
            (identical(other.showFileBrowser, showFileBrowser) ||
                const DeepCollectionEquality()
                    .equals(other.showFileBrowser, showFileBrowser)) &&
            (identical(other.showChannelBrowser, showChannelBrowser) ||
                const DeepCollectionEquality()
                    .equals(other.showChannelBrowser, showChannelBrowser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sort) ^
      const DeepCollectionEquality().hash(showPictureNextToDm) ^
      const DeepCollectionEquality().hash(listPrivateChannelSeperatley) ^
      const DeepCollectionEquality().hash(organizeExternalConversation) ^
      const DeepCollectionEquality().hash(showConversation) ^
      const DeepCollectionEquality().hash(showInsights) ^
      const DeepCollectionEquality().hash(showThreads) ^
      const DeepCollectionEquality().hash(showAllDms) ^
      const DeepCollectionEquality().hash(showDrafts) ^
      const DeepCollectionEquality().hash(showFiles) ^
      const DeepCollectionEquality().hash(showIntegrate) ^
      const DeepCollectionEquality().hash(showToDo) ^
      const DeepCollectionEquality().hash(showFileBrowser) ^
      const DeepCollectionEquality().hash(showChannelBrowser);

  @JsonKey(ignore: true)
  @override
  _$SideBarCopyWith<_SideBar> get copyWith =>
      __$SideBarCopyWithImpl<_SideBar>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SideBarToJson(this);
  }
}

abstract class _SideBar implements SideBar {
  const factory _SideBar(
      {@JsonKey(name: 'sidebar_sort')
          PreBar sort,
      @JsonKey(name: 'show_profile_picture_next_to_dm')
          bool showPictureNextToDm,
      @JsonKey(name: 'list_private_channels_seperately')
          bool listPrivateChannelSeperatley,
      @JsonKey(name: 'organize_external_conversations')
          bool organizeExternalConversation,
      @JsonKey(name: 'show_conversations')
          PrefSidebar showConversation,
      bool showInsights,
      bool showThreads,
      bool showAllDms,
      bool showDrafts,
      bool showFiles,
      bool showIntegrate,
      bool showToDo,
      bool showFileBrowser,
      bool showChannelBrowser}) = _$_SideBar;

  factory _SideBar.fromJson(Map<String, dynamic> json) = _$_SideBar.fromJson;

  @override
  @JsonKey(name: 'sidebar_sort')
  PreBar get sort => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'show_profile_picture_next_to_dm')
  bool get showPictureNextToDm => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'list_private_channels_seperately')
  bool get listPrivateChannelSeperatley => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'organize_external_conversations')
  bool get organizeExternalConversation => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'show_conversations')
  PrefSidebar get showConversation => throw _privateConstructorUsedError;
  @override
  bool get showInsights => throw _privateConstructorUsedError;
  @override
  bool get showThreads => throw _privateConstructorUsedError;
  @override
  bool get showAllDms => throw _privateConstructorUsedError;
  @override
  bool get showDrafts => throw _privateConstructorUsedError;
  @override
  bool get showFiles => throw _privateConstructorUsedError;
  @override
  bool get showIntegrate => throw _privateConstructorUsedError;
  @override
  bool get showToDo => throw _privateConstructorUsedError;
  @override
  bool get showFileBrowser => throw _privateConstructorUsedError;
  @override
  bool get showChannelBrowser => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SideBarCopyWith<_SideBar> get copyWith =>
      throw _privateConstructorUsedError;
}

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
class _$NotificationTearOff {
  const _$NotificationTearOff();

  _Notification call(
      {PrefMessageNotification notifyMe =
          PrefMessageNotification.DirectMessages,
      bool differentSettingsForMobile = false,
      bool meetingStart = false,
      bool repliesToThread = false,
      List<String> keyword = const [],
      String duration = 'Duration',
      String from = 'From',
      String to = 'To',
      bool includePreview = true,
      bool muteAll = false,
      String messageSound = 'Pick sound',
      String loungeSound = 'Pick sound',
      FlashWindows flashOnNotification = FlashWindows.WhenIdle,
      String deliverSound = 'Pick sound',
      String notActiveOnDesktop = 'When I am online'}) {
    return _Notification(
      notifyMe: notifyMe,
      differentSettingsForMobile: differentSettingsForMobile,
      meetingStart: meetingStart,
      repliesToThread: repliesToThread,
      keyword: keyword,
      duration: duration,
      from: from,
      to: to,
      includePreview: includePreview,
      muteAll: muteAll,
      messageSound: messageSound,
      loungeSound: loungeSound,
      flashOnNotification: flashOnNotification,
      deliverSound: deliverSound,
      notActiveOnDesktop: notActiveOnDesktop,
    );
  }

  Notification fromJson(Map<String, Object> json) {
    return Notification.fromJson(json);
  }
}

/// @nodoc
const $Notification = _$NotificationTearOff();

/// @nodoc
mixin _$Notification {
  PrefMessageNotification get notifyMe => throw _privateConstructorUsedError;
  bool get differentSettingsForMobile => throw _privateConstructorUsedError;
  bool get meetingStart => throw _privateConstructorUsedError;
  bool get repliesToThread => throw _privateConstructorUsedError;
  List<String> get keyword => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  bool get includePreview => throw _privateConstructorUsedError;
  bool get muteAll => throw _privateConstructorUsedError;
  String get messageSound => throw _privateConstructorUsedError;
  String get loungeSound => throw _privateConstructorUsedError;
  FlashWindows get flashOnNotification => throw _privateConstructorUsedError;
  String get deliverSound => throw _privateConstructorUsedError;
  String get notActiveOnDesktop => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res>;
  $Res call(
      {PrefMessageNotification notifyMe,
      bool differentSettingsForMobile,
      bool meetingStart,
      bool repliesToThread,
      List<String> keyword,
      String duration,
      String from,
      String to,
      bool includePreview,
      bool muteAll,
      String messageSound,
      String loungeSound,
      FlashWindows flashOnNotification,
      String deliverSound,
      String notActiveOnDesktop});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res> implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  final Notification _value;
  // ignore: unused_field
  final $Res Function(Notification) _then;

  @override
  $Res call({
    Object? notifyMe = freezed,
    Object? differentSettingsForMobile = freezed,
    Object? meetingStart = freezed,
    Object? repliesToThread = freezed,
    Object? keyword = freezed,
    Object? duration = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? includePreview = freezed,
    Object? muteAll = freezed,
    Object? messageSound = freezed,
    Object? loungeSound = freezed,
    Object? flashOnNotification = freezed,
    Object? deliverSound = freezed,
    Object? notActiveOnDesktop = freezed,
  }) {
    return _then(_value.copyWith(
      notifyMe: notifyMe == freezed
          ? _value.notifyMe
          : notifyMe // ignore: cast_nullable_to_non_nullable
              as PrefMessageNotification,
      differentSettingsForMobile: differentSettingsForMobile == freezed
          ? _value.differentSettingsForMobile
          : differentSettingsForMobile // ignore: cast_nullable_to_non_nullable
              as bool,
      meetingStart: meetingStart == freezed
          ? _value.meetingStart
          : meetingStart // ignore: cast_nullable_to_non_nullable
              as bool,
      repliesToThread: repliesToThread == freezed
          ? _value.repliesToThread
          : repliesToThread // ignore: cast_nullable_to_non_nullable
              as bool,
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      includePreview: includePreview == freezed
          ? _value.includePreview
          : includePreview // ignore: cast_nullable_to_non_nullable
              as bool,
      muteAll: muteAll == freezed
          ? _value.muteAll
          : muteAll // ignore: cast_nullable_to_non_nullable
              as bool,
      messageSound: messageSound == freezed
          ? _value.messageSound
          : messageSound // ignore: cast_nullable_to_non_nullable
              as String,
      loungeSound: loungeSound == freezed
          ? _value.loungeSound
          : loungeSound // ignore: cast_nullable_to_non_nullable
              as String,
      flashOnNotification: flashOnNotification == freezed
          ? _value.flashOnNotification
          : flashOnNotification // ignore: cast_nullable_to_non_nullable
              as FlashWindows,
      deliverSound: deliverSound == freezed
          ? _value.deliverSound
          : deliverSound // ignore: cast_nullable_to_non_nullable
              as String,
      notActiveOnDesktop: notActiveOnDesktop == freezed
          ? _value.notActiveOnDesktop
          : notActiveOnDesktop // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$NotificationCopyWith(
          _Notification value, $Res Function(_Notification) then) =
      __$NotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {PrefMessageNotification notifyMe,
      bool differentSettingsForMobile,
      bool meetingStart,
      bool repliesToThread,
      List<String> keyword,
      String duration,
      String from,
      String to,
      bool includePreview,
      bool muteAll,
      String messageSound,
      String loungeSound,
      FlashWindows flashOnNotification,
      String deliverSound,
      String notActiveOnDesktop});
}

/// @nodoc
class __$NotificationCopyWithImpl<$Res> extends _$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(
      _Notification _value, $Res Function(_Notification) _then)
      : super(_value, (v) => _then(v as _Notification));

  @override
  _Notification get _value => super._value as _Notification;

  @override
  $Res call({
    Object? notifyMe = freezed,
    Object? differentSettingsForMobile = freezed,
    Object? meetingStart = freezed,
    Object? repliesToThread = freezed,
    Object? keyword = freezed,
    Object? duration = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? includePreview = freezed,
    Object? muteAll = freezed,
    Object? messageSound = freezed,
    Object? loungeSound = freezed,
    Object? flashOnNotification = freezed,
    Object? deliverSound = freezed,
    Object? notActiveOnDesktop = freezed,
  }) {
    return _then(_Notification(
      notifyMe: notifyMe == freezed
          ? _value.notifyMe
          : notifyMe // ignore: cast_nullable_to_non_nullable
              as PrefMessageNotification,
      differentSettingsForMobile: differentSettingsForMobile == freezed
          ? _value.differentSettingsForMobile
          : differentSettingsForMobile // ignore: cast_nullable_to_non_nullable
              as bool,
      meetingStart: meetingStart == freezed
          ? _value.meetingStart
          : meetingStart // ignore: cast_nullable_to_non_nullable
              as bool,
      repliesToThread: repliesToThread == freezed
          ? _value.repliesToThread
          : repliesToThread // ignore: cast_nullable_to_non_nullable
              as bool,
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      includePreview: includePreview == freezed
          ? _value.includePreview
          : includePreview // ignore: cast_nullable_to_non_nullable
              as bool,
      muteAll: muteAll == freezed
          ? _value.muteAll
          : muteAll // ignore: cast_nullable_to_non_nullable
              as bool,
      messageSound: messageSound == freezed
          ? _value.messageSound
          : messageSound // ignore: cast_nullable_to_non_nullable
              as String,
      loungeSound: loungeSound == freezed
          ? _value.loungeSound
          : loungeSound // ignore: cast_nullable_to_non_nullable
              as String,
      flashOnNotification: flashOnNotification == freezed
          ? _value.flashOnNotification
          : flashOnNotification // ignore: cast_nullable_to_non_nullable
              as FlashWindows,
      deliverSound: deliverSound == freezed
          ? _value.deliverSound
          : deliverSound // ignore: cast_nullable_to_non_nullable
              as String,
      notActiveOnDesktop: notActiveOnDesktop == freezed
          ? _value.notActiveOnDesktop
          : notActiveOnDesktop // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Notification implements _Notification {
  const _$_Notification(
      {this.notifyMe = PrefMessageNotification.DirectMessages,
      this.differentSettingsForMobile = false,
      this.meetingStart = false,
      this.repliesToThread = false,
      this.keyword = const [],
      this.duration = 'Duration',
      this.from = 'From',
      this.to = 'To',
      this.includePreview = true,
      this.muteAll = false,
      this.messageSound = 'Pick sound',
      this.loungeSound = 'Pick sound',
      this.flashOnNotification = FlashWindows.WhenIdle,
      this.deliverSound = 'Pick sound',
      this.notActiveOnDesktop = 'When I am online'});

  factory _$_Notification.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationFromJson(json);

  @JsonKey(defaultValue: PrefMessageNotification.DirectMessages)
  @override
  final PrefMessageNotification notifyMe;
  @JsonKey(defaultValue: false)
  @override
  final bool differentSettingsForMobile;
  @JsonKey(defaultValue: false)
  @override
  final bool meetingStart;
  @JsonKey(defaultValue: false)
  @override
  final bool repliesToThread;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> keyword;
  @JsonKey(defaultValue: 'Duration')
  @override
  final String duration;
  @JsonKey(defaultValue: 'From')
  @override
  final String from;
  @JsonKey(defaultValue: 'To')
  @override
  final String to;
  @JsonKey(defaultValue: true)
  @override
  final bool includePreview;
  @JsonKey(defaultValue: false)
  @override
  final bool muteAll;
  @JsonKey(defaultValue: 'Pick sound')
  @override
  final String messageSound;
  @JsonKey(defaultValue: 'Pick sound')
  @override
  final String loungeSound;
  @JsonKey(defaultValue: FlashWindows.WhenIdle)
  @override
  final FlashWindows flashOnNotification;
  @JsonKey(defaultValue: 'Pick sound')
  @override
  final String deliverSound;
  @JsonKey(defaultValue: 'When I am online')
  @override
  final String notActiveOnDesktop;

  @override
  String toString() {
    return 'Notification(notifyMe: $notifyMe, differentSettingsForMobile: $differentSettingsForMobile, meetingStart: $meetingStart, repliesToThread: $repliesToThread, keyword: $keyword, duration: $duration, from: $from, to: $to, includePreview: $includePreview, muteAll: $muteAll, messageSound: $messageSound, loungeSound: $loungeSound, flashOnNotification: $flashOnNotification, deliverSound: $deliverSound, notActiveOnDesktop: $notActiveOnDesktop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Notification &&
            (identical(other.notifyMe, notifyMe) ||
                const DeepCollectionEquality()
                    .equals(other.notifyMe, notifyMe)) &&
            (identical(other.differentSettingsForMobile,
                    differentSettingsForMobile) ||
                const DeepCollectionEquality().equals(
                    other.differentSettingsForMobile,
                    differentSettingsForMobile)) &&
            (identical(other.meetingStart, meetingStart) ||
                const DeepCollectionEquality()
                    .equals(other.meetingStart, meetingStart)) &&
            (identical(other.repliesToThread, repliesToThread) ||
                const DeepCollectionEquality()
                    .equals(other.repliesToThread, repliesToThread)) &&
            (identical(other.keyword, keyword) ||
                const DeepCollectionEquality()
                    .equals(other.keyword, keyword)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.includePreview, includePreview) ||
                const DeepCollectionEquality()
                    .equals(other.includePreview, includePreview)) &&
            (identical(other.muteAll, muteAll) ||
                const DeepCollectionEquality()
                    .equals(other.muteAll, muteAll)) &&
            (identical(other.messageSound, messageSound) ||
                const DeepCollectionEquality()
                    .equals(other.messageSound, messageSound)) &&
            (identical(other.loungeSound, loungeSound) ||
                const DeepCollectionEquality()
                    .equals(other.loungeSound, loungeSound)) &&
            (identical(other.flashOnNotification, flashOnNotification) ||
                const DeepCollectionEquality()
                    .equals(other.flashOnNotification, flashOnNotification)) &&
            (identical(other.deliverSound, deliverSound) ||
                const DeepCollectionEquality()
                    .equals(other.deliverSound, deliverSound)) &&
            (identical(other.notActiveOnDesktop, notActiveOnDesktop) ||
                const DeepCollectionEquality()
                    .equals(other.notActiveOnDesktop, notActiveOnDesktop)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notifyMe) ^
      const DeepCollectionEquality().hash(differentSettingsForMobile) ^
      const DeepCollectionEquality().hash(meetingStart) ^
      const DeepCollectionEquality().hash(repliesToThread) ^
      const DeepCollectionEquality().hash(keyword) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(includePreview) ^
      const DeepCollectionEquality().hash(muteAll) ^
      const DeepCollectionEquality().hash(messageSound) ^
      const DeepCollectionEquality().hash(loungeSound) ^
      const DeepCollectionEquality().hash(flashOnNotification) ^
      const DeepCollectionEquality().hash(deliverSound) ^
      const DeepCollectionEquality().hash(notActiveOnDesktop);

  @JsonKey(ignore: true)
  @override
  _$NotificationCopyWith<_Notification> get copyWith =>
      __$NotificationCopyWithImpl<_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationToJson(this);
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {PrefMessageNotification notifyMe,
      bool differentSettingsForMobile,
      bool meetingStart,
      bool repliesToThread,
      List<String> keyword,
      String duration,
      String from,
      String to,
      bool includePreview,
      bool muteAll,
      String messageSound,
      String loungeSound,
      FlashWindows flashOnNotification,
      String deliverSound,
      String notActiveOnDesktop}) = _$_Notification;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$_Notification.fromJson;

  @override
  PrefMessageNotification get notifyMe => throw _privateConstructorUsedError;
  @override
  bool get differentSettingsForMobile => throw _privateConstructorUsedError;
  @override
  bool get meetingStart => throw _privateConstructorUsedError;
  @override
  bool get repliesToThread => throw _privateConstructorUsedError;
  @override
  List<String> get keyword => throw _privateConstructorUsedError;
  @override
  String get duration => throw _privateConstructorUsedError;
  @override
  String get from => throw _privateConstructorUsedError;
  @override
  String get to => throw _privateConstructorUsedError;
  @override
  bool get includePreview => throw _privateConstructorUsedError;
  @override
  bool get muteAll => throw _privateConstructorUsedError;
  @override
  String get messageSound => throw _privateConstructorUsedError;
  @override
  String get loungeSound => throw _privateConstructorUsedError;
  @override
  FlashWindows get flashOnNotification => throw _privateConstructorUsedError;
  @override
  String get deliverSound => throw _privateConstructorUsedError;
  @override
  String get notActiveOnDesktop => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationCopyWith<_Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

MessagesAndMedia _$MessagesAndMediaFromJson(Map<String, dynamic> json) {
  return _MessagesAndMedia.fromJson(json);
}

/// @nodoc
class _$MessagesAndMediaTearOff {
  const _$MessagesAndMediaTearOff();

  _MessagesAndMedia call(
      {PrefTheme theme = PrefTheme.Compact,
      PrefTheme name = PrefTheme.JustDisplayNames,
      bool displayInfo = true,
      bool showTime = false,
      bool disPlayColor = true,
      bool displayEmojiAsPlain = false,
      bool showJumbomoji = true,
      bool showUploadPreview = true,
      bool showLinkPreview = true,
      bool largerThan2 = false,
      bool showLinkPreviewText = false}) {
    return _MessagesAndMedia(
      theme: theme,
      name: name,
      displayInfo: displayInfo,
      showTime: showTime,
      disPlayColor: disPlayColor,
      displayEmojiAsPlain: displayEmojiAsPlain,
      showJumbomoji: showJumbomoji,
      showUploadPreview: showUploadPreview,
      showLinkPreview: showLinkPreview,
      largerThan2: largerThan2,
      showLinkPreviewText: showLinkPreviewText,
    );
  }

  MessagesAndMedia fromJson(Map<String, Object> json) {
    return MessagesAndMedia.fromJson(json);
  }
}

/// @nodoc
const $MessagesAndMedia = _$MessagesAndMediaTearOff();

/// @nodoc
mixin _$MessagesAndMedia {
  PrefTheme get theme => throw _privateConstructorUsedError;
  PrefTheme get name => throw _privateConstructorUsedError;
  bool get displayInfo => throw _privateConstructorUsedError;
  bool get showTime => throw _privateConstructorUsedError;
  bool get disPlayColor => throw _privateConstructorUsedError;
  bool get displayEmojiAsPlain => throw _privateConstructorUsedError;
  bool get showJumbomoji => throw _privateConstructorUsedError;
  bool get showUploadPreview => throw _privateConstructorUsedError;
  bool get showLinkPreview => throw _privateConstructorUsedError;
  bool get largerThan2 => throw _privateConstructorUsedError;
  bool get showLinkPreviewText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessagesAndMediaCopyWith<MessagesAndMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesAndMediaCopyWith<$Res> {
  factory $MessagesAndMediaCopyWith(
          MessagesAndMedia value, $Res Function(MessagesAndMedia) then) =
      _$MessagesAndMediaCopyWithImpl<$Res>;
  $Res call(
      {PrefTheme theme,
      PrefTheme name,
      bool displayInfo,
      bool showTime,
      bool disPlayColor,
      bool displayEmojiAsPlain,
      bool showJumbomoji,
      bool showUploadPreview,
      bool showLinkPreview,
      bool largerThan2,
      bool showLinkPreviewText});
}

/// @nodoc
class _$MessagesAndMediaCopyWithImpl<$Res>
    implements $MessagesAndMediaCopyWith<$Res> {
  _$MessagesAndMediaCopyWithImpl(this._value, this._then);

  final MessagesAndMedia _value;
  // ignore: unused_field
  final $Res Function(MessagesAndMedia) _then;

  @override
  $Res call({
    Object? theme = freezed,
    Object? name = freezed,
    Object? displayInfo = freezed,
    Object? showTime = freezed,
    Object? disPlayColor = freezed,
    Object? displayEmojiAsPlain = freezed,
    Object? showJumbomoji = freezed,
    Object? showUploadPreview = freezed,
    Object? showLinkPreview = freezed,
    Object? largerThan2 = freezed,
    Object? showLinkPreviewText = freezed,
  }) {
    return _then(_value.copyWith(
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as PrefTheme,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as PrefTheme,
      displayInfo: displayInfo == freezed
          ? _value.displayInfo
          : displayInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      showTime: showTime == freezed
          ? _value.showTime
          : showTime // ignore: cast_nullable_to_non_nullable
              as bool,
      disPlayColor: disPlayColor == freezed
          ? _value.disPlayColor
          : disPlayColor // ignore: cast_nullable_to_non_nullable
              as bool,
      displayEmojiAsPlain: displayEmojiAsPlain == freezed
          ? _value.displayEmojiAsPlain
          : displayEmojiAsPlain // ignore: cast_nullable_to_non_nullable
              as bool,
      showJumbomoji: showJumbomoji == freezed
          ? _value.showJumbomoji
          : showJumbomoji // ignore: cast_nullable_to_non_nullable
              as bool,
      showUploadPreview: showUploadPreview == freezed
          ? _value.showUploadPreview
          : showUploadPreview // ignore: cast_nullable_to_non_nullable
              as bool,
      showLinkPreview: showLinkPreview == freezed
          ? _value.showLinkPreview
          : showLinkPreview // ignore: cast_nullable_to_non_nullable
              as bool,
      largerThan2: largerThan2 == freezed
          ? _value.largerThan2
          : largerThan2 // ignore: cast_nullable_to_non_nullable
              as bool,
      showLinkPreviewText: showLinkPreviewText == freezed
          ? _value.showLinkPreviewText
          : showLinkPreviewText // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MessagesAndMediaCopyWith<$Res>
    implements $MessagesAndMediaCopyWith<$Res> {
  factory _$MessagesAndMediaCopyWith(
          _MessagesAndMedia value, $Res Function(_MessagesAndMedia) then) =
      __$MessagesAndMediaCopyWithImpl<$Res>;
  @override
  $Res call(
      {PrefTheme theme,
      PrefTheme name,
      bool displayInfo,
      bool showTime,
      bool disPlayColor,
      bool displayEmojiAsPlain,
      bool showJumbomoji,
      bool showUploadPreview,
      bool showLinkPreview,
      bool largerThan2,
      bool showLinkPreviewText});
}

/// @nodoc
class __$MessagesAndMediaCopyWithImpl<$Res>
    extends _$MessagesAndMediaCopyWithImpl<$Res>
    implements _$MessagesAndMediaCopyWith<$Res> {
  __$MessagesAndMediaCopyWithImpl(
      _MessagesAndMedia _value, $Res Function(_MessagesAndMedia) _then)
      : super(_value, (v) => _then(v as _MessagesAndMedia));

  @override
  _MessagesAndMedia get _value => super._value as _MessagesAndMedia;

  @override
  $Res call({
    Object? theme = freezed,
    Object? name = freezed,
    Object? displayInfo = freezed,
    Object? showTime = freezed,
    Object? disPlayColor = freezed,
    Object? displayEmojiAsPlain = freezed,
    Object? showJumbomoji = freezed,
    Object? showUploadPreview = freezed,
    Object? showLinkPreview = freezed,
    Object? largerThan2 = freezed,
    Object? showLinkPreviewText = freezed,
  }) {
    return _then(_MessagesAndMedia(
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as PrefTheme,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as PrefTheme,
      displayInfo: displayInfo == freezed
          ? _value.displayInfo
          : displayInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      showTime: showTime == freezed
          ? _value.showTime
          : showTime // ignore: cast_nullable_to_non_nullable
              as bool,
      disPlayColor: disPlayColor == freezed
          ? _value.disPlayColor
          : disPlayColor // ignore: cast_nullable_to_non_nullable
              as bool,
      displayEmojiAsPlain: displayEmojiAsPlain == freezed
          ? _value.displayEmojiAsPlain
          : displayEmojiAsPlain // ignore: cast_nullable_to_non_nullable
              as bool,
      showJumbomoji: showJumbomoji == freezed
          ? _value.showJumbomoji
          : showJumbomoji // ignore: cast_nullable_to_non_nullable
              as bool,
      showUploadPreview: showUploadPreview == freezed
          ? _value.showUploadPreview
          : showUploadPreview // ignore: cast_nullable_to_non_nullable
              as bool,
      showLinkPreview: showLinkPreview == freezed
          ? _value.showLinkPreview
          : showLinkPreview // ignore: cast_nullable_to_non_nullable
              as bool,
      largerThan2: largerThan2 == freezed
          ? _value.largerThan2
          : largerThan2 // ignore: cast_nullable_to_non_nullable
              as bool,
      showLinkPreviewText: showLinkPreviewText == freezed
          ? _value.showLinkPreviewText
          : showLinkPreviewText // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessagesAndMedia implements _MessagesAndMedia {
  const _$_MessagesAndMedia(
      {this.theme = PrefTheme.Compact,
      this.name = PrefTheme.JustDisplayNames,
      this.displayInfo = true,
      this.showTime = false,
      this.disPlayColor = true,
      this.displayEmojiAsPlain = false,
      this.showJumbomoji = true,
      this.showUploadPreview = true,
      this.showLinkPreview = true,
      this.largerThan2 = false,
      this.showLinkPreviewText = false});

  factory _$_MessagesAndMedia.fromJson(Map<String, dynamic> json) =>
      _$$_MessagesAndMediaFromJson(json);

  @JsonKey(defaultValue: PrefTheme.Compact)
  @override
  final PrefTheme theme;
  @JsonKey(defaultValue: PrefTheme.JustDisplayNames)
  @override
  final PrefTheme name;
  @JsonKey(defaultValue: true)
  @override
  final bool displayInfo;
  @JsonKey(defaultValue: false)
  @override
  final bool showTime;
  @JsonKey(defaultValue: true)
  @override
  final bool disPlayColor;
  @JsonKey(defaultValue: false)
  @override
  final bool displayEmojiAsPlain;
  @JsonKey(defaultValue: true)
  @override
  final bool showJumbomoji;
  @JsonKey(defaultValue: true)
  @override
  final bool showUploadPreview;
  @JsonKey(defaultValue: true)
  @override
  final bool showLinkPreview;
  @JsonKey(defaultValue: false)
  @override
  final bool largerThan2;
  @JsonKey(defaultValue: false)
  @override
  final bool showLinkPreviewText;

  @override
  String toString() {
    return 'MessagesAndMedia(theme: $theme, name: $name, displayInfo: $displayInfo, showTime: $showTime, disPlayColor: $disPlayColor, displayEmojiAsPlain: $displayEmojiAsPlain, showJumbomoji: $showJumbomoji, showUploadPreview: $showUploadPreview, showLinkPreview: $showLinkPreview, largerThan2: $largerThan2, showLinkPreviewText: $showLinkPreviewText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MessagesAndMedia &&
            (identical(other.theme, theme) ||
                const DeepCollectionEquality().equals(other.theme, theme)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.displayInfo, displayInfo) ||
                const DeepCollectionEquality()
                    .equals(other.displayInfo, displayInfo)) &&
            (identical(other.showTime, showTime) ||
                const DeepCollectionEquality()
                    .equals(other.showTime, showTime)) &&
            (identical(other.disPlayColor, disPlayColor) ||
                const DeepCollectionEquality()
                    .equals(other.disPlayColor, disPlayColor)) &&
            (identical(other.displayEmojiAsPlain, displayEmojiAsPlain) ||
                const DeepCollectionEquality()
                    .equals(other.displayEmojiAsPlain, displayEmojiAsPlain)) &&
            (identical(other.showJumbomoji, showJumbomoji) ||
                const DeepCollectionEquality()
                    .equals(other.showJumbomoji, showJumbomoji)) &&
            (identical(other.showUploadPreview, showUploadPreview) ||
                const DeepCollectionEquality()
                    .equals(other.showUploadPreview, showUploadPreview)) &&
            (identical(other.showLinkPreview, showLinkPreview) ||
                const DeepCollectionEquality()
                    .equals(other.showLinkPreview, showLinkPreview)) &&
            (identical(other.largerThan2, largerThan2) ||
                const DeepCollectionEquality()
                    .equals(other.largerThan2, largerThan2)) &&
            (identical(other.showLinkPreviewText, showLinkPreviewText) ||
                const DeepCollectionEquality()
                    .equals(other.showLinkPreviewText, showLinkPreviewText)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(theme) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(displayInfo) ^
      const DeepCollectionEquality().hash(showTime) ^
      const DeepCollectionEquality().hash(disPlayColor) ^
      const DeepCollectionEquality().hash(displayEmojiAsPlain) ^
      const DeepCollectionEquality().hash(showJumbomoji) ^
      const DeepCollectionEquality().hash(showUploadPreview) ^
      const DeepCollectionEquality().hash(showLinkPreview) ^
      const DeepCollectionEquality().hash(largerThan2) ^
      const DeepCollectionEquality().hash(showLinkPreviewText);

  @JsonKey(ignore: true)
  @override
  _$MessagesAndMediaCopyWith<_MessagesAndMedia> get copyWith =>
      __$MessagesAndMediaCopyWithImpl<_MessagesAndMedia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessagesAndMediaToJson(this);
  }
}

abstract class _MessagesAndMedia implements MessagesAndMedia {
  const factory _MessagesAndMedia(
      {PrefTheme theme,
      PrefTheme name,
      bool displayInfo,
      bool showTime,
      bool disPlayColor,
      bool displayEmojiAsPlain,
      bool showJumbomoji,
      bool showUploadPreview,
      bool showLinkPreview,
      bool largerThan2,
      bool showLinkPreviewText}) = _$_MessagesAndMedia;

  factory _MessagesAndMedia.fromJson(Map<String, dynamic> json) =
      _$_MessagesAndMedia.fromJson;

  @override
  PrefTheme get theme => throw _privateConstructorUsedError;
  @override
  PrefTheme get name => throw _privateConstructorUsedError;
  @override
  bool get displayInfo => throw _privateConstructorUsedError;
  @override
  bool get showTime => throw _privateConstructorUsedError;
  @override
  bool get disPlayColor => throw _privateConstructorUsedError;
  @override
  bool get displayEmojiAsPlain => throw _privateConstructorUsedError;
  @override
  bool get showJumbomoji => throw _privateConstructorUsedError;
  @override
  bool get showUploadPreview => throw _privateConstructorUsedError;
  @override
  bool get showLinkPreview => throw _privateConstructorUsedError;
  @override
  bool get largerThan2 => throw _privateConstructorUsedError;
  @override
  bool get showLinkPreviewText => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessagesAndMediaCopyWith<_MessagesAndMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

AudioAndVideo _$AudioAndVideoFromJson(Map<String, dynamic> json) {
  return _AudioAndVideo.fromJson(json);
}

/// @nodoc
class _$AudioAndVideoTearOff {
  const _$AudioAndVideoTearOff();

  _AudioAndVideo call(
      {bool enableMic = true,
      bool setMyStatusOnCall = true,
      bool muteOnMic = false,
      bool setMyStatusInHuddle = true,
      bool muteInHuddle = false,
      dynamic turnOnCaption = false,
      dynamic sendAWarning = false,
      dynamic setStatusZuriCall = true,
      dynamic muteMicZuriCall = false,
      dynamic playMusic = true}) {
    return _AudioAndVideo(
      enableMic: enableMic,
      setMyStatusOnCall: setMyStatusOnCall,
      muteOnMic: muteOnMic,
      setMyStatusInHuddle: setMyStatusInHuddle,
      muteInHuddle: muteInHuddle,
      turnOnCaption: turnOnCaption,
      sendAWarning: sendAWarning,
      setStatusZuriCall: setStatusZuriCall,
      muteMicZuriCall: muteMicZuriCall,
      playMusic: playMusic,
    );
  }

  AudioAndVideo fromJson(Map<String, Object> json) {
    return AudioAndVideo.fromJson(json);
  }
}

/// @nodoc
const $AudioAndVideo = _$AudioAndVideoTearOff();

/// @nodoc
mixin _$AudioAndVideo {
  bool get enableMic => throw _privateConstructorUsedError;
  bool get setMyStatusOnCall => throw _privateConstructorUsedError;
  bool get muteOnMic => throw _privateConstructorUsedError;
  bool get setMyStatusInHuddle => throw _privateConstructorUsedError;
  bool get muteInHuddle => throw _privateConstructorUsedError;
  dynamic get turnOnCaption => throw _privateConstructorUsedError;
  dynamic get sendAWarning => throw _privateConstructorUsedError;
  dynamic get setStatusZuriCall => throw _privateConstructorUsedError;
  dynamic get muteMicZuriCall => throw _privateConstructorUsedError;
  dynamic get playMusic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioAndVideoCopyWith<AudioAndVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioAndVideoCopyWith<$Res> {
  factory $AudioAndVideoCopyWith(
          AudioAndVideo value, $Res Function(AudioAndVideo) then) =
      _$AudioAndVideoCopyWithImpl<$Res>;
  $Res call(
      {bool enableMic,
      bool setMyStatusOnCall,
      bool muteOnMic,
      bool setMyStatusInHuddle,
      bool muteInHuddle,
      dynamic turnOnCaption,
      dynamic sendAWarning,
      dynamic setStatusZuriCall,
      dynamic muteMicZuriCall,
      dynamic playMusic});
}

/// @nodoc
class _$AudioAndVideoCopyWithImpl<$Res>
    implements $AudioAndVideoCopyWith<$Res> {
  _$AudioAndVideoCopyWithImpl(this._value, this._then);

  final AudioAndVideo _value;
  // ignore: unused_field
  final $Res Function(AudioAndVideo) _then;

  @override
  $Res call({
    Object? enableMic = freezed,
    Object? setMyStatusOnCall = freezed,
    Object? muteOnMic = freezed,
    Object? setMyStatusInHuddle = freezed,
    Object? muteInHuddle = freezed,
    Object? turnOnCaption = freezed,
    Object? sendAWarning = freezed,
    Object? setStatusZuriCall = freezed,
    Object? muteMicZuriCall = freezed,
    Object? playMusic = freezed,
  }) {
    return _then(_value.copyWith(
      enableMic: enableMic == freezed
          ? _value.enableMic
          : enableMic // ignore: cast_nullable_to_non_nullable
              as bool,
      setMyStatusOnCall: setMyStatusOnCall == freezed
          ? _value.setMyStatusOnCall
          : setMyStatusOnCall // ignore: cast_nullable_to_non_nullable
              as bool,
      muteOnMic: muteOnMic == freezed
          ? _value.muteOnMic
          : muteOnMic // ignore: cast_nullable_to_non_nullable
              as bool,
      setMyStatusInHuddle: setMyStatusInHuddle == freezed
          ? _value.setMyStatusInHuddle
          : setMyStatusInHuddle // ignore: cast_nullable_to_non_nullable
              as bool,
      muteInHuddle: muteInHuddle == freezed
          ? _value.muteInHuddle
          : muteInHuddle // ignore: cast_nullable_to_non_nullable
              as bool,
      turnOnCaption: turnOnCaption == freezed
          ? _value.turnOnCaption
          : turnOnCaption // ignore: cast_nullable_to_non_nullable
              as dynamic,
      sendAWarning: sendAWarning == freezed
          ? _value.sendAWarning
          : sendAWarning // ignore: cast_nullable_to_non_nullable
              as dynamic,
      setStatusZuriCall: setStatusZuriCall == freezed
          ? _value.setStatusZuriCall
          : setStatusZuriCall // ignore: cast_nullable_to_non_nullable
              as dynamic,
      muteMicZuriCall: muteMicZuriCall == freezed
          ? _value.muteMicZuriCall
          : muteMicZuriCall // ignore: cast_nullable_to_non_nullable
              as dynamic,
      playMusic: playMusic == freezed
          ? _value.playMusic
          : playMusic // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$AudioAndVideoCopyWith<$Res>
    implements $AudioAndVideoCopyWith<$Res> {
  factory _$AudioAndVideoCopyWith(
          _AudioAndVideo value, $Res Function(_AudioAndVideo) then) =
      __$AudioAndVideoCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool enableMic,
      bool setMyStatusOnCall,
      bool muteOnMic,
      bool setMyStatusInHuddle,
      bool muteInHuddle,
      dynamic turnOnCaption,
      dynamic sendAWarning,
      dynamic setStatusZuriCall,
      dynamic muteMicZuriCall,
      dynamic playMusic});
}

/// @nodoc
class __$AudioAndVideoCopyWithImpl<$Res>
    extends _$AudioAndVideoCopyWithImpl<$Res>
    implements _$AudioAndVideoCopyWith<$Res> {
  __$AudioAndVideoCopyWithImpl(
      _AudioAndVideo _value, $Res Function(_AudioAndVideo) _then)
      : super(_value, (v) => _then(v as _AudioAndVideo));

  @override
  _AudioAndVideo get _value => super._value as _AudioAndVideo;

  @override
  $Res call({
    Object? enableMic = freezed,
    Object? setMyStatusOnCall = freezed,
    Object? muteOnMic = freezed,
    Object? setMyStatusInHuddle = freezed,
    Object? muteInHuddle = freezed,
    Object? turnOnCaption = freezed,
    Object? sendAWarning = freezed,
    Object? setStatusZuriCall = freezed,
    Object? muteMicZuriCall = freezed,
    Object? playMusic = freezed,
  }) {
    return _then(_AudioAndVideo(
      enableMic: enableMic == freezed
          ? _value.enableMic
          : enableMic // ignore: cast_nullable_to_non_nullable
              as bool,
      setMyStatusOnCall: setMyStatusOnCall == freezed
          ? _value.setMyStatusOnCall
          : setMyStatusOnCall // ignore: cast_nullable_to_non_nullable
              as bool,
      muteOnMic: muteOnMic == freezed
          ? _value.muteOnMic
          : muteOnMic // ignore: cast_nullable_to_non_nullable
              as bool,
      setMyStatusInHuddle: setMyStatusInHuddle == freezed
          ? _value.setMyStatusInHuddle
          : setMyStatusInHuddle // ignore: cast_nullable_to_non_nullable
              as bool,
      muteInHuddle: muteInHuddle == freezed
          ? _value.muteInHuddle
          : muteInHuddle // ignore: cast_nullable_to_non_nullable
              as bool,
      turnOnCaption:
          turnOnCaption == freezed ? _value.turnOnCaption : turnOnCaption,
      sendAWarning:
          sendAWarning == freezed ? _value.sendAWarning : sendAWarning,
      setStatusZuriCall: setStatusZuriCall == freezed
          ? _value.setStatusZuriCall
          : setStatusZuriCall,
      muteMicZuriCall:
          muteMicZuriCall == freezed ? _value.muteMicZuriCall : muteMicZuriCall,
      playMusic: playMusic == freezed ? _value.playMusic : playMusic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AudioAndVideo implements _AudioAndVideo {
  const _$_AudioAndVideo(
      {this.enableMic = true,
      this.setMyStatusOnCall = true,
      this.muteOnMic = false,
      this.setMyStatusInHuddle = true,
      this.muteInHuddle = false,
      this.turnOnCaption = false,
      this.sendAWarning = false,
      this.setStatusZuriCall = true,
      this.muteMicZuriCall = false,
      this.playMusic = true});

  factory _$_AudioAndVideo.fromJson(Map<String, dynamic> json) =>
      _$$_AudioAndVideoFromJson(json);

  @JsonKey(defaultValue: true)
  @override
  final bool enableMic;
  @JsonKey(defaultValue: true)
  @override
  final bool setMyStatusOnCall;
  @JsonKey(defaultValue: false)
  @override
  final bool muteOnMic;
  @JsonKey(defaultValue: true)
  @override
  final bool setMyStatusInHuddle;
  @JsonKey(defaultValue: false)
  @override
  final bool muteInHuddle;
  @JsonKey(defaultValue: false)
  @override
  final dynamic turnOnCaption;
  @JsonKey(defaultValue: false)
  @override
  final dynamic sendAWarning;
  @JsonKey(defaultValue: true)
  @override
  final dynamic setStatusZuriCall;
  @JsonKey(defaultValue: false)
  @override
  final dynamic muteMicZuriCall;
  @JsonKey(defaultValue: true)
  @override
  final dynamic playMusic;

  @override
  String toString() {
    return 'AudioAndVideo(enableMic: $enableMic, setMyStatusOnCall: $setMyStatusOnCall, muteOnMic: $muteOnMic, setMyStatusInHuddle: $setMyStatusInHuddle, muteInHuddle: $muteInHuddle, turnOnCaption: $turnOnCaption, sendAWarning: $sendAWarning, setStatusZuriCall: $setStatusZuriCall, muteMicZuriCall: $muteMicZuriCall, playMusic: $playMusic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AudioAndVideo &&
            (identical(other.enableMic, enableMic) ||
                const DeepCollectionEquality()
                    .equals(other.enableMic, enableMic)) &&
            (identical(other.setMyStatusOnCall, setMyStatusOnCall) ||
                const DeepCollectionEquality()
                    .equals(other.setMyStatusOnCall, setMyStatusOnCall)) &&
            (identical(other.muteOnMic, muteOnMic) ||
                const DeepCollectionEquality()
                    .equals(other.muteOnMic, muteOnMic)) &&
            (identical(other.setMyStatusInHuddle, setMyStatusInHuddle) ||
                const DeepCollectionEquality()
                    .equals(other.setMyStatusInHuddle, setMyStatusInHuddle)) &&
            (identical(other.muteInHuddle, muteInHuddle) ||
                const DeepCollectionEquality()
                    .equals(other.muteInHuddle, muteInHuddle)) &&
            (identical(other.turnOnCaption, turnOnCaption) ||
                const DeepCollectionEquality()
                    .equals(other.turnOnCaption, turnOnCaption)) &&
            (identical(other.sendAWarning, sendAWarning) ||
                const DeepCollectionEquality()
                    .equals(other.sendAWarning, sendAWarning)) &&
            (identical(other.setStatusZuriCall, setStatusZuriCall) ||
                const DeepCollectionEquality()
                    .equals(other.setStatusZuriCall, setStatusZuriCall)) &&
            (identical(other.muteMicZuriCall, muteMicZuriCall) ||
                const DeepCollectionEquality()
                    .equals(other.muteMicZuriCall, muteMicZuriCall)) &&
            (identical(other.playMusic, playMusic) ||
                const DeepCollectionEquality()
                    .equals(other.playMusic, playMusic)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(enableMic) ^
      const DeepCollectionEquality().hash(setMyStatusOnCall) ^
      const DeepCollectionEquality().hash(muteOnMic) ^
      const DeepCollectionEquality().hash(setMyStatusInHuddle) ^
      const DeepCollectionEquality().hash(muteInHuddle) ^
      const DeepCollectionEquality().hash(turnOnCaption) ^
      const DeepCollectionEquality().hash(sendAWarning) ^
      const DeepCollectionEquality().hash(setStatusZuriCall) ^
      const DeepCollectionEquality().hash(muteMicZuriCall) ^
      const DeepCollectionEquality().hash(playMusic);

  @JsonKey(ignore: true)
  @override
  _$AudioAndVideoCopyWith<_AudioAndVideo> get copyWith =>
      __$AudioAndVideoCopyWithImpl<_AudioAndVideo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AudioAndVideoToJson(this);
  }
}

abstract class _AudioAndVideo implements AudioAndVideo {
  const factory _AudioAndVideo(
      {bool enableMic,
      bool setMyStatusOnCall,
      bool muteOnMic,
      bool setMyStatusInHuddle,
      bool muteInHuddle,
      dynamic turnOnCaption,
      dynamic sendAWarning,
      dynamic setStatusZuriCall,
      dynamic muteMicZuriCall,
      dynamic playMusic}) = _$_AudioAndVideo;

  factory _AudioAndVideo.fromJson(Map<String, dynamic> json) =
      _$_AudioAndVideo.fromJson;

  @override
  bool get enableMic => throw _privateConstructorUsedError;
  @override
  bool get setMyStatusOnCall => throw _privateConstructorUsedError;
  @override
  bool get muteOnMic => throw _privateConstructorUsedError;
  @override
  bool get setMyStatusInHuddle => throw _privateConstructorUsedError;
  @override
  bool get muteInHuddle => throw _privateConstructorUsedError;
  @override
  dynamic get turnOnCaption => throw _privateConstructorUsedError;
  @override
  dynamic get sendAWarning => throw _privateConstructorUsedError;
  @override
  dynamic get setStatusZuriCall => throw _privateConstructorUsedError;
  @override
  dynamic get muteMicZuriCall => throw _privateConstructorUsedError;
  @override
  dynamic get playMusic => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AudioAndVideoCopyWith<_AudioAndVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

Advanced _$AdvancedFromJson(Map<String, dynamic> json) {
  return _Advanced.fromJson(json);
}

/// @nodoc
class _$AdvancedTearOff {
  const _$AdvancedTearOff();

  _Advanced call(
      {bool whenTypyingCode = false,
      bool formatMessage = false,
      EnterButtonsChoice writingMessage = EnterButtonsChoice.sendMsg,
      bool startZuriChat = false,
      bool quickSwitcher = false,
      List<String> excludeThisChannels = const [],
      bool alwaysScrollMessage = true,
      bool toggleAwayStatus = true,
      bool sendOccasionalSurvey = true,
      bool meliciousLinkWarning = true}) {
    return _Advanced(
      whenTypyingCode: whenTypyingCode,
      formatMessage: formatMessage,
      writingMessage: writingMessage,
      startZuriChat: startZuriChat,
      quickSwitcher: quickSwitcher,
      excludeThisChannels: excludeThisChannels,
      alwaysScrollMessage: alwaysScrollMessage,
      toggleAwayStatus: toggleAwayStatus,
      sendOccasionalSurvey: sendOccasionalSurvey,
      meliciousLinkWarning: meliciousLinkWarning,
    );
  }

  Advanced fromJson(Map<String, Object> json) {
    return Advanced.fromJson(json);
  }
}

/// @nodoc
const $Advanced = _$AdvancedTearOff();

/// @nodoc
mixin _$Advanced {
  bool get whenTypyingCode => throw _privateConstructorUsedError;
  bool get formatMessage => throw _privateConstructorUsedError;
  EnterButtonsChoice get writingMessage => throw _privateConstructorUsedError;
  bool get startZuriChat => throw _privateConstructorUsedError;
  bool get quickSwitcher => throw _privateConstructorUsedError;
  List<String> get excludeThisChannels => throw _privateConstructorUsedError;
  bool get alwaysScrollMessage => throw _privateConstructorUsedError;
  bool get toggleAwayStatus => throw _privateConstructorUsedError;
  bool get sendOccasionalSurvey => throw _privateConstructorUsedError;
  bool get meliciousLinkWarning => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdvancedCopyWith<Advanced> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvancedCopyWith<$Res> {
  factory $AdvancedCopyWith(Advanced value, $Res Function(Advanced) then) =
      _$AdvancedCopyWithImpl<$Res>;
  $Res call(
      {bool whenTypyingCode,
      bool formatMessage,
      EnterButtonsChoice writingMessage,
      bool startZuriChat,
      bool quickSwitcher,
      List<String> excludeThisChannels,
      bool alwaysScrollMessage,
      bool toggleAwayStatus,
      bool sendOccasionalSurvey,
      bool meliciousLinkWarning});
}

/// @nodoc
class _$AdvancedCopyWithImpl<$Res> implements $AdvancedCopyWith<$Res> {
  _$AdvancedCopyWithImpl(this._value, this._then);

  final Advanced _value;
  // ignore: unused_field
  final $Res Function(Advanced) _then;

  @override
  $Res call({
    Object? whenTypyingCode = freezed,
    Object? formatMessage = freezed,
    Object? writingMessage = freezed,
    Object? startZuriChat = freezed,
    Object? quickSwitcher = freezed,
    Object? excludeThisChannels = freezed,
    Object? alwaysScrollMessage = freezed,
    Object? toggleAwayStatus = freezed,
    Object? sendOccasionalSurvey = freezed,
    Object? meliciousLinkWarning = freezed,
  }) {
    return _then(_value.copyWith(
      whenTypyingCode: whenTypyingCode == freezed
          ? _value.whenTypyingCode
          : whenTypyingCode // ignore: cast_nullable_to_non_nullable
              as bool,
      formatMessage: formatMessage == freezed
          ? _value.formatMessage
          : formatMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      writingMessage: writingMessage == freezed
          ? _value.writingMessage
          : writingMessage // ignore: cast_nullable_to_non_nullable
              as EnterButtonsChoice,
      startZuriChat: startZuriChat == freezed
          ? _value.startZuriChat
          : startZuriChat // ignore: cast_nullable_to_non_nullable
              as bool,
      quickSwitcher: quickSwitcher == freezed
          ? _value.quickSwitcher
          : quickSwitcher // ignore: cast_nullable_to_non_nullable
              as bool,
      excludeThisChannels: excludeThisChannels == freezed
          ? _value.excludeThisChannels
          : excludeThisChannels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alwaysScrollMessage: alwaysScrollMessage == freezed
          ? _value.alwaysScrollMessage
          : alwaysScrollMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      toggleAwayStatus: toggleAwayStatus == freezed
          ? _value.toggleAwayStatus
          : toggleAwayStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      sendOccasionalSurvey: sendOccasionalSurvey == freezed
          ? _value.sendOccasionalSurvey
          : sendOccasionalSurvey // ignore: cast_nullable_to_non_nullable
              as bool,
      meliciousLinkWarning: meliciousLinkWarning == freezed
          ? _value.meliciousLinkWarning
          : meliciousLinkWarning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AdvancedCopyWith<$Res> implements $AdvancedCopyWith<$Res> {
  factory _$AdvancedCopyWith(_Advanced value, $Res Function(_Advanced) then) =
      __$AdvancedCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool whenTypyingCode,
      bool formatMessage,
      EnterButtonsChoice writingMessage,
      bool startZuriChat,
      bool quickSwitcher,
      List<String> excludeThisChannels,
      bool alwaysScrollMessage,
      bool toggleAwayStatus,
      bool sendOccasionalSurvey,
      bool meliciousLinkWarning});
}

/// @nodoc
class __$AdvancedCopyWithImpl<$Res> extends _$AdvancedCopyWithImpl<$Res>
    implements _$AdvancedCopyWith<$Res> {
  __$AdvancedCopyWithImpl(_Advanced _value, $Res Function(_Advanced) _then)
      : super(_value, (v) => _then(v as _Advanced));

  @override
  _Advanced get _value => super._value as _Advanced;

  @override
  $Res call({
    Object? whenTypyingCode = freezed,
    Object? formatMessage = freezed,
    Object? writingMessage = freezed,
    Object? startZuriChat = freezed,
    Object? quickSwitcher = freezed,
    Object? excludeThisChannels = freezed,
    Object? alwaysScrollMessage = freezed,
    Object? toggleAwayStatus = freezed,
    Object? sendOccasionalSurvey = freezed,
    Object? meliciousLinkWarning = freezed,
  }) {
    return _then(_Advanced(
      whenTypyingCode: whenTypyingCode == freezed
          ? _value.whenTypyingCode
          : whenTypyingCode // ignore: cast_nullable_to_non_nullable
              as bool,
      formatMessage: formatMessage == freezed
          ? _value.formatMessage
          : formatMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      writingMessage: writingMessage == freezed
          ? _value.writingMessage
          : writingMessage // ignore: cast_nullable_to_non_nullable
              as EnterButtonsChoice,
      startZuriChat: startZuriChat == freezed
          ? _value.startZuriChat
          : startZuriChat // ignore: cast_nullable_to_non_nullable
              as bool,
      quickSwitcher: quickSwitcher == freezed
          ? _value.quickSwitcher
          : quickSwitcher // ignore: cast_nullable_to_non_nullable
              as bool,
      excludeThisChannels: excludeThisChannels == freezed
          ? _value.excludeThisChannels
          : excludeThisChannels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alwaysScrollMessage: alwaysScrollMessage == freezed
          ? _value.alwaysScrollMessage
          : alwaysScrollMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      toggleAwayStatus: toggleAwayStatus == freezed
          ? _value.toggleAwayStatus
          : toggleAwayStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      sendOccasionalSurvey: sendOccasionalSurvey == freezed
          ? _value.sendOccasionalSurvey
          : sendOccasionalSurvey // ignore: cast_nullable_to_non_nullable
              as bool,
      meliciousLinkWarning: meliciousLinkWarning == freezed
          ? _value.meliciousLinkWarning
          : meliciousLinkWarning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Advanced implements _Advanced {
  const _$_Advanced(
      {this.whenTypyingCode = false,
      this.formatMessage = false,
      this.writingMessage = EnterButtonsChoice.sendMsg,
      this.startZuriChat = false,
      this.quickSwitcher = false,
      this.excludeThisChannels = const [],
      this.alwaysScrollMessage = true,
      this.toggleAwayStatus = true,
      this.sendOccasionalSurvey = true,
      this.meliciousLinkWarning = true});

  factory _$_Advanced.fromJson(Map<String, dynamic> json) =>
      _$$_AdvancedFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool whenTypyingCode;
  @JsonKey(defaultValue: false)
  @override
  final bool formatMessage;
  @JsonKey(defaultValue: EnterButtonsChoice.sendMsg)
  @override
  final EnterButtonsChoice writingMessage;
  @JsonKey(defaultValue: false)
  @override
  final bool startZuriChat;
  @JsonKey(defaultValue: false)
  @override
  final bool quickSwitcher;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> excludeThisChannels;
  @JsonKey(defaultValue: true)
  @override
  final bool alwaysScrollMessage;
  @JsonKey(defaultValue: true)
  @override
  final bool toggleAwayStatus;
  @JsonKey(defaultValue: true)
  @override
  final bool sendOccasionalSurvey;
  @JsonKey(defaultValue: true)
  @override
  final bool meliciousLinkWarning;

  @override
  String toString() {
    return 'Advanced(whenTypyingCode: $whenTypyingCode, formatMessage: $formatMessage, writingMessage: $writingMessage, startZuriChat: $startZuriChat, quickSwitcher: $quickSwitcher, excludeThisChannels: $excludeThisChannels, alwaysScrollMessage: $alwaysScrollMessage, toggleAwayStatus: $toggleAwayStatus, sendOccasionalSurvey: $sendOccasionalSurvey, meliciousLinkWarning: $meliciousLinkWarning)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Advanced &&
            (identical(other.whenTypyingCode, whenTypyingCode) ||
                const DeepCollectionEquality()
                    .equals(other.whenTypyingCode, whenTypyingCode)) &&
            (identical(other.formatMessage, formatMessage) ||
                const DeepCollectionEquality()
                    .equals(other.formatMessage, formatMessage)) &&
            (identical(other.writingMessage, writingMessage) ||
                const DeepCollectionEquality()
                    .equals(other.writingMessage, writingMessage)) &&
            (identical(other.startZuriChat, startZuriChat) ||
                const DeepCollectionEquality()
                    .equals(other.startZuriChat, startZuriChat)) &&
            (identical(other.quickSwitcher, quickSwitcher) ||
                const DeepCollectionEquality()
                    .equals(other.quickSwitcher, quickSwitcher)) &&
            (identical(other.excludeThisChannels, excludeThisChannels) ||
                const DeepCollectionEquality()
                    .equals(other.excludeThisChannels, excludeThisChannels)) &&
            (identical(other.alwaysScrollMessage, alwaysScrollMessage) ||
                const DeepCollectionEquality()
                    .equals(other.alwaysScrollMessage, alwaysScrollMessage)) &&
            (identical(other.toggleAwayStatus, toggleAwayStatus) ||
                const DeepCollectionEquality()
                    .equals(other.toggleAwayStatus, toggleAwayStatus)) &&
            (identical(other.sendOccasionalSurvey, sendOccasionalSurvey) ||
                const DeepCollectionEquality().equals(
                    other.sendOccasionalSurvey, sendOccasionalSurvey)) &&
            (identical(other.meliciousLinkWarning, meliciousLinkWarning) ||
                const DeepCollectionEquality()
                    .equals(other.meliciousLinkWarning, meliciousLinkWarning)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(whenTypyingCode) ^
      const DeepCollectionEquality().hash(formatMessage) ^
      const DeepCollectionEquality().hash(writingMessage) ^
      const DeepCollectionEquality().hash(startZuriChat) ^
      const DeepCollectionEquality().hash(quickSwitcher) ^
      const DeepCollectionEquality().hash(excludeThisChannels) ^
      const DeepCollectionEquality().hash(alwaysScrollMessage) ^
      const DeepCollectionEquality().hash(toggleAwayStatus) ^
      const DeepCollectionEquality().hash(sendOccasionalSurvey) ^
      const DeepCollectionEquality().hash(meliciousLinkWarning);

  @JsonKey(ignore: true)
  @override
  _$AdvancedCopyWith<_Advanced> get copyWith =>
      __$AdvancedCopyWithImpl<_Advanced>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdvancedToJson(this);
  }
}

abstract class _Advanced implements Advanced {
  const factory _Advanced(
      {bool whenTypyingCode,
      bool formatMessage,
      EnterButtonsChoice writingMessage,
      bool startZuriChat,
      bool quickSwitcher,
      List<String> excludeThisChannels,
      bool alwaysScrollMessage,
      bool toggleAwayStatus,
      bool sendOccasionalSurvey,
      bool meliciousLinkWarning}) = _$_Advanced;

  factory _Advanced.fromJson(Map<String, dynamic> json) = _$_Advanced.fromJson;

  @override
  bool get whenTypyingCode => throw _privateConstructorUsedError;
  @override
  bool get formatMessage => throw _privateConstructorUsedError;
  @override
  EnterButtonsChoice get writingMessage => throw _privateConstructorUsedError;
  @override
  bool get startZuriChat => throw _privateConstructorUsedError;
  @override
  bool get quickSwitcher => throw _privateConstructorUsedError;
  @override
  List<String> get excludeThisChannels => throw _privateConstructorUsedError;
  @override
  bool get alwaysScrollMessage => throw _privateConstructorUsedError;
  @override
  bool get toggleAwayStatus => throw _privateConstructorUsedError;
  @override
  bool get sendOccasionalSurvey => throw _privateConstructorUsedError;
  @override
  bool get meliciousLinkWarning => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AdvancedCopyWith<_Advanced> get copyWith =>
      throw _privateConstructorUsedError;
}

Organization _$OrganisationFromJson(Map<String, dynamic> json) {
  return _Organisation.fromJson(json);
}

/// @nodoc
class _$OrganisationTearOff {
  const _$OrganisationTearOff();

  _Organisation call(
      {@JsonKey(name: '_id') required String id,
      @JsonKey(name: 'logo_url') required String logoUrl,
      required String name,
      @JsonKey(name: 'workspace_url') required String workspaceUrl}) {
    return _Organisation(
      id: id,
      logoUrl: logoUrl,
      name: name,
      workspaceUrl: workspaceUrl,
    );
  }

  Organization fromJson(Map<String, Object> json) {
    return Organization.fromJson(json);
  }
}

/// @nodoc
const $Organisation = _$OrganisationTearOff();

/// @nodoc
mixin _$Organisation {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String get logoUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'workspace_url')
  String get workspaceUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganisationCopyWith<Organization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganisationCopyWith<$Res> {
  factory $OrganisationCopyWith(
          Organization value, $Res Function(Organization) then) =
      _$OrganisationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'logo_url') String logoUrl,
      String name,
      @JsonKey(name: 'workspace_url') String workspaceUrl});
}

/// @nodoc
class _$OrganisationCopyWithImpl<$Res> implements $OrganisationCopyWith<$Res> {
  _$OrganisationCopyWithImpl(this._value, this._then);

  final Organization _value;
  // ignore: unused_field
  final $Res Function(Organization) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? logoUrl = freezed,
    Object? name = freezed,
    Object? workspaceUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workspaceUrl: workspaceUrl == freezed
          ? _value.workspaceUrl
          : workspaceUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$OrganisationCopyWith<$Res>
    implements $OrganisationCopyWith<$Res> {
  factory _$OrganisationCopyWith(
          _Organisation value, $Res Function(_Organisation) then) =
      __$OrganisationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'logo_url') String logoUrl,
      String name,
      @JsonKey(name: 'workspace_url') String workspaceUrl});
}

/// @nodoc
class __$OrganisationCopyWithImpl<$Res> extends _$OrganisationCopyWithImpl<$Res>
    implements _$OrganisationCopyWith<$Res> {
  __$OrganisationCopyWithImpl(
      _Organisation _value, $Res Function(_Organisation) _then)
      : super(_value, (v) => _then(v as _Organisation));

  @override
  _Organisation get _value => super._value as _Organisation;

  @override
  $Res call({
    Object? id = freezed,
    Object? logoUrl = freezed,
    Object? name = freezed,
    Object? workspaceUrl = freezed,
  }) {
    return _then(_Organisation(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workspaceUrl: workspaceUrl == freezed
          ? _value.workspaceUrl
          : workspaceUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Organisation implements _Organisation {
  _$_Organisation(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'logo_url') required this.logoUrl,
      required this.name,
      @JsonKey(name: 'workspace_url') required this.workspaceUrl});

  factory _$_Organisation.fromJson(Map<String, dynamic> json) =>
      _$$_OrganisationFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'logo_url')
  final String logoUrl;
  @override
  final String name;
  @override
  @JsonKey(name: 'workspace_url')
  final String workspaceUrl;

  @override
  String toString() {
    return 'Organisation(id: $id, logoUrl: $logoUrl, name: $name, workspaceUrl: $workspaceUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Organisation &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.logoUrl, logoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.logoUrl, logoUrl)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.workspaceUrl, workspaceUrl) ||
                const DeepCollectionEquality()
                    .equals(other.workspaceUrl, workspaceUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(logoUrl) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(workspaceUrl);

  @JsonKey(ignore: true)
  @override
  _$OrganisationCopyWith<_Organisation> get copyWith =>
      __$OrganisationCopyWithImpl<_Organisation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrganisationToJson(this);
  }
}

abstract class _Organisation implements Organization {
  factory _Organisation(
          {@JsonKey(name: '_id') required String id,
          @JsonKey(name: 'logo_url') required String logoUrl,
          required String name,
          @JsonKey(name: 'workspace_url') required String workspaceUrl}) =
      _$_Organisation;

  factory _Organisation.fromJson(Map<String, dynamic> json) =
      _$_Organisation.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'logo_url')
  String get logoUrl => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'workspace_url')
  String get workspaceUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrganisationCopyWith<_Organisation> get copyWith =>
      throw _privateConstructorUsedError;
}

DummyUser _$DummyUserFromJson(Map<String, dynamic> json) {
  return _DummyUser.fromJson(json);
}

/// @nodoc
class _$DummyUserTearOff {
  const _$DummyUserTearOff();

  _DummyUser call(
      {String? name,
      @JsonKey(name: 'profileImage') String? profileImage,
      int id = 1}) {
    return _DummyUser(
      name: name,
      profileImage: profileImage,
      id: id,
    );
  }

  DummyUser fromJson(Map<String, Object> json) {
    return DummyUser.fromJson(json);
  }
}

/// @nodoc
const $DummyUser = _$DummyUserTearOff();

/// @nodoc
mixin _$DummyUser {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'profileImage')
  String? get profileImage => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DummyUserCopyWith<DummyUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DummyUserCopyWith<$Res> {
  factory $DummyUserCopyWith(DummyUser value, $Res Function(DummyUser) then) =
      _$DummyUserCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      @JsonKey(name: 'profileImage') String? profileImage,
      int id});
}

/// @nodoc
class _$DummyUserCopyWithImpl<$Res> implements $DummyUserCopyWith<$Res> {
  _$DummyUserCopyWithImpl(this._value, this._then);

  final DummyUser _value;
  // ignore: unused_field
  final $Res Function(DummyUser) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? profileImage = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: profileImage == freezed
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$DummyUserCopyWith<$Res> implements $DummyUserCopyWith<$Res> {
  factory _$DummyUserCopyWith(
          _DummyUser value, $Res Function(_DummyUser) then) =
      __$DummyUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      @JsonKey(name: 'profileImage') String? profileImage,
      int id});
}

/// @nodoc
class __$DummyUserCopyWithImpl<$Res> extends _$DummyUserCopyWithImpl<$Res>
    implements _$DummyUserCopyWith<$Res> {
  __$DummyUserCopyWithImpl(_DummyUser _value, $Res Function(_DummyUser) _then)
      : super(_value, (v) => _then(v as _DummyUser));

  @override
  _DummyUser get _value => super._value as _DummyUser;

  @override
  $Res call({
    Object? name = freezed,
    Object? profileImage = freezed,
    Object? id = freezed,
  }) {
    return _then(_DummyUser(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: profileImage == freezed
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DummyUser implements _DummyUser {
  _$_DummyUser(
      {this.name,
      @JsonKey(name: 'profileImage') this.profileImage,
      this.id = 1});

  factory _$_DummyUser.fromJson(Map<String, dynamic> json) =>
      _$$_DummyUserFromJson(json);

  @override
  final String? name;
  @override
  @JsonKey(name: 'profileImage')
  final String? profileImage;
  @JsonKey(defaultValue: 1)
  @override
  final int id;

  @override
  String toString() {
    return 'DummyUser(name: $name, profileImage: $profileImage, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DummyUser &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.profileImage, profileImage) ||
                const DeepCollectionEquality()
                    .equals(other.profileImage, profileImage)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(profileImage) ^
      const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$DummyUserCopyWith<_DummyUser> get copyWith =>
      __$DummyUserCopyWithImpl<_DummyUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DummyUserToJson(this);
  }
}

abstract class _DummyUser implements DummyUser {
  factory _DummyUser(
      {String? name,
      @JsonKey(name: 'profileImage') String? profileImage,
      int id}) = _$_DummyUser;

  factory _DummyUser.fromJson(Map<String, dynamic> json) =
      _$_DummyUser.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'profileImage')
  String? get profileImage => throw _privateConstructorUsedError;
  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DummyUserCopyWith<_DummyUser> get copyWith =>
      throw _privateConstructorUsedError;
}

Workspace _$WorkspaceFromJson(Map<String, dynamic> json) {
  return _Workspace.fromJson(json);
}

/// @nodoc
class _$WorkspaceTearOff {
  const _$WorkspaceTearOff();

  _Workspace call(
      {int? id,
      String? name,
      String? url,
      String? logo,
      DummyUser? user,
      List<DummyUser>? users,
      List<Channel>? channels,
      List<DM>? dms,
      int? currentChannel = 0,
      int? currentDM = -1}) {
    return _Workspace(
      id: id,
      name: name,
      url: url,
      logo: logo,
      user: user,
      users: users,
      channels: channels,
      dms: dms,
      currentChannel: currentChannel,
      currentDM: currentDM,
    );
  }

  Workspace fromJson(Map<String, Object> json) {
    return Workspace.fromJson(json);
  }
}

/// @nodoc
const $Workspace = _$WorkspaceTearOff();

/// @nodoc
mixin _$Workspace {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  DummyUser? get user => throw _privateConstructorUsedError;
  List<DummyUser>? get users => throw _privateConstructorUsedError;
  List<Channel>? get channels => throw _privateConstructorUsedError;
  List<DM>? get dms => throw _privateConstructorUsedError;
  int? get currentChannel => throw _privateConstructorUsedError;
  int? get currentDM => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkspaceCopyWith<Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceCopyWith<$Res> {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) then) =
      _$WorkspaceCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? url,
      String? logo,
      DummyUser? user,
      List<DummyUser>? users,
      List<Channel>? channels,
      List<DM>? dms,
      int? currentChannel,
      int? currentDM});

  $DummyUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$WorkspaceCopyWithImpl<$Res> implements $WorkspaceCopyWith<$Res> {
  _$WorkspaceCopyWithImpl(this._value, this._then);

  final Workspace _value;
  // ignore: unused_field
  final $Res Function(Workspace) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? logo = freezed,
    Object? user = freezed,
    Object? users = freezed,
    Object? channels = freezed,
    Object? dms = freezed,
    Object? currentChannel = freezed,
    Object? currentDM = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as DummyUser?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<DummyUser>?,
      channels: channels == freezed
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<Channel>?,
      dms: dms == freezed
          ? _value.dms
          : dms // ignore: cast_nullable_to_non_nullable
              as List<DM>?,
      currentChannel: currentChannel == freezed
          ? _value.currentChannel
          : currentChannel // ignore: cast_nullable_to_non_nullable
              as int?,
      currentDM: currentDM == freezed
          ? _value.currentDM
          : currentDM // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $DummyUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $DummyUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$WorkspaceCopyWith<$Res> implements $WorkspaceCopyWith<$Res> {
  factory _$WorkspaceCopyWith(
          _Workspace value, $Res Function(_Workspace) then) =
      __$WorkspaceCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? url,
      String? logo,
      DummyUser? user,
      List<DummyUser>? users,
      List<Channel>? channels,
      List<DM>? dms,
      int? currentChannel,
      int? currentDM});

  @override
  $DummyUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$WorkspaceCopyWithImpl<$Res> extends _$WorkspaceCopyWithImpl<$Res>
    implements _$WorkspaceCopyWith<$Res> {
  __$WorkspaceCopyWithImpl(_Workspace _value, $Res Function(_Workspace) _then)
      : super(_value, (v) => _then(v as _Workspace));

  @override
  _Workspace get _value => super._value as _Workspace;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? logo = freezed,
    Object? user = freezed,
    Object? users = freezed,
    Object? channels = freezed,
    Object? dms = freezed,
    Object? currentChannel = freezed,
    Object? currentDM = freezed,
  }) {
    return _then(_Workspace(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as DummyUser?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<DummyUser>?,
      channels: channels == freezed
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<Channel>?,
      dms: dms == freezed
          ? _value.dms
          : dms // ignore: cast_nullable_to_non_nullable
              as List<DM>?,
      currentChannel: currentChannel == freezed
          ? _value.currentChannel
          : currentChannel // ignore: cast_nullable_to_non_nullable
              as int?,
      currentDM: currentDM == freezed
          ? _value.currentDM
          : currentDM // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Workspace implements _Workspace {
  _$_Workspace(
      {this.id,
      this.name,
      this.url,
      this.logo,
      this.user,
      this.users,
      this.channels,
      this.dms,
      this.currentChannel = 0,
      this.currentDM = -1});

  factory _$_Workspace.fromJson(Map<String, dynamic> json) =>
      _$$_WorkspaceFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? url;
  @override
  final String? logo;
  @override
  final DummyUser? user;
  @override
  final List<DummyUser>? users;
  @override
  final List<Channel>? channels;
  @override
  final List<DM>? dms;
  @JsonKey(defaultValue: 0)
  @override
  final int? currentChannel;
  @JsonKey(defaultValue: -1)
  @override
  final int? currentDM;

  @override
  String toString() {
    return 'Workspace(id: $id, name: $name, url: $url, logo: $logo, user: $user, users: $users, channels: $channels, dms: $dms, currentChannel: $currentChannel, currentDM: $currentDM)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Workspace &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.logo, logo) ||
                const DeepCollectionEquality().equals(other.logo, logo)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.channels, channels) ||
                const DeepCollectionEquality()
                    .equals(other.channels, channels)) &&
            (identical(other.dms, dms) ||
                const DeepCollectionEquality().equals(other.dms, dms)) &&
            (identical(other.currentChannel, currentChannel) ||
                const DeepCollectionEquality()
                    .equals(other.currentChannel, currentChannel)) &&
            (identical(other.currentDM, currentDM) ||
                const DeepCollectionEquality()
                    .equals(other.currentDM, currentDM)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(logo) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(channels) ^
      const DeepCollectionEquality().hash(dms) ^
      const DeepCollectionEquality().hash(currentChannel) ^
      const DeepCollectionEquality().hash(currentDM);

  @JsonKey(ignore: true)
  @override
  _$WorkspaceCopyWith<_Workspace> get copyWith =>
      __$WorkspaceCopyWithImpl<_Workspace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkspaceToJson(this);
  }
}

abstract class _Workspace implements Workspace {
  factory _Workspace(
      {int? id,
      String? name,
      String? url,
      String? logo,
      DummyUser? user,
      List<DummyUser>? users,
      List<Channel>? channels,
      List<DM>? dms,
      int? currentChannel,
      int? currentDM}) = _$_Workspace;

  factory _Workspace.fromJson(Map<String, dynamic> json) =
      _$_Workspace.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  String? get logo => throw _privateConstructorUsedError;
  @override
  DummyUser? get user => throw _privateConstructorUsedError;
  @override
  List<DummyUser>? get users => throw _privateConstructorUsedError;
  @override
  List<Channel>? get channels => throw _privateConstructorUsedError;
  @override
  List<DM>? get dms => throw _privateConstructorUsedError;
  @override
  int? get currentChannel => throw _privateConstructorUsedError;
  @override
  int? get currentDM => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WorkspaceCopyWith<_Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return _Channel.fromJson(json);
}

/// @nodoc
class _$ChannelTearOff {
  const _$ChannelTearOff();

  _Channel call(
      {String? name,
      String? topic,
      List<DummyUser>? users,
      bool? private,
      BaseChat? baseChat}) {
    return _Channel(
      name: name,
      topic: topic,
      users: users,
      private: private,
      baseChat: baseChat,
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
  String? get name => throw _privateConstructorUsedError;
  String? get topic => throw _privateConstructorUsedError;
  List<DummyUser>? get users => throw _privateConstructorUsedError;
  bool? get private => throw _privateConstructorUsedError;
  BaseChat? get baseChat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelCopyWith<Channel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelCopyWith<$Res> {
  factory $ChannelCopyWith(Channel value, $Res Function(Channel) then) =
      _$ChannelCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      String? topic,
      List<DummyUser>? users,
      bool? private,
      BaseChat? baseChat});

  $BaseChatCopyWith<$Res>? get baseChat;
}

/// @nodoc
class _$ChannelCopyWithImpl<$Res> implements $ChannelCopyWith<$Res> {
  _$ChannelCopyWithImpl(this._value, this._then);

  final Channel _value;
  // ignore: unused_field
  final $Res Function(Channel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? topic = freezed,
    Object? users = freezed,
    Object? private = freezed,
    Object? baseChat = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<DummyUser>?,
      private: private == freezed
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool?,
      baseChat: baseChat == freezed
          ? _value.baseChat
          : baseChat // ignore: cast_nullable_to_non_nullable
              as BaseChat?,
    ));
  }

  @override
  $BaseChatCopyWith<$Res>? get baseChat {
    if (_value.baseChat == null) {
      return null;
    }

    return $BaseChatCopyWith<$Res>(_value.baseChat!, (value) {
      return _then(_value.copyWith(baseChat: value));
    });
  }
}

/// @nodoc
abstract class _$ChannelCopyWith<$Res> implements $ChannelCopyWith<$Res> {
  factory _$ChannelCopyWith(_Channel value, $Res Function(_Channel) then) =
      __$ChannelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      String? topic,
      List<DummyUser>? users,
      bool? private,
      BaseChat? baseChat});

  @override
  $BaseChatCopyWith<$Res>? get baseChat;
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
    Object? name = freezed,
    Object? topic = freezed,
    Object? users = freezed,
    Object? private = freezed,
    Object? baseChat = freezed,
  }) {
    return _then(_Channel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<DummyUser>?,
      private: private == freezed
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool?,
      baseChat: baseChat == freezed
          ? _value.baseChat
          : baseChat // ignore: cast_nullable_to_non_nullable
              as BaseChat?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Channel implements _Channel {
  _$_Channel({this.name, this.topic, this.users, this.private, this.baseChat});

  factory _$_Channel.fromJson(Map<String, dynamic> json) =>
      _$$_ChannelFromJson(json);

  @override
  final String? name;
  @override
  final String? topic;
  @override
  final List<DummyUser>? users;
  @override
  final bool? private;
  @override
  final BaseChat? baseChat;

  @override
  String toString() {
    return 'Channel(name: $name, topic: $topic, users: $users, private: $private, baseChat: $baseChat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Channel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.topic, topic) ||
                const DeepCollectionEquality().equals(other.topic, topic)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.private, private) ||
                const DeepCollectionEquality()
                    .equals(other.private, private)) &&
            (identical(other.baseChat, baseChat) ||
                const DeepCollectionEquality()
                    .equals(other.baseChat, baseChat)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(topic) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(private) ^
      const DeepCollectionEquality().hash(baseChat);

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
  factory _Channel(
      {String? name,
      String? topic,
      List<DummyUser>? users,
      bool? private,
      BaseChat? baseChat}) = _$_Channel;

  factory _Channel.fromJson(Map<String, dynamic> json) = _$_Channel.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get topic => throw _privateConstructorUsedError;
  @override
  List<DummyUser>? get users => throw _privateConstructorUsedError;
  @override
  bool? get private => throw _privateConstructorUsedError;
  @override
  BaseChat? get baseChat => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChannelCopyWith<_Channel> get copyWith =>
      throw _privateConstructorUsedError;
}

DM _$DMFromJson(Map<String, dynamic> json) {
  return _DM.fromJson(json);
}

/// @nodoc
class _$DMTearOff {
  const _$DMTearOff();

  _DM call({DummyUser? user, BaseChat? baseChat}) {
    return _DM(
      user: user,
      baseChat: baseChat,
    );
  }

  DM fromJson(Map<String, Object> json) {
    return DM.fromJson(json);
  }
}

/// @nodoc
const $DM = _$DMTearOff();

/// @nodoc
mixin _$DM {
  DummyUser? get user => throw _privateConstructorUsedError;
  BaseChat? get baseChat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DMCopyWith<DM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DMCopyWith<$Res> {
  factory $DMCopyWith(DM value, $Res Function(DM) then) =
      _$DMCopyWithImpl<$Res>;
  $Res call({DummyUser? user, BaseChat? baseChat});

  $DummyUserCopyWith<$Res>? get user;
  $BaseChatCopyWith<$Res>? get baseChat;
}

/// @nodoc
class _$DMCopyWithImpl<$Res> implements $DMCopyWith<$Res> {
  _$DMCopyWithImpl(this._value, this._then);

  final DM _value;
  // ignore: unused_field
  final $Res Function(DM) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? baseChat = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as DummyUser?,
      baseChat: baseChat == freezed
          ? _value.baseChat
          : baseChat // ignore: cast_nullable_to_non_nullable
              as BaseChat?,
    ));
  }

  @override
  $DummyUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $DummyUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $BaseChatCopyWith<$Res>? get baseChat {
    if (_value.baseChat == null) {
      return null;
    }

    return $BaseChatCopyWith<$Res>(_value.baseChat!, (value) {
      return _then(_value.copyWith(baseChat: value));
    });
  }
}

/// @nodoc
abstract class _$DMCopyWith<$Res> implements $DMCopyWith<$Res> {
  factory _$DMCopyWith(_DM value, $Res Function(_DM) then) =
      __$DMCopyWithImpl<$Res>;
  @override
  $Res call({DummyUser? user, BaseChat? baseChat});

  @override
  $DummyUserCopyWith<$Res>? get user;
  @override
  $BaseChatCopyWith<$Res>? get baseChat;
}

/// @nodoc
class __$DMCopyWithImpl<$Res> extends _$DMCopyWithImpl<$Res>
    implements _$DMCopyWith<$Res> {
  __$DMCopyWithImpl(_DM _value, $Res Function(_DM) _then)
      : super(_value, (v) => _then(v as _DM));

  @override
  _DM get _value => super._value as _DM;

  @override
  $Res call({
    Object? user = freezed,
    Object? baseChat = freezed,
  }) {
    return _then(_DM(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as DummyUser?,
      baseChat: baseChat == freezed
          ? _value.baseChat
          : baseChat // ignore: cast_nullable_to_non_nullable
              as BaseChat?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DM implements _DM {
  _$_DM({this.user, this.baseChat});

  factory _$_DM.fromJson(Map<String, dynamic> json) => _$$_DMFromJson(json);

  @override
  final DummyUser? user;
  @override
  final BaseChat? baseChat;

  @override
  String toString() {
    return 'DM(user: $user, baseChat: $baseChat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DM &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.baseChat, baseChat) ||
                const DeepCollectionEquality()
                    .equals(other.baseChat, baseChat)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(baseChat);

  @JsonKey(ignore: true)
  @override
  _$DMCopyWith<_DM> get copyWith => __$DMCopyWithImpl<_DM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DMToJson(this);
  }
}

abstract class _DM implements DM {
  factory _DM({DummyUser? user, BaseChat? baseChat}) = _$_DM;

  factory _DM.fromJson(Map<String, dynamic> json) = _$_DM.fromJson;

  @override
  DummyUser? get user => throw _privateConstructorUsedError;
  @override
  BaseChat? get baseChat => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DMCopyWith<_DM> get copyWith => throw _privateConstructorUsedError;
}

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
class _$ChatTearOff {
  const _$ChatTearOff();

  _Chat call({int? timestamp, String? text, DummyUser? user}) {
    return _Chat(
      timestamp: timestamp,
      text: text,
      user: user,
    );
  }

  Chat fromJson(Map<String, Object> json) {
    return Chat.fromJson(json);
  }
}

/// @nodoc
const $Chat = _$ChatTearOff();

/// @nodoc
mixin _$Chat {
  int? get timestamp => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  DummyUser? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res>;
  $Res call({int? timestamp, String? text, DummyUser? user});

  $DummyUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ChatCopyWithImpl<$Res> implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  final Chat _value;
  // ignore: unused_field
  final $Res Function(Chat) _then;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? text = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as DummyUser?,
    ));
  }

  @override
  $DummyUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $DummyUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$ChatCopyWith(_Chat value, $Res Function(_Chat) then) =
      __$ChatCopyWithImpl<$Res>;
  @override
  $Res call({int? timestamp, String? text, DummyUser? user});

  @override
  $DummyUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res>
    implements _$ChatCopyWith<$Res> {
  __$ChatCopyWithImpl(_Chat _value, $Res Function(_Chat) _then)
      : super(_value, (v) => _then(v as _Chat));

  @override
  _Chat get _value => super._value as _Chat;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? text = freezed,
    Object? user = freezed,
  }) {
    return _then(_Chat(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as DummyUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chat implements _Chat {
  _$_Chat({this.timestamp, this.text, this.user});

  factory _$_Chat.fromJson(Map<String, dynamic> json) => _$$_ChatFromJson(json);

  @override
  final int? timestamp;
  @override
  final String? text;
  @override
  final DummyUser? user;

  @override
  String toString() {
    return 'Chat(timestamp: $timestamp, text: $text, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Chat &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$ChatCopyWith<_Chat> get copyWith =>
      __$ChatCopyWithImpl<_Chat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatToJson(this);
  }
}

abstract class _Chat implements Chat {
  factory _Chat({int? timestamp, String? text, DummyUser? user}) = _$_Chat;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  @override
  int? get timestamp => throw _privateConstructorUsedError;
  @override
  String? get text => throw _privateConstructorUsedError;
  @override
  DummyUser? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChatCopyWith<_Chat> get copyWith => throw _privateConstructorUsedError;
}

BaseChat _$BaseChatFromJson(Map<String, dynamic> json) {
  return _BaseChat.fromJson(json);
}

/// @nodoc
class _$BaseChatTearOff {
  const _$BaseChatTearOff();

  _BaseChat call({List<Chat>? chats}) {
    return _BaseChat(
      chats: chats,
    );
  }

  BaseChat fromJson(Map<String, Object> json) {
    return BaseChat.fromJson(json);
  }
}

/// @nodoc
const $BaseChat = _$BaseChatTearOff();

/// @nodoc
mixin _$BaseChat {
  List<Chat>? get chats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseChatCopyWith<BaseChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseChatCopyWith<$Res> {
  factory $BaseChatCopyWith(BaseChat value, $Res Function(BaseChat) then) =
      _$BaseChatCopyWithImpl<$Res>;
  $Res call({List<Chat>? chats});
}

/// @nodoc
class _$BaseChatCopyWithImpl<$Res> implements $BaseChatCopyWith<$Res> {
  _$BaseChatCopyWithImpl(this._value, this._then);

  final BaseChat _value;
  // ignore: unused_field
  final $Res Function(BaseChat) _then;

  @override
  $Res call({
    Object? chats = freezed,
  }) {
    return _then(_value.copyWith(
      chats: chats == freezed
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<Chat>?,
    ));
  }
}

/// @nodoc
abstract class _$BaseChatCopyWith<$Res> implements $BaseChatCopyWith<$Res> {
  factory _$BaseChatCopyWith(_BaseChat value, $Res Function(_BaseChat) then) =
      __$BaseChatCopyWithImpl<$Res>;
  @override
  $Res call({List<Chat>? chats});
}

/// @nodoc
class __$BaseChatCopyWithImpl<$Res> extends _$BaseChatCopyWithImpl<$Res>
    implements _$BaseChatCopyWith<$Res> {
  __$BaseChatCopyWithImpl(_BaseChat _value, $Res Function(_BaseChat) _then)
      : super(_value, (v) => _then(v as _BaseChat));

  @override
  _BaseChat get _value => super._value as _BaseChat;

  @override
  $Res call({
    Object? chats = freezed,
  }) {
    return _then(_BaseChat(
      chats: chats == freezed
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<Chat>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BaseChat implements _BaseChat {
  _$_BaseChat({this.chats});

  factory _$_BaseChat.fromJson(Map<String, dynamic> json) =>
      _$$_BaseChatFromJson(json);

  @override
  final List<Chat>? chats;

  @override
  String toString() {
    return 'BaseChat(chats: $chats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BaseChat &&
            (identical(other.chats, chats) ||
                const DeepCollectionEquality().equals(other.chats, chats)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(chats);

  @JsonKey(ignore: true)
  @override
  _$BaseChatCopyWith<_BaseChat> get copyWith =>
      __$BaseChatCopyWithImpl<_BaseChat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BaseChatToJson(this);
  }
}

abstract class _BaseChat implements BaseChat {
  factory _BaseChat({List<Chat>? chats}) = _$_BaseChat;

  factory _BaseChat.fromJson(Map<String, dynamic> json) = _$_BaseChat.fromJson;

  @override
  List<Chat>? get chats => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BaseChatCopyWith<_BaseChat> get copyWith =>
      throw _privateConstructorUsedError;
}
