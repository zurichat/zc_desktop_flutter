// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zc_desktop_flutter/core/enums/pre_bar.dart';
import 'package:zc_desktop_flutter/core/enums/pre_sidebar.dart';

part 'sidebar.freezed.dart';
part 'sidebar.g.dart';

@freezed
class SideBar with _$SideBar {
  const factory SideBar({
    @Default(PreBar.Alpha) @JsonKey(name: 'sidebar_sort' )  PreBar sort,
    @Default(true) @JsonKey(name: 'show_profile_picture_next_to_dm')  bool showPictureNextToDm,
    @Default(false) @JsonKey(name:  'list_private_channels_seperately')  bool listPrivateChannelSeperatley,
    @Default(true) @JsonKey(name: 'organize_external_conversations')  bool organizeExternalConversation,
    @Default(PrefSidebar.AllConversation) @JsonKey(name: 'show_conversations')  PrefSidebar showConversation,
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

  factory SideBar.fromJson(Map<String, dynamic> json) => _$SideBarFromJson(json);
}