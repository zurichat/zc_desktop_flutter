import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/config.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/emoji_view_state.dart';

/// Template class for custom implementation
/// Inhert this class to create your own EmojiPicker
abstract class EmojiPickerBuilder extends StatefulWidget {
  /// Constructor
  EmojiPickerBuilder(this.config, this.state);

  /// Config for customizations
  final EmojiConfig config;

  /// State that holds current emoji data
  final EmojiViewState state;

}
