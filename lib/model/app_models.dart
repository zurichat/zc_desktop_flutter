import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zc_desktop_flutter/core/enums/flash_windows.dart';
import 'package:zc_desktop_flutter/core/enums/pre_bar.dart';
import 'package:zc_desktop_flutter/core/enums/pre_sidebar.dart';
import 'package:zc_desktop_flutter/core/enums/pref_message.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/advanced/advanced_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/messages_media_preference/message_media_preferenceview.dart';

part 'app_models.freezed.dart';
part 'app_models.g.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'display_name') required String displayName,
    required String email,
    required String phone,
    required int status,
    @JsonKey(name: 'time_zone') required String timeZone,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required String token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class AuthResponse with _$AuthResponse {
  factory AuthResponse({
    @JsonKey(name: 'session_id') required String sessionID,
    required User user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
class MessagesResponse with _$MessagesResponse {
  factory MessagesResponse(
      {@Default(0) int count,
      String? next,
      String? previous,
      @Default([]) List<Results> results}) = _MessagesResponse;

  factory MessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagesResponseFromJson(json);
}

@freezed
class Results with _$Results {
  factory Results(
      {@Default('') String id,
      @Default('') String created_at,
      @Default([]) List<String> media,
      @Default('') String message,
      @Default(false) bool pinned,
      @Default([]) List<String> reactions,
      @Default(false) bool read,
      @Default('') String room_id,
      @Default([]) List<String> saved_by,
      @Default('') String sender_id,
      @Default([]) List<String> threads}) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}

@freezed
class MarkMessageAsReadResponse with _$MarkMessageAsReadResponse {
  factory MarkMessageAsReadResponse({@Default(false) bool read}) =
      _MarkMessageAsReadResponse;

  factory MarkMessageAsReadResponse.fromJson(Map<String, dynamic> json) =>
      _$MarkMessageAsReadResponseFromJson(json);
}

@freezed
class CreateRoomResponse with _$CreateRoomResponse {
  factory CreateRoomResponse({
    @JsonKey(name: 'room_id') required String roomId,
  }) = _CreateRoomResponse;

  factory CreateRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRoomResponseFromJson(json);
}

@freezed
class SendMessageResponse with _$SendMessageResponse {
  factory SendMessageResponse({
    @Default('') String status,
    @Default('') String message_id,
    @Default('') String room_id,
    @Default('') String event,
    @Default(false) bool thread,
    required SendMessageResponseData data,
  }) = _SendMessageResponse;

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendMessageResponseFromJson(json);
}

@freezed
class SendMessageResponseData with _$SendMessageResponseData {
  factory SendMessageResponseData({
    @Default('') String sender_id,
    @Default('') String message,
    @Default('') String created_at,
  }) = _SendMessageResponseData;

  factory SendMessageResponseData.fromJson(Map<String, dynamic> json) =>
      _$SendMessageResponseDataFromJson(json);
}

@freezed
class RoomInfoResponse with _$RoomInfoResponse {
  factory RoomInfoResponse(
          {@JsonKey(name: 'created_at') required String createdAt,
          required String description,
          @JsonKey(name: 'Number of users') required String numberOfUsers,
          @JsonKey(name: 'org_id') required String orgId,
          @JsonKey(name: 'room_id') required String roomId,
          @JsonKey(name: 'room_user_ids') required List<String> roomUserIds}) =
      _RoomInfoResponse;

  factory RoomInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomInfoResponseFromJson(json);
}

@freezed
class Themes with _$Themes {
  const factory Themes({
    @Default(false) bool syncWithOS,
    @Default('Light') String themes,
    @Default('Aubergine') String colors,
  }) = _Themes;

  factory Themes.fromJson(Map<String, dynamic> json) => _$ThemesFromJson(json);
}

@freezed
class SideBar with _$SideBar {
  const factory SideBar({
    @Default(PreBar.Alpha) @JsonKey(name: 'sidebar_sort') PreBar sort,
    @Default(true)
    @JsonKey(name: 'show_profile_picture_next_to_dm')
        bool showPictureNextToDm,
    @Default(false)
    @JsonKey(name: 'list_private_channels_seperately')
        bool listPrivateChannelSeperatley,
    @Default(true)
    @JsonKey(name: 'organize_external_conversations')
        bool organizeExternalConversation,
    @Default(PrefSidebar.AllConversation)
    @JsonKey(name: 'show_conversations')
        PrefSidebar showConversation,
    @Default(true) bool showInsights,
    @Default(true) bool showThreads,
    @Default(true) bool showAllDms,
    @Default(true) bool showDrafts,
    @Default(true) bool showFiles,
    @Default(true) bool showIntegrate,
    @Default(true) bool showToDo,
    @Default(false) bool showFileBrowser,
    @Default(false) bool showChannelBrowser,
  }) = _SideBar;

  factory SideBar.fromJson(Map<String, dynamic> json) =>
      _$SideBarFromJson(json);
}

@freezed
class Notification with _$Notification {
  const factory Notification({
    @Default(PrefMessageNotification.DirectMessages)
        PrefMessageNotification notifyMe,
    @Default(false) bool differentSettingsForMobile,
    @Default(false) bool meetingStart,
    @Default(false) bool repliesToThread,
    @Default([]) List<String> keyword,
    @Default('Duration') String duration,
    @Default('From') String from,
    @Default('To') String to,
    @Default(true) bool includePreview,
    @Default(false) bool muteAll,
    @Default('Pick sound') String messageSound,
    @Default('Pick sound') String loungeSound,
    @Default(FlashWindows.WhenIdle) FlashWindows flashOnNotification,
    @Default('Pick sound') String deliverSound,
    @Default('When I am online') String notActiveOnDesktop,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}

@freezed
class MessagesAndMedia with _$MessagesAndMedia {
  const factory MessagesAndMedia({
    @Default(PrefTheme.Compact) PrefTheme theme,
    @Default(PrefTheme.JustDisplayNames) PrefTheme name,
    @Default(true) bool displayInfo,
    @Default(false) bool showTime,
    @Default(true) bool disPlayColor,
    @Default(false) bool displayEmojiAsPlain,
    @Default(true) bool showJumbomoji,
    @Default(true) bool showUploadPreview,
    @Default(true) bool showLinkPreview,
    @Default(false) bool largerThan2,
    @Default(false) bool showLinkPreviewText,
  }) = _MessagesAndMedia;

  factory MessagesAndMedia.fromJson(Map<String, dynamic> json) =>
      _$MessagesAndMediaFromJson(json);
}

@freezed
class AudioAndVideo with _$AudioAndVideo {
  const factory AudioAndVideo({
    @Default(true) bool enableMic,
    @Default(true) bool setMyStatusOnCall,
    @Default(false) bool muteOnMic,
    @Default(true) bool setMyStatusInHuddle,
    @Default(false) bool muteInHuddle,
    @Default(false) turnOnCaption,
    @Default(false) sendAWarning,
    @Default(true) setStatusZuriCall,
    @Default(false) muteMicZuriCall,
    @Default(true) playMusic,
  }) = _AudioAndVideo;

  factory AudioAndVideo.fromJson(Map<String, dynamic> json) =>
      _$AudioAndVideoFromJson(json);
}

@freezed
class Advanced with _$Advanced {
  const factory Advanced({
    @Default(false) bool whenTypyingCode,
    @Default(false) bool formatMessage,
    @Default(EnterButtonsChoice.sendMsg) EnterButtonsChoice writingMessage,
    @Default(false) bool startZuriChat,
    @Default(false) bool quickSwitcher,
    @Default([]) List<String> excludeThisChannels,
    @Default(true) bool alwaysScrollMessage,
    @Default(true) bool toggleAwayStatus,
    @Default(true) bool sendOccasionalSurvey,
    @Default(true) bool meliciousLinkWarning,
  }) = _Advanced;

  factory Advanced.fromJson(Map<String, dynamic> json) =>
      _$AdvancedFromJson(json);
}

/* @freezed
class Organization with _$Organisation {
  factory Organization({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'logo_url') required String logoUrl,
    required String name,
    @JsonKey(name: 'workspace_url') required String workspaceUrl,
  }) = _Organisation;

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganisationFromJson(json);
} */

@freezed
class DummyUser with _$DummyUser {
  factory DummyUser(
      {String? name,
      @JsonKey(name: 'profileImage') String? profileImage,
      @Default(1) int id}) = _DummyUser;

  factory DummyUser.fromJson(Map<String, dynamic> json) =>
      _$DummyUserFromJson(json);
}

@freezed
class Workspace with _$Workspace {
  factory Workspace(
      {int? id,
      String? name,
      String? url,
      String? logo,
      DummyUser? user,
      List<DummyUser>? users,
      List<Channel>? channels,
      List<DM>? dms,
      @Default(0) int? currentChannel,
      @Default(-1) int? currentDM}) = _Workspace;

  factory Workspace.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFromJson(json);
}

@freezed
class DM with _$DM {
  factory DM({DummyUser? user, BaseChat? baseChat}) = _DM;
  factory DM.fromJson(Map<String, dynamic> json) => _$DMFromJson(json);
}

@freezed
class Chat with _$Chat {
  factory Chat({int? timestamp, String? text, DummyUser? user}) = _Chat;
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}

@freezed
abstract class BaseChat with _$BaseChat {
  factory BaseChat({List<Chat>? chats}) = _BaseChat;
  factory BaseChat.fromJson(Map<String, dynamic> json) =>
      _$BaseChatFromJson(json);
}

@freezed
class Channel with _$Channel{
  factory Channel({
     String? id,
     String? name,
     String? owner,
     String? description,
     bool? private,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

@freezed
class Organization with _$Organization{
  factory Organization({
    @JsonKey(name: '_id')   String? id,
    @JsonKey(name: 'logo_url')  String? logoUrl,
    required String? name,
    @JsonKey(name: 'workspace_url') String? workspaceUrl,
  })= _Organization;

factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}

@freezed
class ChannelMessagesResponse with _$ChannelMessagesResponse{

  factory ChannelMessagesResponse({
    int? status,
    String? message,
    @Default([]) List<ChannelMessage> data
  }) = _ChannelMessagesResponse; 
  
  factory ChannelMessagesResponse.fromJson(Map<String, dynamic> json) => _$ChannelMessagesResponseFromJson(json);
}

@freezed
class ChannelMessage with _$ChannelMessage{
  
  factory ChannelMessage(
      {@Default('') @JsonKey(name: '_id') String? id,
      @Default('') String content,
      @Default('') String channel_id,
      @Default('') String timestamp,
      @Default('') String user_id,})= _ChannelMessage;

  factory ChannelMessage.fromJson(Map<String, dynamic> json) => _$ChannelMessageFromJson(json);
}