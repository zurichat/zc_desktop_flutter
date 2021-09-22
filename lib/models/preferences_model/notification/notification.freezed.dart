// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
