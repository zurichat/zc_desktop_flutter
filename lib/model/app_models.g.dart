// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      displayName: json['display_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      status: json['status'] as int,
      timeZone: json['time_zone'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'display_name': instance.displayName,
      'email': instance.email,
      'phone': instance.phone,
      'status': instance.status,
      'time_zone': instance.timeZone,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'token': instance.token,
    };

_$_AuthResponse _$$_AuthResponseFromJson(Map<String, dynamic> json) =>
    _$_AuthResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Auth.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthResponseToJson(_$_AuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$_Auth _$$_AuthFromJson(Map<String, dynamic> json) => _$_Auth(
      sessionID: json['sessionID'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthToJson(_$_Auth instance) => <String, dynamic>{
      'sessionID': instance.sessionID,
      'user': instance.user,
    };

_$_MessagesResponse _$$_MessagesResponseFromJson(Map<String, dynamic> json) =>
    _$_MessagesResponse(
      count: json['count'] as int? ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MessagesResponseToJson(_$_MessagesResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_$_Results _$$_ResultsFromJson(Map<String, dynamic> json) => _$_Results(
      id: json['id'] as String? ?? '',
      created_at: json['created_at'] as String? ?? '',
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      message: json['message'] as String? ?? '',
      pinned: json['pinned'] as bool? ?? false,
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      read: json['read'] as bool? ?? false,
      room_id: json['room_id'] as String? ?? '',
      saved_by: (json['saved_by'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      sender_id: json['sender_id'] as String? ?? '',
      threads: (json['threads'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ResultsToJson(_$_Results instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'media': instance.media,
      'message': instance.message,
      'pinned': instance.pinned,
      'reactions': instance.reactions,
      'read': instance.read,
      'room_id': instance.room_id,
      'saved_by': instance.saved_by,
      'sender_id': instance.sender_id,
      'threads': instance.threads,
    };

_$_MarkMessageAsReadResponse _$$_MarkMessageAsReadResponseFromJson(
        Map<String, dynamic> json) =>
    _$_MarkMessageAsReadResponse(
      read: json['read'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MarkMessageAsReadResponseToJson(
        _$_MarkMessageAsReadResponse instance) =>
    <String, dynamic>{
      'read': instance.read,
    };

_$_CreateRoomResponse _$$_CreateRoomResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CreateRoomResponse(
      roomId: json['room_id'] as String,
    );

Map<String, dynamic> _$$_CreateRoomResponseToJson(
        _$_CreateRoomResponse instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
    };

_$_SendMessageResponse _$$_SendMessageResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SendMessageResponse(
      status: json['status'] as String? ?? '',
      message_id: json['message_id'] as String? ?? '',
      room_id: json['room_id'] as String? ?? '',
      event: json['event'] as String? ?? '',
      thread: json['thread'] as bool? ?? false,
      data: SendMessageResponseData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SendMessageResponseToJson(
        _$_SendMessageResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message_id': instance.message_id,
      'room_id': instance.room_id,
      'event': instance.event,
      'thread': instance.thread,
      'data': instance.data,
    };

_$_SendMessageResponseData _$$_SendMessageResponseDataFromJson(
        Map<String, dynamic> json) =>
    _$_SendMessageResponseData(
      sender_id: json['sender_id'] as String? ?? '',
      message: json['message'] as String? ?? '',
      created_at: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$$_SendMessageResponseDataToJson(
        _$_SendMessageResponseData instance) =>
    <String, dynamic>{
      'sender_id': instance.sender_id,
      'message': instance.message,
      'created_at': instance.created_at,
    };

_$_RoomInfoResponse _$$_RoomInfoResponseFromJson(Map<String, dynamic> json) =>
    _$_RoomInfoResponse(
      createdAt: json['created_at'] as String,
      description: json['description'] as String,
      numberOfUsers: json['Number of users'] as String,
      orgId: json['org_id'] as String,
      roomId: json['room_id'] as String,
      roomUserIds: (json['room_user_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_RoomInfoResponseToJson(_$_RoomInfoResponse instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'description': instance.description,
      'Number of users': instance.numberOfUsers,
      'org_id': instance.orgId,
      'room_id': instance.roomId,
      'room_user_ids': instance.roomUserIds,
    };

_$_Themes _$$_ThemesFromJson(Map<String, dynamic> json) => _$_Themes(
      syncWithOS: json['syncWithOS'] as bool? ?? false,
      themes: json['themes'] as String? ?? 'Light',
      colors: json['colors'] as String? ?? 'Aubergine',
    );

Map<String, dynamic> _$$_ThemesToJson(_$_Themes instance) => <String, dynamic>{
      'syncWithOS': instance.syncWithOS,
      'themes': instance.themes,
      'colors': instance.colors,
    };

_$_SideBar _$$_SideBarFromJson(Map<String, dynamic> json) => _$_SideBar(
      sort: _$enumDecodeNullable(_$PreBarEnumMap, json['sidebar_sort']) ??
          PreBar.Alpha,
      showPictureNextToDm:
          json['show_profile_picture_next_to_dm'] as bool? ?? true,
      listPrivateChannelSeperatley:
          json['list_private_channels_seperately'] as bool? ?? false,
      organizeExternalConversation:
          json['organize_external_conversations'] as bool? ?? true,
      showConversation: _$enumDecodeNullable(
              _$PrefSidebarEnumMap, json['show_conversations']) ??
          PrefSidebar.AllConversation,
      showInsights: json['showInsights'] as bool? ?? true,
      showThreads: json['showThreads'] as bool? ?? true,
      showAllDms: json['showAllDms'] as bool? ?? true,
      showDrafts: json['showDrafts'] as bool? ?? true,
      showFiles: json['showFiles'] as bool? ?? true,
      showIntegrate: json['showIntegrate'] as bool? ?? true,
      showToDo: json['showToDo'] as bool? ?? true,
      showFileBrowser: json['showFileBrowser'] as bool? ?? false,
      showChannelBrowser: json['showChannelBrowser'] as bool? ?? false,
    );

Map<String, dynamic> _$$_SideBarToJson(_$_SideBar instance) =>
    <String, dynamic>{
      'sidebar_sort': _$PreBarEnumMap[instance.sort],
      'show_profile_picture_next_to_dm': instance.showPictureNextToDm,
      'list_private_channels_seperately': instance.listPrivateChannelSeperatley,
      'organize_external_conversations': instance.organizeExternalConversation,
      'show_conversations': _$PrefSidebarEnumMap[instance.showConversation],
      'showInsights': instance.showInsights,
      'showThreads': instance.showThreads,
      'showAllDms': instance.showAllDms,
      'showDrafts': instance.showDrafts,
      'showFiles': instance.showFiles,
      'showIntegrate': instance.showIntegrate,
      'showToDo': instance.showToDo,
      'showFileBrowser': instance.showFileBrowser,
      'showChannelBrowser': instance.showChannelBrowser,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$PreBarEnumMap = {
  PreBar.Alpha: 'Alpha',
  PreBar.Recent: 'Recent',
  PreBar.Priority: 'Priority',
};

const _$PrefSidebarEnumMap = {
  PrefSidebar.AllConversation: 'AllConversation',
  PrefSidebar.Unread: 'Unread',
  PrefSidebar.Custom: 'Custom',
};

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      notifyMe: _$enumDecodeNullable(
              _$PrefMessageNotificationEnumMap, json['notifyMe']) ??
          PrefMessageNotification.DirectMessages,
      differentSettingsForMobile:
          json['differentSettingsForMobile'] as bool? ?? false,
      meetingStart: json['meetingStart'] as bool? ?? false,
      repliesToThread: json['repliesToThread'] as bool? ?? false,
      keyword: (json['keyword'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      duration: json['duration'] as String? ?? 'Duration',
      from: json['from'] as String? ?? 'From',
      to: json['to'] as String? ?? 'To',
      includePreview: json['includePreview'] as bool? ?? true,
      muteAll: json['muteAll'] as bool? ?? false,
      messageSound: json['messageSound'] as String? ?? 'Pick sound',
      loungeSound: json['loungeSound'] as String? ?? 'Pick sound',
      flashOnNotification: _$enumDecodeNullable(
              _$FlashWindowsEnumMap, json['flashOnNotification']) ??
          FlashWindows.WhenIdle,
      deliverSound: json['deliverSound'] as String? ?? 'Pick sound',
      notActiveOnDesktop:
          json['notActiveOnDesktop'] as String? ?? 'When I am online',
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'notifyMe': _$PrefMessageNotificationEnumMap[instance.notifyMe],
      'differentSettingsForMobile': instance.differentSettingsForMobile,
      'meetingStart': instance.meetingStart,
      'repliesToThread': instance.repliesToThread,
      'keyword': instance.keyword,
      'duration': instance.duration,
      'from': instance.from,
      'to': instance.to,
      'includePreview': instance.includePreview,
      'muteAll': instance.muteAll,
      'messageSound': instance.messageSound,
      'loungeSound': instance.loungeSound,
      'flashOnNotification':
          _$FlashWindowsEnumMap[instance.flashOnNotification],
      'deliverSound': instance.deliverSound,
      'notActiveOnDesktop': instance.notActiveOnDesktop,
    };

const _$PrefMessageNotificationEnumMap = {
  PrefMessageNotification.AllMessages: 'AllMessages',
  PrefMessageNotification.DirectMessages: 'DirectMessages',
  PrefMessageNotification.None: 'None',
};

const _$FlashWindowsEnumMap = {
  FlashWindows.Never: 'Never',
  FlashWindows.WhenIdle: 'WhenIdle',
  FlashWindows.Always: 'Always',
};

_$_MessagesAndMedia _$$_MessagesAndMediaFromJson(Map<String, dynamic> json) =>
    _$_MessagesAndMedia(
      theme: _$enumDecodeNullable(_$PrefThemeEnumMap, json['theme']) ??
          PrefTheme.Compact,
      name: _$enumDecodeNullable(_$PrefThemeEnumMap, json['name']) ??
          PrefTheme.JustDisplayNames,
      displayInfo: json['displayInfo'] as bool? ?? true,
      showTime: json['showTime'] as bool? ?? false,
      disPlayColor: json['disPlayColor'] as bool? ?? true,
      displayEmojiAsPlain: json['displayEmojiAsPlain'] as bool? ?? false,
      showJumbomoji: json['showJumbomoji'] as bool? ?? true,
      showUploadPreview: json['showUploadPreview'] as bool? ?? true,
      showLinkPreview: json['showLinkPreview'] as bool? ?? true,
      largerThan2: json['largerThan2'] as bool? ?? false,
      showLinkPreviewText: json['showLinkPreviewText'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MessagesAndMediaToJson(_$_MessagesAndMedia instance) =>
    <String, dynamic>{
      'theme': _$PrefThemeEnumMap[instance.theme],
      'name': _$PrefThemeEnumMap[instance.name],
      'displayInfo': instance.displayInfo,
      'showTime': instance.showTime,
      'disPlayColor': instance.disPlayColor,
      'displayEmojiAsPlain': instance.displayEmojiAsPlain,
      'showJumbomoji': instance.showJumbomoji,
      'showUploadPreview': instance.showUploadPreview,
      'showLinkPreview': instance.showLinkPreview,
      'largerThan2': instance.largerThan2,
      'showLinkPreviewText': instance.showLinkPreviewText,
    };

const _$PrefThemeEnumMap = {
  PrefTheme.Clean: 'Clean',
  PrefTheme.Compact: 'Compact',
  PrefTheme.JustDisplayNames: 'JustDisplayNames',
  PrefTheme.FullandDisplaynames: 'FullandDisplaynames',
};

_$_AudioAndVideo _$$_AudioAndVideoFromJson(Map<String, dynamic> json) =>
    _$_AudioAndVideo(
      enableMic: json['enableMic'] as bool? ?? true,
      setMyStatusOnCall: json['setMyStatusOnCall'] as bool? ?? true,
      muteOnMic: json['muteOnMic'] as bool? ?? false,
      setMyStatusInHuddle: json['setMyStatusInHuddle'] as bool? ?? true,
      muteInHuddle: json['muteInHuddle'] as bool? ?? false,
      turnOnCaption: json['turnOnCaption'] ?? false,
      sendAWarning: json['sendAWarning'] ?? false,
      setStatusZuriCall: json['setStatusZuriCall'] ?? true,
      muteMicZuriCall: json['muteMicZuriCall'] ?? false,
      playMusic: json['playMusic'] ?? true,
    );

Map<String, dynamic> _$$_AudioAndVideoToJson(_$_AudioAndVideo instance) =>
    <String, dynamic>{
      'enableMic': instance.enableMic,
      'setMyStatusOnCall': instance.setMyStatusOnCall,
      'muteOnMic': instance.muteOnMic,
      'setMyStatusInHuddle': instance.setMyStatusInHuddle,
      'muteInHuddle': instance.muteInHuddle,
      'turnOnCaption': instance.turnOnCaption,
      'sendAWarning': instance.sendAWarning,
      'setStatusZuriCall': instance.setStatusZuriCall,
      'muteMicZuriCall': instance.muteMicZuriCall,
      'playMusic': instance.playMusic,
    };

_$_Advanced _$$_AdvancedFromJson(Map<String, dynamic> json) => _$_Advanced(
      whenTypyingCode: json['whenTypyingCode'] as bool? ?? false,
      formatMessage: json['formatMessage'] as bool? ?? false,
      writingMessage: _$enumDecodeNullable(
              _$EnterButtonsChoiceEnumMap, json['writingMessage']) ??
          EnterButtonsChoice.sendMsg,
      startZuriChat: json['startZuriChat'] as bool? ?? false,
      quickSwitcher: json['quickSwitcher'] as bool? ?? false,
      excludeThisChannels: (json['excludeThisChannels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      alwaysScrollMessage: json['alwaysScrollMessage'] as bool? ?? true,
      toggleAwayStatus: json['toggleAwayStatus'] as bool? ?? true,
      sendOccasionalSurvey: json['sendOccasionalSurvey'] as bool? ?? true,
      meliciousLinkWarning: json['meliciousLinkWarning'] as bool? ?? true,
    );

Map<String, dynamic> _$$_AdvancedToJson(_$_Advanced instance) =>
    <String, dynamic>{
      'whenTypyingCode': instance.whenTypyingCode,
      'formatMessage': instance.formatMessage,
      'writingMessage': _$EnterButtonsChoiceEnumMap[instance.writingMessage],
      'startZuriChat': instance.startZuriChat,
      'quickSwitcher': instance.quickSwitcher,
      'excludeThisChannels': instance.excludeThisChannels,
      'alwaysScrollMessage': instance.alwaysScrollMessage,
      'toggleAwayStatus': instance.toggleAwayStatus,
      'sendOccasionalSurvey': instance.sendOccasionalSurvey,
      'meliciousLinkWarning': instance.meliciousLinkWarning,
    };

const _$EnterButtonsChoiceEnumMap = {
  EnterButtonsChoice.sendMsg: 'sendMsg',
  EnterButtonsChoice.newLine: 'newLine',
};

_$_DummyUser _$$_DummyUserFromJson(Map<String, dynamic> json) => _$_DummyUser(
      name: json['name'] as String?,
      profileImage: json['profileImage'] as String?,
      id: json['id'] as int? ?? 1,
    );

Map<String, dynamic> _$$_DummyUserToJson(_$_DummyUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profileImage': instance.profileImage,
      'id': instance.id,
    };

_$_Workspace _$$_WorkspaceFromJson(Map<String, dynamic> json) => _$_Workspace(
      id: json['id'] as int?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      logo: json['logo'] as String?,
      user: json['user'] == null
          ? null
          : DummyUser.fromJson(json['user'] as Map<String, dynamic>),
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => DummyUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dms: (json['dms'] as List<dynamic>?)
          ?.map((e) => DM.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentChannel: json['currentChannel'] as int? ?? 0,
      currentDM: json['currentDM'] as int? ?? -1,
    );

Map<String, dynamic> _$$_WorkspaceToJson(_$_Workspace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'logo': instance.logo,
      'user': instance.user,
      'users': instance.users,
      'channels': instance.channels,
      'dms': instance.dms,
      'currentChannel': instance.currentChannel,
      'currentDM': instance.currentDM,
    };

_$_DM _$$_DMFromJson(Map<String, dynamic> json) => _$_DM(
      user: json['user'] == null
          ? null
          : DummyUser.fromJson(json['user'] as Map<String, dynamic>),
      baseChat: json['baseChat'] == null
          ? null
          : BaseChat.fromJson(json['baseChat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DMToJson(_$_DM instance) => <String, dynamic>{
      'user': instance.user,
      'baseChat': instance.baseChat,
    };

_$_Chat _$$_ChatFromJson(Map<String, dynamic> json) => _$_Chat(
      timestamp: json['timestamp'] as int?,
      text: json['text'] as String?,
      user: json['user'] == null
          ? null
          : DummyUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'text': instance.text,
      'user': instance.user,
    };

_$_BaseChat _$$_BaseChatFromJson(Map<String, dynamic> json) => _$_BaseChat(
      chats: (json['chats'] as List<dynamic>?)
          ?.map((e) => Chat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BaseChatToJson(_$_BaseChat instance) =>
    <String, dynamic>{
      'chats': instance.chats,
    };

_$_ChannelResponse _$$_ChannelResponseFromJson(Map<String, dynamic> json) =>
    _$_ChannelResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChannelResponseToJson(_$_ChannelResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_Channel _$$_ChannelFromJson(Map<String, dynamic> json) => _$_Channel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      description: json['description'] as String?,
      private: json['private'] as bool?,
    );

Map<String, dynamic> _$$_ChannelToJson(_$_Channel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'description': instance.description,
      'private': instance.private,
    };

_$_OrganizationResponse _$$_OrganizationResponseFromJson(
        Map<String, dynamic> json) =>
    _$_OrganizationResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Organization.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrganizationResponseToJson(
        _$_OrganizationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$_Organization _$$_OrganizationFromJson(Map<String, dynamic> json) =>
    _$_Organization(
      id: json['id'] as String?,
      logoUrl: json['logoUrl'] as String?,
      name: json['name'] as String?,
      workspaceUrl: json['workspaceUrl'] as String?,
    );

Map<String, dynamic> _$$_OrganizationToJson(_$_Organization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logoUrl': instance.logoUrl,
      'name': instance.name,
      'workspaceUrl': instance.workspaceUrl,
    };

_$_ChannelMessagesResponse _$$_ChannelMessagesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ChannelMessagesResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ChannelMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ChannelMessagesResponseToJson(
        _$_ChannelMessagesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$_ChannelMessage _$$_ChannelMessageFromJson(Map<String, dynamic> json) =>
    _$_ChannelMessage(
      id: json['_id'] as String? ?? '',
      content: json['content'] as String? ?? '',
      channel_id: json['channel_id'] as String? ?? '',
      timestamp: json['timestamp'] as String? ?? '',
      user_id: json['user_id'] as String? ?? '',
    );

Map<String, dynamic> _$$_ChannelMessageToJson(_$_ChannelMessage instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'content': instance.content,
      'channel_id': instance.channel_id,
      'timestamp': instance.timestamp,
      'user_id': instance.user_id,
    };
